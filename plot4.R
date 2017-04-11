#Location of the file in the working directory.
file1 <- "./household_power_consumption.txt"

#Read the data from the file.
source_data <- read.table(file1, header=TRUE, sep=";", stringsAsFactors=FALSE)

#Subsetting the data from the given dates.
subSet_Data <- source_data[source_data$Date %in% c("1/2/2007","2/2/2007") ,]
#subsetting the date and time from the dataset and combine them together.
date_time <- strptime(paste(subSet_Data$Date, subSet_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSet_Data$Global_active_power)
globalReactivePower <- as.numeric(subSet_Data$Global_reactive_power)
voltage <- as.numeric(subSet_Data$Voltage)
subMetering1 <- as.numeric(subSet_Data$Sub_metering_1)
subMetering2 <- as.numeric(subSet_Data$Sub_metering_2)
subMetering3 <- as.numeric(subSet_Data$Sub_metering_3)

#Setup the png file.
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#Produce the plots required
#Plot 1 (Top left)
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Plot 2 (Top right)
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot 3 (Bottom left)
plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")

#Create legend for Plot 3
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")


#Plot 4 (Bottom right)
plot(date_time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
