loadData <- function() {
    if(!file.exists("household_power_consumption.txt")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="consumption.zip", method="auto")
        unzip("consumption.zip")
    }
    
    # Set custom classes to convert some columns in the import step
    setAs("character","DateDMY", function(from) as.Date(from, format="%d/%m/%Y"))
    
    consumption <- read.csv("household_power_consumption.txt", 
                            sep = ";", 
                            na.strings = "?", 
                            stringsAsFactors = FALSE,
                            col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                            colClasses = c("DateDMY", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
    
    consumption <- consumption[consumption$Date == '2007-02-01' | consumption$Date == '2007-02-02',]
    
    consumption$Date_Time <- as.POSIXct(paste(consumption$Date, consumption$Time))
    
    consumption
}