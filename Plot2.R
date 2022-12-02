# load the data:
setwd("C:/Users/KHAWLA/Downloads/COURSERA_PROJECTS/Exploratory Data Analysis/")
power_con <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_con) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
attach(power_con)
# subset data from 01/02/2007 to 02/02/2007:
subpower_cons <- subset(power_con,Date=="1/2/2007" | Date =="2/2/2007")
subpower_cons$Date <- as.Date(subpower_cons$Date, format="%d/%m/%Y")
subpower_cons$Time <- strptime(subpower_cons$Time, format="%H:%M:%S")
subpower_cons[1:1440,"Time"] <- format(subpower_cons[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower_cons[1441:2880,"Time"] <- format(subpower_cons[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
# the plot function:
png("plot2.png", width=480, height=480)
plot(subpower_cons$Time,as.numeric(as.character(subpower_cons$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
# annotating graph:
title(main="Global Active Power Vs Time")
dev.off()