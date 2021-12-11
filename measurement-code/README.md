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
