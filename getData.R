mypath <- dirname(sys.frame(1)$ofile)
writeLines(sprintf("Running at %s", mypath))
setwd(mypath)

zipFile <- normalizePath(file.path(mypath, "household_power_consumption.zip"))
dataFile <- normalizePath(file.path(mypath, "household_power_consumption.txt"))

writeLines(sprintf('Testing %s exists...', zipFile))
if (!file.exists(zipFile)) {
    writeLines('\tIt does not... Downloading zip file...')
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
    writeLines('\tFinished!')
} else {
    writeLines('\tFile already exists!')
}

writeLines(sprintf('Testing %s exists...', dataFile))
if (!file.exists(dataFile)) {
    writeLines(sprintf('\tUnzipping %s...', zipFile))
    unzip(zipFile)
    writeLines('\tFinished!')
} else {
    writeLines('\tFile already unzipped!')
}

parseFile <- function() {
    writeLines('Parsing data...')
    data <- read.csv(dataFile,
            sep = ';',
            colClasses = c(rep("character", 2), rep("numeric", 7)),
            na.strings = '?') %>%
        filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
        mutate(Timestamp = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %T"))
    writeLines('Finished')
    data
}