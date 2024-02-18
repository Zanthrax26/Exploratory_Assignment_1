data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
new_data <- subset(data, data$Date > "2007-1-31" & data$Date < "2007-2-3")
new_data$Global_active_power = as.numeric(new_data$Global_active_power)
new_data$Sub_metering_1 = as.numeric(new_data$Sub_metering_1)
new_data$Sub_metering_2 = as.numeric(new_data$Sub_metering_2)
new_data$Sub_metering_3 = as.numeric(new_data$Sub_metering_3)
new_data$Global_reactive_power = as.numeric(new_data$Global_reactive_power)
new_data$Voltage = as.numeric(new_data$Voltage)

new_data$Date <- as.POSIXct(paste(new_data$Date, new_data$Time), format="%Y-%m-%d %H:%M:%S")

dev.cur()
par(mfrow = c(2,2))

# 1st plot
plot(new_data$Date, new_data$Global_active_power, type = "l", xaxt='n', ylab = "Global Active Power(kilowatts)", xlab="")
axis(side = 1, at = c(new_data$Date[100], new_data$Date[1500], new_data$Date[2800] ), labels = c("Thu", "Fri", "Sat"))

#2nd plot
plot(new_data$Date, new_data$Voltage, type = "l", xaxt='n', ylab = "Voltage", xlab="datetime")
axis(side = 1, at = c(new_data$Date[100], new_data$Date[1500], new_data$Date[2800] ), labels = c("Thu", "Fri", "Sat"))

#3rd plot
plot(new_data$Date, new_data$Sub_metering_1, type = "n", xaxt='n', ylab = "Energy Sub metering", xlab="")
lines(new_data$Date, new_data$Sub_metering_1)
lines(new_data$Date, new_data$Sub_metering_2, col="red")
lines(new_data$Date, new_data$Sub_metering_3, col="blue")
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=0.5)
axis(side = 1, at = c(new_data$Date[100], new_data$Date[1500], new_data$Date[2800] ), labels = c("Thu", "Fri", "Sat"))


#4th plot
plot(new_data$Date, new_data$Global_reactive_power, type = "l", xaxt='n', ylab = "Voltage", xlab="datetime")
axis(side = 1, at = c(new_data$Date[100], new_data$Date[1500], new_data$Date[2800] ), labels = c("Thu", "Fri", "Sat"))

#Save png
dev.copy(png, "plot4.png",width = 480, height = 480)
dev.off()