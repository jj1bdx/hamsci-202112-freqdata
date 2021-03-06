# hamsci-202112-freqdata

This repository contains [HamSCI December 2021 Eclipse Festival of Frequency Measurement](https://hamsci.org/december-2021-eclipse-festival-frequency-measurement) result from my home station JJ1BDX in Setagaya City, Tokyo, Japan at Grid Locator PM95tp.

## How to recreate and analyze the measured data

* Read [measurement-code/README.md](measurement-code/README.md) first
* Then follow [aggregated-values/README.md](aggregated-values/README.md)
* See [Zenodo archive](https://doi.org/10.5281/zenodo.5774479) (doi: 10.5281/zenodo.5774479) for the raw audio data

## Measurement date and time

1-DEC-2021 0000UTC - 10-DEC-2021 2359UTC

## Measurement equipments

See also [grape-1-testing-log.md](grape-1-testing-log.md) for the configuration details.

* Antenna: 1m-length 30m-band whip at 8m height above the ground
* Receiver: HamSCI Grape 1 with Leo Bodnar mini GPSDO 
* Sound interface: Sabrent audio interface
* Recorded on: running on Ubuntu 20.04.3 x86\_64 (Intel NUC DN2820FYKH with Intel Celeron N2820)
* Recorded 8kHz-rate WAV files at 9999kHz DSB (both USB and LSB merged)
* See [jj1bdx/dcrx-10MHz-design](https://github.com/jj1bdx/dcrx-10MHz-design/) for the further reference.

## Measured data

* Estimated frequency of received AM carrier for the standard frequency stations (BPM, WWVH, WWV were observable)
* Estimated relative amplitude of the carrier (after filtered for the frequency measurement)
* Sound card sampling rate offset (by recording starting and ending time of 86400-second (1-day) reception activity)

## Files in this repository

* add-wavefile-tags/: templates and scripts for adding WAV file tags using [taglib](https://github.com/taglib/taglib)
* aggregated-values/: merged data of from the measured-values/ directory files, and the calculation/estimation/visualization R code
* fldigi-csvs/: fldigi-and-PSWS-compatible CSV output of the estimated data by date
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

![](graphs/graph-20211204.png)
