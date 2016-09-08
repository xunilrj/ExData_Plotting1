source("getPackages.R")
source("getData.R")

getPackages(dplyr);
data <- parseFile()

writeLines('Generating image...')
png("plot1.png", width = 480, height = 480)
par(mfrow = c(1, 1))

hist(data$Global_active_power,
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)",
    breaks = 13,   
    col = "red")

axis(1, seq(0, 6, by = 2))
axis(2, seq(0, 1200, by = 200))

dev.off()
writeLines('Finished')