## Exploratory_Data_Analysis
## Project 1
## Plot 2

## Get full dataset
get_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
get_full$Date <- as.Date(get_full$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(get_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(get_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="./Graph_outputs/plot2.png", height=480, width=480)
dev.off()