library(testthat)
source("believe.R")

test_that("`distribution_price` converts manufacture price to distribution price", {
  expect_equal(distribution_price(100), 76.5)
  expect_equal(distribution_price(250), 191.25)
})

test_that("`distribution_price` handles errors with strings", {
  expect_equal(distribution_price(""), "Invalid input. Please enter a positive number.")
  expect_equal(distribution_price("abc"), "Invalid input. Please enter a positive number.")
})

test_that("`distribution_price` handles errors with negetive number", {
  expect_equal(distribution_price(-2), "Invalid input. Please enter a positive number.")
})

test_that("`distribution_price` handles errors with negetive number", {
  expect_equal(distribution_price(c(1, 2, 3)), "So many numbers. Please provide only one.")
})