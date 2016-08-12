
#read data
dat<-read.table("household_power_consumption.txt", sep=";", header = TRUE)

#convert ? to NA values
dat[dat == "?"] = NA

#convert date column to date format
dat$Date<-as.Date(dat$Date, "%d/%m/%Y")

#store start and end dates
startDate <- as.Date("01/02/2007", "%d/%m/%Y")
endDate <- as.Date("02/02/2007", "%d/%m/%Y")

#subset data
temp<-subset(dat, (dat$Date==startDate | dat$Date==endDate))

#use strptime for time and date in one var
timeDate<-strptime(paste(temp$Date,temp$Time),format="%Y-%m-%d %H:%M:%S")

#plot histogram
png(filename="plot3.png")
plot(timeDate, as.numeric(temp$Sub_metering_1), type = "l", 
     xlab = "", ylab = "Energy Sub Metering", col = "black")
lines(timeDate, as.numeric(temp$Sub_metering_2), col = "red")
lines(timeDate, as.numeric(temp$Sub_metering_3), col = "blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
