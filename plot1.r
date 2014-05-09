## Rick Walsh 5/9/2014  plot1.r

## set wd and load data table library
setwd("c://users//rick.walsh//desktop//coursera")
library(data.table)

## create data frame to store data from file
s <-data.frame(date, time, numeric(0), numeric(0), numeric(0),  numeric(0), numeric(0), numeric(0), numeric(0)) 

## load the txt file
s <-read.table("household_power_consumption.txt", sep=";", header = TRUE)

## subset so we have only the 2 days required
sdata<-subset(s, Date=="1/2/2007" | Date=="2/2/2007")

## convert active power data into shist for plotting
shist<-as.numeric(as.character(sdata$Global_active_power))

## create the file with proper h and w
png("plot1.png",height=480, width=480)

## create the histogram with proper labels, color
hist(shist, col = "red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", ylim = c(0,1200))
dev.off()

