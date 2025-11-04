test_that("group_summary calculates correct stats", {
  df <- data.frame(region = c("A", "A", "B"), sales = c(100, 200, 150))
  result <- group_summary(df, group_by = "region", summarise_col = "sales")

  expect_equal(nrow(result), 2)
  expect_true("mean" %in% names(result))
  expect_equal(result$mean[result$region == "A"], 150)
})
