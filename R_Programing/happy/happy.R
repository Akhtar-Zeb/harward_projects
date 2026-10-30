user <- readline("Country name: ")

year_2020 <- read.csv("2020.csv", row.names = "country")
year_2021 <- read.csv("2021.csv", row.names = "country")
year_2022 <- read.csv("2022.csv", row.names = "country")
year_2023 <- read.csv("2023.csv", row.names = "country")
year_2024 <- read.csv("2024.csv", row.names = "country")

years <- list(
  "2020" = year_2020,
  "2021" = year_2021,
  "2022" = year_2022,
  "2023" = year_2023,
  "2024" = year_2024
)

for (year in names(years)) {
  data <- years[[year]]

  if (user %in% rownames(data)) {

    score <- sum(data[user, ])

    cat(year, ":", round(score, 2), "\n")

  } else {
    cat(year, "Unavailable", "\n")
  }

}
