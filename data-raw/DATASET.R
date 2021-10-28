## code to prepare `DATASET` dataset goes here
library(haven)
library(dplyr)

pm_ae <- read_sas("NCT00339183/ae.sas7bdat") %>%
  select(SUBJID, AESTDYI, AESOC) %>%
  mutate(
    AESTDYI = sample(AESTDYI),
    AESOC = sample(AESOC)
  )
usethis::use_data(pm_ae, overwrite = TRUE)

DEMO <- read_sas("data-raw/demo.sas7bdat")
usethis::use_data(DEMO, overwrite = TRUE)

RESPEVAL <- read_sas("data-raw/respeval.sas7bdat")
usethis::use_data(RESPEVAL, overwrite = TRUE)

AE <- read_sas("data-raw/ae.sas7bdat")
usethis::use_data(AE, overwrite = TRUE)
