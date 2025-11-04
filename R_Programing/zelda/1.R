zelda <- read_csv("zelda.csv")

zelda <- zelda |> separate(release, c("year", "system"), sep = "-")

zelda$year <- zelda$year |>
  str_trim()

zelda$system <- zelda$system |>
  str_trim()

zelda <- pivot_wider(
  zelda,
  names_from = role,
  values_from = names
)


zelda <- zelda |>
  rename(
    directors = Directors,
    producers = Producers,
    designers = Designers,
    programmers = Programmers,
    writers = Writers,
    composers = Composers,
    artists = Artists
  ) |>
  select(title, year, system, directors, producers, designers, programmers, writers, composers, artists)

zelda

save(zelda, file = "zelda.RData")
