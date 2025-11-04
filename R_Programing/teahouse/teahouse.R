flavor <- tolower(readline("Do you prefer a Light or Bold flavor? "))
caffeine <- tolower(readline("Do you want caffeine? Yes or No: "))

if (flavor == "light" && caffeine == "yes") {
  # Recommend green tea if a user prefers caffeine and a light flavor.
  print("green tea.")
} else if (flavor == "bold" && caffeine == "yes") {
  # Recommend black tea if a user prefers caffeine and a bold flavor.
  print("black tea.")
} else if (flavor == "light" && caffeine == "no") {
  # Recommend chamomile tea if a user prefers no caffeine and a light flavor.
  print("chamomile tea.")
}else if (flavor == "bold" && caffeine == "no") {
  # Recommend rooibos tea if a user prefers no caffeine and a bold flavor.
  print("rooibos tea.")
} else if (!(flavor %in% c("light", "bold"))) {
  print("Invalid flavor input. Please enter 'Light' or 'Bold'.")
} else if (!(caffeine %in% c("yes", "no"))) {
  print("Invalid caffeine input. Please enter 'Yes' or 'No'.")
}






