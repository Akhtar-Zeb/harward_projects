load("zelda.RData")

zelda <- zelda |>
  mutate(num_producers = str_count(producers, ",") + 1) %>%
  group_by(title) |>
  filter(year == min(year)) |>
  ungroup() |>
  filter(num_producers > 1) |>
  select(-num_producers) |>
  arrange(year, title, system)

save(zelda, file = "5.RData")
