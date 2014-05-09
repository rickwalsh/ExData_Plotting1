## Rick Walsh 5/9/2014  plot3.r

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

## create plot2 file with proper h and w
png("plot3.png",height=480, width=480)

## plot metering #1 as line graph with label
plot(x,as.numeric(as.character(sdata$Sub_metering_1)), type='l',  ylab="Energy sub metering",xlab='')

## add lines in red and blue for #2 and #3
lines(x, as.numeric(as.character(sdata$Sub_metering_2)), type = "l", col = "red")
lines(x, as.numeric(as.character(sdata$Sub_metering_3)), type = "l", col = "blue")

## add legend at top right
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(1,1), col=c("black","red", "blue"))
dev.off()


