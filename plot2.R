source("getPackages.R")
source("getData.R")

getPackages(dplyr);
data <- parseFile()

writeLines('Generating image...')
png("plot2.png", width = 480, height = 480)
par(mfrow = c(1, 1))

plot(data$Timestamp,
    data$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)")

dev.off()
writeLines('Finished')