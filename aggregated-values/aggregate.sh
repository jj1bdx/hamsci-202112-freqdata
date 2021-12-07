#!/bin/sh
cat ../measured-values/JJ1BDX_Z_*-freq.txt | awk 'NR > 4' | sort -n > jj1bdx-eclipse-202112-freq.txt
cat ../measured-values/JJ1BDX_Z_*-ampl.txt | awk 'NR > 4' | sort -n > jj1bdx-eclipse-202112-ampl.txt
