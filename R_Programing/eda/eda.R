library(tidyverse)
library(ggplot2)
library(readr)

sale <- read_csv("sales.csv")

sale$month <- factor(sale$month, levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))

plot <- ggplot(sale, aes(x = month, y = sale)) +
  geom_line(group = 1) +
  geom_point(
    color = "red",
    fill = "lightblue",
    size = 3
  ) +
  scale_y_continuous(limits = c(1000, 6000)) +
  labs(
    x = "Month",
    y = "Sales",
    title = "Month Wise Sale 2019"
  ) +
  theme_classic() +
  theme(
    plot.title = element_text(hjust = 0.5)  # Center the title
  )

ggsave("visualization.png", plot, width = 1600, height = 800, units = "px")

