library(readr)
library(stringr)
library(dplyr)
library(ggplot2)

file <- read_file(file.path("lyrics/", "beatles.txt"))

file <- str_to_lower(file)

file <- str_replace_all(file,"\\(", "")

file <- str_replace_all(file, "\\)", "")

file <- str_replace_all(file, "\\n", " ")

file <- str_replace_all(file, '\\"', "")

file <- str_replace_all(file, '\\,', "")

file <- str_replace_all(file, '\\-', " ")

file <- str_squish(file)

vector <- str_split(file, " ")[[1]]


word_counts <- list()

for (word in vector) {
  if (word %in% names(word_counts)) {
    word_counts[[word]] <- word_counts[[word]] + 1
  } else {
    word_counts[[word]] <- 1
  }
}

words <- names(word_counts)
counts <- as.integer(word_counts)

data_frame <- data.frame(word = words, counts = counts)

data <- data_frame |> arrange(desc(counts)) |> filter(counts > 5)


plot <- ggplot(data, aes(x = word, y = counts)) +
  geom_col(color = "blue", fill = "lightblue") +
  scale_y_continuous(limits = c(0, 30)) +
  labs(
    x = "Word",
    y = "Count",
    title = "Words Count"
  ) +
  theme_classic()
plot

ggsave("lyrics.png", plot = plot, width = 1200, height = 900, units = "px")
