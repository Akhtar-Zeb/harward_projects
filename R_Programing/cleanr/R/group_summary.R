group_summary <- function(df, group_by, summarise_col) {
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("The 'dplyr' package is required. Please install it.")
  }

  df |>
    dplyr::group_by(.data[[group_by]]) |>
    dplyr::summarise(
      count = dplyr::n(),
      mean = mean(.data[[summarise_col]], na.rm = TRUE),
      median = median(.data[[summarise_col]], na.rm = TRUE),
      .groups = "drop"
    )
}