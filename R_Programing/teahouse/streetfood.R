spice <- readline("Do you prefer Mild or Spicy food? ")

# Prompt for food type preference
type <- readline("Do you want Vegetarian or Meat? ")

# Normalize input
spice <- tolower(spice)
type <- tolower(type)

# Recommend a Pakistani dish
if (spice == "mild" && type == "vegetarian") {
  cat("Daal Chawal.")
} else if (spice == "spicy" && type == "vegetarian") {
  cat("Chana Masala with paratha.")
} else if (spice == "mild" && type == "meat") {
  cat("Chicken Korma.")
} else if (spice == "spicy" && type == "meat") {
  cat("Beef Biryani.")
} else if (!(spice %in% c("mild", "spicy"))) {
  cat("Invalid spice input. Please enter 'Mild' or 'Spicy'.")
} else if (!(type %in% c("vegetarian", "meat"))) {
  cat("Invalid type input. Please enter 'Vegetarian' or 'Meat'.")
}