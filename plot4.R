source("getPackages.R")
source("getData.R")

getPackages(dplyr);
data <- parseFile()

writeLines('Generating image...')
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(data$Timestamp,
    data$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)")

plot(data$Timestamp,
    data$Voltage,
    type = "l",
    xlab = "datetime",
    ylab = "Voltage")

plot(data$Timestamp, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Timestamp, data$Sub_metering_2, type = "l", col = "red")
lines(data$Timestamp, data$Sub_metering_3, type = "l", col = "blue")
legend("topright",
    bty = "n",
    lty = c(1, 1, 1),
    col = c("black","red","blue"),
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Timestamp,
    data$Global_reactive_power,
    type = "l",
    xlab = "datetime",
    ylab = "Global_reactive_power")

dev.off()
writeLines('Finished')