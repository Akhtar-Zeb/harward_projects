load("zelda.RData")

filter <- zelda |>
  filter(str_detect(producers, "Shigeru Miyamoto")) |>
  pull(title) |>
  unique()

zelda <- zelda |>
  filter(title %in% filter) |>
  group_by(title) |>
  filter(year == min(year)) |>
  ungroup() |>
  arrange(year, title, system)

save(zelda, file = "4.RData")
