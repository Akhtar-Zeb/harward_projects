remove_na_rows <- function(df, how = "any") {
  if (!how %in% c("any", "all")) {
    stop('Argument "how" must be either "any" or "all".')
  }

  if (how == "any") {
    return(df[!apply(is.na(df), 1, any), ])
  } else {
    return(df[!apply(is.na(df), 1, all), ])
  }
}
