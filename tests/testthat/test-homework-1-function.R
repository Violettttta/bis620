test_that("The num_na function works", {
  expect_equal(num_na(c(1,2,NA,4)), 1)
})

test_that("The status function works", {
  expect_equal(status("Progressive disease"), "Disease")
})

test_that("The status function works", {
  expect_equal(status("Complete response"), "Response")
})

test_that("The status function works", {
  expect_equal(status("Complete"), "ERROR")
})
