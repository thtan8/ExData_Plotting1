#Location of the file in the working directory.
file1 <- "./household_power_consumption.txt"
#Read the data from the file.
source_data <- read.table(file1, header=TRUE, sep=";", stringsAsFactors=FALSE)
#Subsetting the data from the given dates.
subSet_Data <- source_data[source_data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subSet_Data$Global_active_power)
png("plot1.png", width=480, height=480)
#Plot histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
