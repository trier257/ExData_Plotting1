## Project 1: 4 Plots
4 Plots in 4 R files with 4 PNGs.

### Running the Code
* Before running this code, the project datafile needs to be downloaded and unzipped into a
directory.
* To run a program, open R, set the working directory to where the unzipped file is,
and source the code file (R console).
* The plot is created in the current working directory.

### Plot 1
This plot is created with the R script plot1.R. This script will read in the entire datafile,
combine dates and times into one date-time field and then subset the dataset to just
the dates of interest, namely Feb. 1 - 2, 2007. Doing this takes a few moments but the
memory used is easily within the capacity of my PC.

The histogram is created with the Global Active Power column and 
saved to a 480x480 PNG file. The background of this plot
and the others is kept transparent to match the professor's example.

### Plot 2
This plot is created with plot2.R, which uses the same reading, date handling, and subsetting
code as plot1.R. Here a line plot is created by setting type="l" in the plot command. The
assignment plot example has no title and no X-axis label, which is replicated in this plot.

### Plot 3
The R code in plot3.R creates this plot, again using the same reading, date handling and
subsetting as plot1.R. A single plot with the 3 sub-metering data lines
is created by adding lines to the starting
plot with the first line. This plot also has no title or x-axis label.

### Plot 4
plot4.R creates this plot-of-4-plots. The upper left and lower left are essentially
the same as plots 2 and 3, with some minor differences. The upper left plot has a slightly
different Y-axis label from plot 2. The lower left does not have a box around the
legend like plot 3. 

The other 2 plots are new for plot 4. The upper right plots Voltage against datetime;
the lower right has Global_reactive_power against datetime. The x- and y- labels are 
just the column names; this matches the professor's figure.

The lines in these plots look thicker than the professor's plots. I tried making the
lines thinner with lwd=(0.8) (and other numbers) but it appears that on my PC, line
multipliers less than 1 are ignored as setting lwd less than 1 made no change to the
line thickness.
 

## Introductions For Assignment
These are the original assignment instructions for project 1, kept for reference purposes. The
original figures in the figures subdirectory are the originals.

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data

When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

