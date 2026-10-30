air <- read_csv("air.csv")


air <- dplyr::select(air,
          "State", "State-County", "POLLUTANT", "Emissions (Tons)", "SCC LEVEL 1", "SCC LEVEL 2", "SCC LEVEL 3", "SCC LEVEL 4")

air <- dplyr::select(air,
                     state = "State",
                     county = "State-County",
                     pollutant = "POLLUTANT",
                     emissions = "Emissions (Tons)",
                     level_1 = "SCC LEVEL 1",
                     level_2 = "SCC LEVEL 2",
                     level_3 = "SCC LEVEL 3",
                     level_4 = "SCC LEVEL 4")

air

save(air, file = "air.RData")
