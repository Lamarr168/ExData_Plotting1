household_PC <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
household_PC[,1] <- as.Date(household_PC[,1], "%d/%m/%Y")
household_PC_2day <- household_PC[household_PC$Date >= "2007-02-01" & household_PC$Date <= "2007-02-02", ]
household_PC_2day$DateTime <- paste(household_PC_2day[ ,1], household_PC_2day[ ,2])
household_PC_2day$DateTime <- strptime(household_PC_2day$DateTime, "%Y-%m-%d %H:%M:%S")

## Plot 4 -----------------------------------------------------
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(household_PC_2day$DateTime, household_PC_2day$Global_active_power,typ='l',
     ylab = 'Global Active Power (kilowatts)',xlab = '')
plot(household_PC_2day$DateTime, household_PC_2day$Voltage,typ='l',
     ylab = 'Voltage',xlab = 'datetime')
plot(household_PC_2day$DateTime, household_PC_2day$Sub_metering_1,typ='l',
     ylab = 'Energy sub metering',col="black",xlab = '') 
points(household_PC_2day$DateTime, household_PC_2day$Sub_metering_2,typ='l',
       ylab = 'Energy sub metering',col="red")
points(household_PC_2day$DateTime, household_PC_2day$Sub_metering_3,typ='l',
       ylab = 'Energy sub metering',col="blue")
legend(x="topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),
       col=c("black","red","blue"),
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),y.intersp = 0.75, bty = "n")
plot(household_PC_2day$DateTime, household_PC_2day$Global_reactive_power,typ='l',
     ylab = 'Global_reactive_power',xlab = 'datetime')
dev.off()