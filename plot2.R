# Load reusable script for loading data
source("load_consumption.R")

consumption <- loadData()

png(filename = "plot2.png", width = 480, height = 480)
plot(consumption$Date_Time, consumption$Global_active_power, ylab = "Global Active Power (killowatts)", xlab = "", main = "", type = "l")
dev.off()