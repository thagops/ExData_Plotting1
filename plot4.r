

pwruse <- read.csv("./power_use_data/household_power_consumption.txt", header = TRUE,  sep = ";", na.strings = "NA", stringsAsFactors = FALSE)
pwruse$Date <- as.Date(pwruse$Date, "%d/%m/%Y")
pwruse <- subset(pwruse, pwruse$Date >= "2007-02-01" & pwruse$Date <= "2007-02-02")
pwruse$Global_active_power <- as.numeric(as.character(pwruse$Global_active_power))
pwruse$Sub_metering_1 <- as.numeric(as.character(pwruse$Sub_metering_1))
pwruse$Sub_metering_2 <- as.numeric(as.character(pwruse$Sub_metering_2))
pwruse <- transform(pwruse, datetime=as.POSIXct(paste(Date, Time)))
pwruse$Voltage <- as.numeric(as.character(pwruse$Voltage))

par(mfcol=c(2,2))

#Plot 1
plot(pwruse$datetime, pwruse$Global_active_power, type = "l", ylab = "Global Active Power (kilowatt)", xlab = " ")

#Plot 2
plot(pwruse$datetime, pwruse$Sub_metering_1, type="l", ylab = "Energy Sub Metering", xlab = " ")
lines(pwruse$datetime, pwruse$Sub_metering_2, col="red")
lines(pwruse$datetime, pwruse$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty = c(1,1), bty = "n", cex = 0.5)

#Plot 3
plot(pwruse$datetime, pwruse$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#Plot 4
plot(pwruse$datetime, pwruse$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

#Copy Plots to PNG File
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()