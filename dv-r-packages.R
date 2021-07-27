
install.packages(c("tidyverse", "devtools", "readxl"))

library(devtools)

devtools::install_github("stan-dev/cmdstanr")
devtools::install_github("UUPharmacometrics/PsNR")
devtools::install_bioc("survcomp")
devtools::install_bioc("graph")
devtools::install_bioc("RBGL")

library(readxl)

# list of packages to be installed
raw <-  readxl::read_xlsx("../dv/r4/data/2021-07-26_packages_r41.xlsx")
pkg <- raw$Package

# Check if packages are not installed and assign the
# names of the not yet packages to the variable new.pkg
new.pkg <- pkg[!(pkg %in% installed.packages())]

# if there are any packages in the list that aren't installed,
# install them
if (length(new.pkg)) {
  install.packages(new.pkg, repos = "https://cran.rstudio.com")
}

ip <- installed.packages()
dim(ip)
write.csv(ip, "data/installed-packages.csv")
