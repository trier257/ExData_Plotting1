# Read in the data
# This code requires the zip file be downloaded and unzipped to the current directory.
# Read in the data. It's big but not so large that it won't fit in memory.
allData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

# The assignment only deals with the data for Feb 1, 2007 to end of Feb 2, 2007..
# Need to convert data's dates, then subset with them.

# Convert character date and time to a date-time value using strptime.
# http://www.stat.berkeley.edu/classes/s133/dates.html
# Easier to first make a date time character column, then convert it
allData$DateTime <- paste(allData$Date, allData$Time)
allData$DateTime <- strptime(allData$DateTime, format="%d/%m/%Y %H:%M:%S")

# Subset the data to only required days.
# For plot 1 only need the Global_active_power column (column 3).
# Kept the DateTime column just to confirm correct date-times used.
bDate <- strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
eDate <- strptime("03/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
gapData <- subset(allData, DateTime >= bDate & DateTime < eDate, select=c(3,10))

# Open the PNG device with the required 480x480
png(file="plot1.png", bg="transparent", width=480, height=480)
# Create a histogram to match the assignment's plot 1
hist(gapData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

