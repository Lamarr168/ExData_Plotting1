household_PC <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
household_PC[,1] <- as.Date(household_PC[,1], "%d/%m/%Y")
household_PC_2day <- household_PC[household_PC$Date >= "2007-02-01" & household_PC$Date <= "2007-02-02", ]
household_PC_2day$DateTime <- paste(household_PC_2day[ ,1], household_PC_2day[ ,2])
household_PC_2day$DateTime <- strptime(household_PC_2day$DateTime, "%Y-%m-%d %H:%M:%S")

## Plot 1 -----------------------------------------------------
png("plot1.png", width=480, height=480)
hist(household_PC_2day$Global_active_power, col = 'red',freq = 200, 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
