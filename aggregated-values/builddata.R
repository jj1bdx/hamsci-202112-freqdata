# Use TTR in CRAN
library(TTR)
library(tidyverse)
library(lubridate)
# Read base data
freqdata=read.table("jj1bdx-eclipse-202112-freq.txt", header=TRUE)
ampldata=read.table("jj1bdx-eclipse-202112-ampl.txt", header=TRUE)
# Make interpolation functions for the base data
freqfun = stats::approxfun(freqdata$Time, freqdata$Freq)
levelfun = stats::approxfun(ampldata$Time, ampldata$Level)
# UNIX Time:
# 1-DEC-2021 0000UTC -> TZ=UTC date -j 1201000021 "+%s" -> 1638316800
# 7-DEC-2021 0000UTC -> TZ=UTC date -j 1206000021 "+%s" -> 1638835200
# 11-DEC-2021 0000UTC -> TZ=UTC date -j 1211000021 "+%s" -> 1639180800
# Set 60 second offset wider for the start and end time values
starttime=1638316740
endtime=1639180860
timepair=c(starttime:endtime)
# Smoothing for 20 seconds
smoothtime=timepair
smoothfreq=SMA(freqfun(smoothtime),20)
smoothlevel=SMA(levelfun(smoothtime),20)
# Make interpolation functions for the smoothed data
smoothfuntime=timepair
smoothfreqfun=stats::approxfun(smoothtime,smoothfreq)
smoothlevelfun=stats::approxfun(smoothtime,smoothlevel)
