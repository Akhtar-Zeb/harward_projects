load("air.RData")

air <- air |> filter(county == "OR - Curry", .keep_all = TRUE)

save(air, file = "3.RData")
