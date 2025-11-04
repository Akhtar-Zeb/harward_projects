load("air.RData")

air <- air |> filter(county == "OR - Curry", .keep_all = TRUE) |>
arrange(desc(emissions))

save(air, file = "4.RData")
