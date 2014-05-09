## Rick Walsh 5/9/2014  plot2.r

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

## convert to POSIX and extract y axis values for Global Power
x <- as.POSIXct(xval)
y <- as.numeric(as.character(sdata$Global_active_power))

## create plot2 file with proper h and w
png("plot2.png",height=480, width=480)

## plot as Line, with proper labels (no x label)
plot(x,y, type='l',ylab="Global Active Power (kilowatts)",xlab='')
dev.off()

