file <- readline("Enter your file name: ")

data <- read.csv(file)

print(paste("Number of pit stops:", nrow(data)))

print(paste("Shortest pit stop:", min(data$time)))

print(paste("Longest pit stop:", max(data$time)))

print(paste("Total time spend:", sum(data$time)))

