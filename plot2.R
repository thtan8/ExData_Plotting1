#Location of the file in the working directory.
file1 <- "./household_power_consumption.txt"

#Read the data from the file.
source_data <- read.table(file1, header=TRUE, sep=";", stringsAsFactors=FALSE)

#Subsetting the data from the given dates.
subSet_Data <- source_data[source_data$Date %in% c("1/2/2007","2/2/2007") ,]
#subsetting the date and time from the dataset and combine them together.
date_time <- strptime(paste(subSet_Data$Date, subSet_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSet_Data$Global_active_power)
#Setup the png file.
png("plot2.png", width=480, height=480)

#Produce the plot required
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
