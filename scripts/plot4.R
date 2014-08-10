source('scripts/read_power_data.R')
source('scripts/plot2.R')
source('scripts/plot3.R')

# Plot of Voltage over time
plot4_voltage_commands <- function(data) {
  plot(data$Date, data$Voltage, 
       type="l",
       xlab="datetime",
       ylab="Voltage")
}

# Plot of global reactive power over time
plot4_reactive_commands <- function(data) {  
  plot(data$Date, data$Global_reactive_power, 
       type="l",
       xlab="datetime",
       ylab="Global_reactive_power")
}

# Multible base plot
plot4 <- function() {  
  # change local time to force English labels on x-axis
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