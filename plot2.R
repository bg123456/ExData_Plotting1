
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
png(filename="plot2.png")
plot(timeDate, as.numeric(temp$Global_active_power), type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
