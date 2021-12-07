# hamsci-202112-freqdata

This repository contains [HamSCI December 2021 Eclipse Festival of Frequency Measurement](https://hamsci.org/december-2021-eclipse-festival-frequency-measurement) result from my home station JJ1BDX in Setagaya City, Tokyo, Japan at Grid Locator PM95tp.

## Measurement date and time

1-DEC-2021 0000UTC - 10-DEC-2021 2359UTC

## Measurement equipments

* Antenna: 1m-length 30m-band whip at 8m height above the ground
* Receiver: HamSCI Grape 1 with Leo Bodnar mini GPSDO 
* Sound interface: Sabrent audio interface
* Recorded on: running on Ubuntu 20.04.3 x86\_64 (Intel NUC DN2820FYKH with Intel Celeron N2820)
* Recorded 8kHz-rate WAV files at 9999kHz DSB (both USB and LSB merged)

## Measured data

* Estimated frequency of received AM carrier for the standard frequency stations (BPM, WWVH, WWV were observable)
* Estimated relative amplitude of the carrier (after filtered for the frequency measurement)
* Sound card sampling rate offset (by recording starting and ending time of 86400-second (1-day) reception activity)

## Files in this repository

* aggregated-values/: merged data of from the measured-values/ directory files, and the calculation/estimation/visualization R code
* graphs/: summary graphs by date
* measured-values/: measured data by analyzing the recorded WAV files
* measurement-code/: the WAV file analysis code in [csdr](https://github.com/ha7ilm/csdr) and C

## Acknowledgment

* Kristina Collins, KD8OXT
* [HamSCI](https://www.hamsci.org) people and community
* [Pepabo R&D Institute, GMO Pepabo, Inc.](https://rand.pepabo.com), for their financial and moral support

## LICENSE

CC0

## Measurement result summary example as the graph for 4-DEC-2021

TBD

<!-- ![](graphs/graph-20210610.png) -->
