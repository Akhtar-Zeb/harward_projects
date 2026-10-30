bus <- read.csv("bus.csv")
rail <- read.csv("rail.csv")

services <- rbind(bus, rail)

user_route <- readline(prompt = "Select Your route: ")

if (!(user_route %in% services$route)) {
  print("not a valid route.")
}else {
  route_data <- subset(services, route == user_route)

  route_data$reliability <- round((route_data$numerator / route_data$denominator) * 100)
  print(route_data)

  peak_data <- subset(route_data, peak == "PEAK")
  peak_mean <- round(mean(peak_data$reliability))

  offpeak_data <- subset(route_data, peak == "OFF_PEAK")
  offpeak_mean <- round(mean(offpeak_data$reliability))

  print(paste(peak_mean,"%", sep = ""))
  print(paste(offpeak_mean,"%", sep = ""))

}


