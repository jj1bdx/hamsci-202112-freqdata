# How to analyze the data

Aggregate the contents in ../measured-values by `sh ./aggregate.sh` first.

Invoke R and install the following packages if not done previously:

```R
install.packages("TTR")
install.packages("lubridate")
# installation of tidyverse takes a long time
install.packages("tidyverse")
```

Run the following code for generating PNG graphs and fldigi-compatible data:

```R
source("./builddata.R")
source("./dateplot.R")
source("./pswsdata.R")
```

## What the analysis software does

* Smooth the data by 20-second averaging
* Build the functions by the measured data of frequency and amplitude so that the estimated values by interpolation can be obtained for a given timing in UNIX/POSIX epoch
* dateplot.R: plot the data on a PNG file
* pswsdata.R: output the fldigi-and-PSWS-compatible *estimated* data so that the processing scripts for fldigi and PSWS data can be applied later
