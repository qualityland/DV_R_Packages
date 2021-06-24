library(devtools)

# list of packages
raw <-  read.csv("data/package-names.csv", col.names = c("name"))
pkg <- raw$name

# Check if packages are not installed and assign the
# names of the uninstalled packages to the variable new.pkg
new.pkg <- pkg[!(pkg %in% installed.packages())]

# if there are any packages in the list that aren't installed,
# install them
if (length(new.pkg)) {
  install.packages(new.pkg, repos = "https://cran.rstudio.com")
}

devtools::install_github("stan-dev/cmdstanr")
devtools::install_github("UUPharmacometrics/PsNR")
devtools::install_bioc("survcomp")


ip <- installed.packages()
dim(ip)
write.csv(ip, "data/installed-packages.csv")
