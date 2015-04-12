## Read dataset
dataset <- read.csv("/Users/WanRong/ExploratoryDA1/Data/household_power_consumption.txt", header=T, na.strings="?", sep=';', comment.char="", nrows=2075259, check.names=F, stringsAsFactors=F, quote='\"')
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")


## Subset the data
data_subset <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)


## Convert date and time var to Date/Time classes
DateTime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$DateTime <- as.POSIXct(DateTime)


## Plot 3

with(data_subset, {
    plot(Sub_metering_1~data_subset$DateTime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~data_subset$DateTime,col='Red')
    lines(Sub_metering_3~data_subset$DateTime,col='Blue')
    
    legend("topright", col=c("black", "red", "blue"), 
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex=0.7)
})


## Save as png
dev.copy(png, file="plot3.png", width=530, height=530)
dev.off()
