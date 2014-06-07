# Read in the data. (The data setup here is the same as in plot1.R.)
# This code requires the zip file be downloaded and unzipped to the current directory.
# The data's big but not so large that it won't fit in my PC's memory.
allData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")

# The assignment only deals with the data for Feb 1, 2007 to end of Feb 2, 2007.
# Need to convert data's dates, then subset with them.

# Convert character date and time to a date-time value using strptime.
# http://www.stat.berkeley.edu/classes/s133/dates.html
allData$datetime <- paste(allData$Date, allData$Time)
allData$datetime <- strptime(allData$datetime, format="%d/%m/%Y %H:%M:%S")

# Subset the data to only required days.
# For plot 4, we need the Global_active_power  Energy sub metering 1, 2, 3,
# Voltage, and Global_reactive_power columns, and the DateTime.
bDate <- strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
eDate <- strptime("03/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
p4Data <- subset(allData, datetime >= bDate & datetime < eDate, select=c(3:5, 7:10))

# Create legend names from data frame rather than re-typing them for the plot3 (lower left) plot.
names<-colnames(p4Data)[4:6]
# Create little vector of colors so don't need to type them twice in plotting
pcolors = c("black", "red", "blue")

# Open the PNG device with the required 480x480.
# Note the background of the professor's figure is transparent.
png(file="plot4.png", bg="transparent", width=480, height=480)
# Set up the 2x2 plot. From Week 1 PlottingBase slide # 18.
par(mfrow = c(2,2))
# The upper left plot is the same as plot 2 -- EXCEPT the y label is slightly different.
# The lower left plot is the same as plot 3 -- EXCEPT no box around the legend.
# Also, the font for the legend might be smaller in the professor's plot. 
# Or, it could be a difference between Mac and PC. I made it slightly smaller here.
#
# The other two plots use datetime and Voltage or Global_reactive_power. No titles or
# special axis labels are used. The 4 slots are filled row-wise from the upper left.
#
# The Voltage and Global_reactive_power graphs have lines that are thicker than the
# professor's example. But setting lwd less than 1 does not change the thickness.
# Apparently some devices won't do anything with line width multipliers less than 1.
with(p4Data, { 
  plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(datetime, Voltage, type="l", lwd=0.8)
  plot(datetime, Sub_metering_1, type="l", col=pcolors[1], ylab="Energy sub metering", xlab="")
    lines(datetime, Sub_metering_2, col=pcolors[2])
    lines(datetime, Sub_metering_3, col=pcolors[3])
    legend("topright", col=pcolors, legend=names, bty="n", lty=c(1,1,1), cex=0.95)
  plot(datetime, Global_reactive_power, type="l", lwd=0.8)
})

dev.off()
