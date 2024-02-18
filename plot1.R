data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
new_data <- subset(data, data$Date > "2007-1-31" & data$Date < "2007-2-3")
new_data$Global_active_power = as.numeric(new_data$Global_active_power)

dev.cur()
hist(new_data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.copy(png, "plot1.png",width = 480, height = 480)
dev.off()

