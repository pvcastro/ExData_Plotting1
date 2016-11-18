# Load reusable script for loading data
source("load_consumption.R")

consumption <- loadData()

png(filename = "plot3.png", width = 480, height = 480)

plot(consumption$Date_Time, consumption$Sub_metering_1, ylab= "Energy sub metering", xlab = "", main = "", type = "l")

lines(consumption$Date_Time, consumption$Sub_metering_2, type = "l", col = "red")
lines(consumption$Date_Time, consumption$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()