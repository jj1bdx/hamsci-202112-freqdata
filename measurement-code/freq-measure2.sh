#!/bin/sh
# Usage:
#  ./freq-measure.sh wav_filename unixdate.with_fraction ppm_offset
# Usage example:
#  ./freq-measure.sh JJ1BDX_Z__2020-12-08_08-19-45.wav 1607415585.218517 -10.4
FILENAME=$1
FILEPATH=`echo "${FILENAME}" | awk 'BEGIN{FS=".";}{printf("%s",$1);for(n=2;n<NF;n++){printf(".%s",$n);}}'`
SRCFILE=${FILEPATH}-freq-source.txt
DSTFILE=${FILEPATH}-freq.txt
#
STARTTIME=$2
PPMOFFSET=$3
#
# 996 ~ 1004Hz
#
sox -t wav ${FILENAME} -t raw --rate 8000 --bits 32 --channels 1 \
    --encoding floating-point --endian little - | \
csdr dsb_fc | \
csdr bandpass_fir_fft_cc 0.1245 0.1255 0.0001 | csdr fmdemod_atan_cf | \
./valuedump2 > ${SRCFILE}
awk -v starttime=${STARTTIME} -v ppm=${PPMOFFSET} \
    'BEGIN{mult = 1.0 + (ppm * 1.0e-6);}{t = $1; v = $2; time = starttime + t * mult; printf("%18.6f %11.6f\n", time, v * 4000.0 / mult);}' \
    ${SRCFILE} > ${DSTFILE}
