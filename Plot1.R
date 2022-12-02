#Create Directory:
setwd("C:/Users/KHAWLA/Downloads/COURSERA_PROJECTS/Exploratory Data Analysis/")
# Unzip file:
zipFile<- file.choose()
outDir <-"C:/Users/KHAWLA/Downloads/COURSERA_PROJECTS/Exploratory Data Analysis"
unzip(zipFile,exdir = outDir)
# Load data to R:
library("data.table")
power_consumption<- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
# Change time and date columns to date and time classes:
power_consumption[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
power_consumption[, Time := lapply(.SD, strptime, "%H:%M:%S"), .SDcols = c("Time")]

power_consumption<- power_consumption[(Date>="2007-02-01") & (Date<= "2007-02-02")]

png("plot1.png", width=480, height=480)

power_consumption[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

hist(power_consumption[,Global_active_power], main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency",col = "Red")
