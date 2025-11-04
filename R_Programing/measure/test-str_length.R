library(stringr)
library(testthat)

test_that("`stringr` Count white space", {
  expect_equal(str_length("p_ ! >"), 6)
})

test_that("`stringr` Count Non-alphabetical characters", {
  expect_equal(str_length("akhtar"), 6)
  expect_equal(str_length(""), 0)
  expect_equal(str_length("🎉😂"), 2)
})


test_that("`stringr` Count special values", {
  expect_equal(str_length(NA), NaN)
  expect_equal(str_length(NaN), 3)

})

test_that("`stringr` Count vector", {
  expect_equal(str_length(c("abc", "1234", "1-2-t@g")), c(3, 4, 7))
})


