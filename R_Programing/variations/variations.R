random_character <- function() {
  # TODO: Return one random letter
  sample(letters, size = 1)
}

print_sequence <- function(length = 20) {
  # TODO: Print a random sequence of specified length
  for (i in 1:length) {
    cat(random_character())
    Sys.sleep(0.25)
  }
}

print_sequence()
