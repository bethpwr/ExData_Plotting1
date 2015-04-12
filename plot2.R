## Read dataset
dataset <- read.csv("/Users/WanRong/ExploratoryDA1/Data/household_power_consumption.txt", header=T, na.strings="?", sep=';', comment.char="", nrows=2075259, check.names=F, stringsAsFactors=F, quote='\"')
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")


## Subset the data
data_subset <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)


## Convert date and time var to Date/Time classes
DateTime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$DateTime <- as.POSIXct(DateTime)


## Plot 2
plot(data_subset$Global_active_power~data_subset$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")


## Save as png
dev.copy(png, file="plot2.png", width=500, height=500)
dev.off()