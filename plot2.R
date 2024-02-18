data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
new_data <- subset(data, data$Date > "2007-1-31" & data$Date < "2007-2-3")
new_data$Global_active_power = as.numeric(new_data$Global_active_power)

new_data$Date <- as.POSIXct(paste(new_data$Date, new_data$Time), format="%Y-%m-%d %H:%M:%S")

dev.cur()
plot(new_data$Date, new_data$Global_active_power, type = "l", xaxt='n', ylab = "Global Active Power(kilowatts)", xlab="")
axis(side = 1, at = c(new_data$Date[100], new_data$Date[1500], new_data$Date[2800] ), labels = c("Thu", "Fri", "Sat"))
dev.copy(png, "plot2.png",width = 480, height = 480)
dev.off()

