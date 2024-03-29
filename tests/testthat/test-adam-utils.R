library(tidyr)
library(purrr)
library(dplyr)
library(ggplot2)
library(bis620)

data(AE)
data(RESPEVAL)
data(DEMO)

demo <- DEMO
respeval <- RESPEVAL
ae <- AE

respeval_n <- respeval %>%
  mutate(RSRESP =
           factor(RSRESP,
                  c("Progressive disease", "Stable disease",
                    "Partial response", "Complete response")))
respeval_n <- respeval_n %>% nest(data = -SUBJID)
respeval_n <- respeval_n %>% mutate(nvisits = map_int(data, nrow))
respeval_n$best_response <- map(respeval_n$data, get_best_resp) %>%
  reduce(c)

x <- factor(c("Stable disease"), levels = c("Progressive disease", "Stable disease",
                                                           "Partial response", "Complete response"))

test_that("The get_best_resp function works", {
  expect_equal(get_best_resp(respeval_n$data[[1]]), x)
})

aec <- ae %>%
  mutate(AESEV =
           factor(AESEV,
                  levels = c("Mild", "Moderate", "Severe",
                             "Life threatening", "Fatal")))
aec <- aec %>% mutate(aesev_num = as.integer(AESEV))
aec <- aec %>% nest(aes = -SUBJID)
aec <- aec %>% mutate(num_ae = map_int(aes, nrow))

y <- factor(c("Severe"), levels = c("Mild", "Moderate", "Severe",
                                    "Life threatening", "Fatal"))

test_that("The get_worst_ae function works", {
  expect_equal(get_worst_ae(aec$aes[[1]]), y)
})

z <- factor(c("NA"), levels = c("Mild", "Moderate", "Severe",
                                    "Life threatening", "Fatal"))

test_that("The get_worst_ae function works", {
  expect_equal(get_worst_ae(aec$aes[[225]]), z)
})

ar <- full_join(aec, respeval_n %>% select(SUBJID, nvisits, best_response), by = "SUBJID")
ar <- full_join(ar, demo %>% select(SUBJID, TRT), by = "SUBJID")

test_that("The plot_ae function works", {
  p=plot_ae(ar$aes[[1]])
  expect_true(inherits(p, "ggplot"))
})
