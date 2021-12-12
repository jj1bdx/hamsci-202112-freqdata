# How to recreate the data

* Compile valuedump2 by `cc -O3 -o valuedump2 valuedump2.c`
* Put received audio WAV files in this directory
* Measure the start time in UNIX/POSIX Epoch and the pitch offset in ppm
  - Refer to conversion-memo.txt
  - The result is already in timestamps.txt
* Use the conversion scripts ampl-measure2.sh and freq-measure2.sh to obtain the results
  - *-ampl.txt: amplitude in dB
  - *-freq.txt: frequency in Hz
* Copy the result files to ../measured-values/
* See ../aggregated-values/README.md for the further computation with R

## What the measurement scripts do

* Convert input data to 8kHz 32bit floating-point little-endian sequence
* Convert input stream to an IQ signal flow (of DSB by setting the complex part to zero)
* Filter out unnecessary components out of 996 to 1004Hz then demodulate the extracted signal (presumable closer to a sine wave) (in the amplitude-decode script, the output is the complex absolute value)
* Smooth the value by sum averaging (in 4 seconds or 32000 samples)
*  Convert the calculated data to the actual frequency
  - Note 1: Since each measured second period (8000 samples) is not really the exact one second, this should be corrected in the received timestamps.
  - Note 2: the factor "mult" is given from the pitch offset. If the pitch is -10ppm, the result should be divided by (1 - 10e-6) so that the corrected frequency is higher than the calculated one.
  - Note 3: for the amplitude, only the timestamp correction is required.

In the actual shell script of freq-measure2.sh:

```
# convert input data to 8kHz 32bit floating-point little-endian sequence
sox -t wav ${FILENAME} -t raw --rate 8000 --bits 32 --channels 1 \
    --encoding floating-point --endian little - | \
# convert input stream to an IQ signal flow
# (of DSB by setting the complex part to zero)
csdr dsb_fc | \
# Filter out unnecessary components out of 996 to 1004Hz
# then demodulate the extracted signal (presumable closer to a sine wave)
# (in the amplitude-decode script, the output is the complex absolute value)
csdr bandpass_fir_fft_cc 0.1245 0.1255 0.0001 | csdr fmdemod_atan_cf | \
# Smooth the value by sum averaging (in 4 seconds or 32000 samples)
./valuedump2 > ${SRCFILE}
# Convert the calculated data to the actual frequency
#
# Note 1: Since each measured second period (8000 samples) is not really
# the exact one second, this should be corrected in the received timestamps.
#
# Note 2: the factor "mult" is given from the pitch offset
# If the pitch is -10ppm, the result should be divided by (1 - 10e-6)
# so that the corrected frequency is higher than the calculated one.
#
# Note 3: for the amplitude, only the timestamp correction is required.
#
awk -v starttime=${STARTTIME} -v ppm=${PPMOFFSET} \
    'BEGIN{mult = 1.0 + (ppm * 1.0e-6);}{t = $1; v = $2; time = starttime + t * mult; printf("%18.6f %11.6f\n", time, v * 4000.0 / mult);}' \
    ${SRCFILE} > ${DSTFILE}
```
