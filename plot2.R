source('read_power_data.R')

# Plot of global active power over time
#
# Args:
#   data: power data as data frame
#   ylab: label text for y axis
plot2_commands <- function(data, ylab = "Global Active Power") {  
  plot(data$Date, data$Global_active_power, 
       type="l",
       xlab="",
       ylab=ylab)
}

# Plot as png file
plot2 <- function() {  
  # change locale time to force English date labels
  Sys.setlocale("LC_TIME", "English")
  
  data <- read_power_data()
  
  # open png device and plot
  png(file = "plots/plot2.png", width=480, height=480) 
  par(bg=NA) # transparent background  
  plot2_commands(data, "Global Active Power (kilowatts)")
  
  dev.off() # device turned off
}