df1 <- data.frame(a = c(1, NA, 3), b = c(4, NA, 6))

df1 <- remove_na_rows(df1, how = "any")

df2 <- data.frame("First Name" = "Alice", "Age (Years)" = 30)

df2 <- standardize_column_names(df2)

df3 <- data.frame(region = c("A", "A", "B"), sales = c(100, 200, 150))

df3 <- group_summary(df3, "region", "sales")





