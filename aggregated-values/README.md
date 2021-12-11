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

