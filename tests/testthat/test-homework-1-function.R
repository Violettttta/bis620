test_that("The num_na function works", {
  expect_equal(num_na(c(1,2,NA,4)), 1)
})

test_that("The larger function works", {
  expect_equal(larger(1,2), 2)
})

test_that("The larger function works", {
  expect_equal(larger(2,1), 2)
})
