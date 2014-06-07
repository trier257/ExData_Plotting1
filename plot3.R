# Read in the data. (The data setup here is the same as in plot1.R.)
# This code requires the zip file be downloaded and unzipped to the current directory.
# The data's big but not so large that it won't fit in my PC's memory.
allData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

# The assignment only deals with the data for Feb 1, 2007 to end of Feb 2, 2007.
# Need to convert data's dates, then subset with them.

# Convert character date and time to a date-time value using strptime.
# http://www.stat.berkeley.edu/classes/s133/dates.html
# Easier to first make a date time character column, then convert it
allData$DateTime <- paste(allData$Date, allData$Time)
allData$DateTime <- strptime(allData$DateTime, format="%d/%m/%Y %H:%M:%S")

# Subset the data to only required days.
# For plot 3 we need the 3 columns with Sub_metering, columns 7, 8, 9. 10 has date-time
bDate <- strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
eDate <- strptime("03/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
subData <- subset(allData, DateTime >= bDate & DateTime < eDate, select=c(7,8,9,10))

# Create a 3-line plot with legend to match the assignment's plot 3.
# Note this plot has no title or x-axis label.
# Used slide 16 from base plotting PDF as guidance.

# Create legend names from data frame rather than re-typing them.
names<-colnames(subData)[1:3]
# Create little vector of colors so don't need to type them twice in plotting
pcolors = c("black", "red", "blue")

# Open the PNG device with the required 480x480.
# Note the background of the professor's figure is transparent.
png(file="plot3.png", bg="transparent", width=480, height=480)
# Now create the plot. The first color is black, but for completeness specify it explicitly
with(subData, plot(DateTime, Sub_metering_1, type="l", col=pcolors[1], ylab="Energy sub metering", xlab=""))
with(subData, lines(DateTime, Sub_metering_2, col=pcolors[2]))
with(subData, lines(DateTime, Sub_metering_3, col=pcolors[3]))
# Helpful: http://www.r-bloggers.com/adding-a-legend-to-a-plot/
legend("topright", col=pcolors, legend=names, lty=c(1,1,1))
dev.off()
