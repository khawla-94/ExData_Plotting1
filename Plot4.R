setwd("C:/Users/KHAWLA/Downloads/COURSERA_PROJECTS/Exploratory Data Analysis/")
power_con <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_con) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
attach(power_con)
subpower_cons <- subset(power_con,Date=="1/2/2007" | Date =="2/2/2007")
subpower_cons$Date <- as.Date(subpower_cons$Date, format="%d/%m/%Y")
subpower_cons$Time <- strptime(subpower_cons$Time, format="%H:%M:%S")
subpower_cons[1:1440,"Time"] <- format(subpower_cons[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower_cons[1441:2880,"Time"] <- format(subpower_cons[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Plot 4: plot with multiple graphs:
png("plot4.png", width=480, height = 480)
par(mfrow=c(2,2))

with(subpower_cons,{
  plot(subpower_cons$Time, as.numeric(as.character(subpower_cons$Global_active_power)), type="l", xlab = "",ylab = "Global Active Power")
  plot(subpower_cons$Time,subpower_cons$Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(subpower_cons$Time,subpower_cons$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
  with(subpower_cons,lines(Time,as.numeric(as.character(Sub_metering_2)), col="red"))
  with(subpower_cons,lines(Time,as.numeric(as.character(Sub_metering_3)), col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(subpower_cons$Time,subpower_cons$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")})
dev.off()