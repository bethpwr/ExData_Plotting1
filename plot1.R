## Read dataset
dataset <- read.csv("/Users/WanRong/ExploratoryDA1/Data/household_power_consumption.txt", header=T, na.strings="?", sep=';', comment.char="", nrows=2075259, check.names=F, stringsAsFactors=F, quote='\"')
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")


## Subset the dataset
## Use data from the dates 2007-02-01 and 2007-02-02
data_subset <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)


## Convert the date and time var to Date/Time classes
DateTime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(DateTime)


## Plot 1
hist(data_subset $Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


## Save to file
dev.copy(png, file="plot1.png", height=500, width=500)
dev.off()