distribution_price <- function(number = 100) {

  if (length(number) != 1) {
    return("So many numbers. Please provide only one.")
  }

  number <- suppressWarnings(as.numeric(number))

  if (is.na(number) || number < 0) {
    return("Invalid input. Please enter a positive number.")
  }

  trade_price <- number - (0.15 * number)
  distribution_rate <- trade_price - (0.10 * trade_price)

  return(distribution_rate)
}