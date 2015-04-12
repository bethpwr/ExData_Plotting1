## Read dataset
dataset <- read.csv("/Users/WanRong/ExploratoryDA1/Data/household_power_consumption.txt", header=T, na.strings="?", sep=';', comment.char="", nrows=2075259, check.names=F, stringsAsFactors=F, quote='\"')
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")


## Subset the data
data_subset <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)


## Convert date and time var to Date/Time classes
DateTime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$DateTime <- as.POSIXct(DateTime)


## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_subset, {   
    plot(Global_active_power~data_subset$DateTime, type="l", 
         ylab="Global Active Power", xlab="")
    
    plot(Voltage~data_subset$DateTime, type="l", 
         ylab="Voltage", xlab="")
    
    plot(Sub_metering_1~data_subset$DateTime, type="l", 
         ylab="Energy sub metering", xlab="")
    legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, bty="n", box.lwd=0, 
           cex=0.5)
    
    
    
    lines(Sub_metering_2~data_subset$DateTime,col='Red')
    lines(Sub_metering_3~data_subset$DateTime,col='Blue')
    
    plot(Global_reactive_power~data_subset$DateTime, type="l", 
         ylab="Global Reactive Power",xlab="")
    
})

dev.copy(png, file="plot4.png", width=530, height=530)
dev.off()