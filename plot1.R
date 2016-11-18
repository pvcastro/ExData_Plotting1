# Load reusable script for loading data
source("load_consumption.R")

consumption <- loadData()

png(filename = "plot1.png", width = 480, height = 480)
hist(consumption$Global_active_power, col="red", xlab= "Global Active Power (killowatts)", ylab = "Frequency", main="Global Active Power")
dev.off()