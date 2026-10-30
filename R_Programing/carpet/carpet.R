calculate_growth_rate <- function(years, visitors) {
  # TODO: Calculate yearly growth of visitors
  first_year <- years[1]
  last_year <- years[length(years)]

  first_visitor <- visitors[1]
  last_visitor <- visitors[length(visitors)]

  growth_rate <- (last_visitor - first_visitor) / (last_year - first_year)

  return(growth_rate)
}

predict_visitors <- function(years, visitors, year) {
  # TODO: Predict visitors in given year
  growth_rate <- calculate_growth_rate(years, visitors)

  latest_year <- years[length(years)]
  latest_visitors <- visitors[length(visitors)]

  years_ahead <- year - latest_year

  predicted_visitors <- latest_visitors + years_ahead * growth_rate

}

visitors <- read.csv("visitors.csv")
year <- as.integer(readline("Year: "))
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)
cat(paste0(predicted_visitors, " million visitors\n"))
