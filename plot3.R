source("getPackages.R")
source("getData.R")

getPackages(dplyr);
data <- parseFile()

writeLines('Generating image...')
png("plot3.png", width = 480, height = 480)
par(mfrow = c(1, 1))

plot(data$Timestamp, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Timestamp, data$Sub_metering_2, type = "l", col = "red")
lines(data$Timestamp, data$Sub_metering_3, type = "l", col = "blue")
legend("topright",    
    lty = c(1, 1, 1),
    col = c("black","red","blue"),
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
writeLines('Finished')