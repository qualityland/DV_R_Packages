
# list of packages to be installed
raw <-  read.csv("data/package-names.csv", col.names = c("name"))
pkg <- raw$name

# Check if packages are not installed and assign the
# names of the not yet packages to the variable new.pkg
new.pkg <- pkg[!(pkg %in% installed.packages())]

# if there are any packages in the list that aren't installed,
# install them
if (length(new.pkg)) {
  install.packages(new.pkg, repos = "https://cran.rstudio.com")
}

install.packages(c("tidyverse", "devtools"))

library(devtools)

devtools::install_github("stan-dev/cmdstanr")
devtools::install_github("UUPharmacometrics/PsNR")
devtools::install_bioc("survcomp")


ip <- installed.packages()
dim(ip)
write.csv(ip, "data/installed-packages.csv")
