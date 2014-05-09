## Rick Walsh 5/9/2014  plot4.r

## set wd and load data table library
setwd("c://users//rick.walsh//desktop//coursera")
library(data.table)

## create data frame to store data from file
s <-data.frame(date, time, numeric(0), numeric(0), numeric(0),  numeric(0), numeric(0), numeric(0), numeric(0)) 

## load the txt file
s <-read.table("household_power_consumption.txt", sep=";", header = TRUE)

## subset so we have only the 2 days required
sdata<-subset(s, Date=="1/2/2007" | Date=="2/2/2007")

## build the x axis values from the date and time columns using strptime and paste
xval<-strptime(paste(sdata[,1],sdata[,2]),format="%d/%m/%Y %H:%M:%S")
x <- as.POSIXct(xval)

## get y value for first plot as Global Active Power
y <- as.numeric(as.character(sdata$Global_active_power))

## open the file, set w and h
png("plot4.png", width=480, height=480)

## set up a 2 x 2 area for the 4 plots
par(mfcol=c(2,2))

## run the Global Power plot
plot(x,y, type='l',ylab="Global Active Power",xlab='')

## run the plot 2 graph
plot(x,as.numeric(as.character(sdata$Sub_metering_1)), type='l',  ylab="Energy sub metering",xlab='')
lines(x, as.numeric(as.character(sdata$Sub_metering_2)), type = "l", col = "red")
lines(x, as.numeric(as.character(sdata$Sub_metering_3)), type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=c(1,1), lwd=c(1,1), col=c("black","red", "blue"))

## add new plot for Voltage with label as in example
plot(x,as.numeric(as.character(sdata$Voltage)), type='l',ylab="Voltage",xlab='datetime')

## add new plot for Reactive Power with label as in example
plot(x,as.numeric(as.character(sdata$Global_reactive_power)), type='l',ylab="Global_reactive_power",xlab='datetime')

dev.off()


