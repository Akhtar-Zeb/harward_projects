load("air.RData")

air <- air |>
  group_by(source = level_1, pollutant) |>
  summarize(emissions = sum(emissions, na.rm = TRUE), .groups = "drop") |>
  arrange(source, pollutant)

save(air, file = "7.RData")
