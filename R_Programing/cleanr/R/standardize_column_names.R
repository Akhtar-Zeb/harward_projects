standardize_column_names <- function(df) {
  original_names <- names(df)

  cleaned_names <- sapply(original_names, function(name) {
    name <- tolower(name)
    name <- gsub("[^a-z0-9_]", "_", name)
    name <- gsub("_{2,}", "_", name)
    name <- gsub("^_|_$", "", name)
    return(name)
  })

  names(df) <- cleaned_names

  return(df)
}