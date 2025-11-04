test_that("standardize_column_names cleans column names", {
  df <- data.frame("First Name" = c("Alice"), "Age (Years)" = c(30))
  cleaned <- standardize_column_names(df)
  expect_equal(names(cleaned), c("first_name", "age_years"))
})