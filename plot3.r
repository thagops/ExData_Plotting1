

pwruse <- read.csv("./power_use_data/household_power_consumption.txt", header = TRUE,  sep = ";", na.strings = "NA", stringsAsFactors = FALSE)
pwruse$Date <- as.Date(pwruse$Date, "%d/%m/%Y")
pwruse <- subset(pwruse, pwruse$Date >= "2007-02-01" & pwruse$Date <= "2007-02-02")
pwruse$Sub_metering_1 <- as.numeric(as.character(pwruse$Sub_metering_1))
pwruse$Sub_metering_2 <- as.numeric(as.character(pwruse$Sub_metering_2))
pwruse <- transform(pwruse, datetime=as.POSIXct(paste(Date, Time)))
plot(pwruse$datetime, pwruse$Sub_metering_1, type="l", ylab = "Energy Sub Metering", xlab = " ")
lines(pwruse$datetime, pwruse$Sub_metering_2, col="red")
lines(pwruse$datetime, pwruse$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty=c(1,1,1), lwd=c(1,1,1))

#Copy Plot to PNG File
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()