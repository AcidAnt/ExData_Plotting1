source('read_power_data.R')

# Histogram of the frequency of global active power (in kilowatts)
#
# Args:
#   data: power data as data frame
plot1_commands <- function(data) {
  hist(data$Global_active_power, 
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", 
       ylab="Frequency", 
       col="red")
}

# Histogram as png file
plot1 <- function() {
  data <- read_power_data()
  
  # open png device and plot histogram
  png(file = "plots/plot1.png", width=480, height=480) 
  par(bg=NA) # transparent background 
  plot1_commands(data)
  
  dev.off() # device turned off
}