data <- read.table(file = "./household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = FALSE, dec = ".")
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")



datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, as.numeric(data$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, as.numeric(data$Voltage), type="l", xlab = "datetime", ylab="Voltage")
plot(datetime, as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, as.numeric(data$Sub_metering_2), type = "l", col = "red")
lines(datetime, as.numeric(data$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, as.numeric(data$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()