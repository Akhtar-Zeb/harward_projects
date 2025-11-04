test_that("remove_na_rows works correctly", {
  df <- data.frame(a = c(1, NA, 3), b = c(4, NA, 6))
  result_any <- remove_na_rows(df, how = "any")
  expect_equal(nrow(result_any), 2)

  df2 <- data.frame(a = c(NA, NA, 3), b = c(NA, NA, 4))
  result_all <- remove_na_rows(df2, how = "all")
  expect_equal(nrow(result_all), 1)
})