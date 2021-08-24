# installs all packages from wish list including dependencies

# pre-requisites
install.packages(c("tidyverse", "devtools", "readxl"))

library(devtools)
library(readxl)

# packages only available on GitHub
devtools::install_github("stan-dev/cmdstanr")
devtools::install_github("UUPharmacometrics/PsNR")
devtools::install_github("RhoInc/safetyexploreR")
devtools::install_github("gadenbuie/xaringanExtra")
devtools::install_bioc("survcomp")
devtools::install_bioc("graph")
devtools::install_bioc("RBGL")
devtools::install_bioc("ComplexHeatmap")
devtools::install_bioc("impute")
devtools::install_bioc("preprocessCore")
devtools::install_bioc("AnnotationDbi")
devtools::install_bioc("GO.db")


# package wish list
raw <-  readxl::read_xlsx("../dv/r4/data/2021-08-23_R_package_wish_list.xlsx")
pkg <- raw$package

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
write.csv(ip, "data/2021-08-23 _installed-packages.csv")
