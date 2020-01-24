data <- read.table(file = "./household_power_consumption.txt", header = T, sep = ";")
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
realdata <- transform(data, Date = format(as.Date(Date, format = "%d/%m/%y"),"%Y-%m-%d"), Time = format(strptime(Time, format = "%H:%M:%S"),"%H:%M:%S"))

png("plot1.png", width=480, height=480)
hist(as.numeric(data$Global_active_power)/500, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



