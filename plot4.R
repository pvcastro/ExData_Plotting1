# Load reusable script for loading data
source("load_consumption.R")

consumption <- loadData()

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(consumption$Date_Time, consumption$Global_active_power, ylab= "Global Active Power", xlab = "", main = "", type = "l")

plot(consumption$Date_Time, consumption$Voltage, ylab= "Voltage", xlab = "datetime", main = "", type = "l")

plot(consumption$Date_Time, consumption$Sub_metering_1, ylab= "Energy sub metering", xlab = "", main = "", type = "l")
lines(consumption$Date_Time, consumption$Sub_metering_2, type = "l", col = "red")
lines(consumption$Date_Time, consumption$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(consumption$Date_Time, consumption$Global_reactive_power, ylab= "Global Reactive Power", xlab = "datetime", main = "", type = "l")

dev.off()