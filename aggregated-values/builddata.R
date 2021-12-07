# Use TTR in CRAN
library(TTR)
library(tidyverse)
library(lubridate)
# Read base data
freqdata=read.table("jj1bdx-eclipse-202106-freq.txt", header=TRUE)
ppsdata=read.table("jj1bdx-eclipse-202106-pps.txt", header=TRUE)
# Make interpolation functions for the base data
freqfun = stats::approxfun(freqdata$Time, freqdata$Freq)
levelfun = stats::approxfun(ppsdata$Time, ppsdata$Level)
# UNIX Time:
# 8-DEC-2020 2358UTC -> TZ=UTC date -j 1208235820 "+%s" -> 1607471880
# 7-JUN-2021 0000UTC -> TZ=UTC date -j 0607000021 "+%s" -> 1623024000
# 13-JUN-2021 0000UTC -> TZ=UTC date -j 0613000021 "+%s" -> 1623542400
# Smoothing for a minute (60 seconds)
smoothtime=c(1623024000:1623542400)
smoothfreq=SMA(freqfun(smoothtime),60)
smoothlevel=SMA(levelfun(smoothtime),60)
# Make interpolation functions for the smoothed data
smoothfuntime=c(1623024000:1623542400)
smoothfreqfun=stats::approxfun(smoothtime,smoothfreq)
smoothlevelfun=stats::approxfun(smoothtime,smoothlevel)
