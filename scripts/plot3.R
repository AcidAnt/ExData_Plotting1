source('scripts/read_power_data.R')

# Plot of energy sub metering 1-3 over time
plot3_commands <- function(data, legend_bty="n") {
  plot(data$Date, data$Sub_metering_1, 
       type="l",
       xlab="",
       ylab="Energy sub metering")
  lines(d$Date, d$Sub_metering_2, col = "red")
  lines(d$Date, d$Sub_metering_3, col = "blue")
  
  # legend on topright corner
  legend("topright", 
         lty="solid",
         bty=legend_bty,
         col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

# Plot as png file
plot3 <- function() {
  # change local time to force English date labels
  Sys.setlocale("LC_TIME", "English")
  
  data <- read_power_data()
  
  # open png device and plot histogram
  png(file = "plots/plot3.png", width=480, height=480)
  par(bg=NA) # transparent background 
  plot3_commands(data, "o")
  
  dev.off() # device turned off
}