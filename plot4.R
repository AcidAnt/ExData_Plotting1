source('read_power_data.R')
source('plot2.R')
source('plot3.R')

# Plot of Voltage over time
#
# Args:
#   data: power data as data frame
plot4_voltage_commands <- function(data) {
  plot(data$Date, data$Voltage, 
       type="l",
       xlab="datetime",
       ylab="Voltage")
}

# Plot of global reactive power over time
#
# Args:
#   data: power data as data frame
plot4_reactive_commands <- function(data) {  
  plot(data$Date, data$Global_reactive_power, 
       type="l",
       xlab="datetime",
       ylab="Global_reactive_power")
}

# Multible base plot as png file
plot4 <- function() {  
  # change locale time to force English labels on x-axis
  Sys.setlocale("LC_TIME", "English")
  
  data <- read_power_data()
  
  # open png device and plot (2 rows, 2 cols)
  png(file = "plots/plot4.png", width=480, height=480) 
  
  par(mfrow = c(2, 2), bg=NA) # set rows/cols, background
  
  with(data, {
    plot2_commands(data)
    plot4_voltage_commands(data)
    plot3_commands(data)
    plot4_reactive_commands(data)
  })
  
  dev.off() # device turned off
}