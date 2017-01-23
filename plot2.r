

pwruse <- read.csv("./power_use_data/household_power_consumption.txt", header = TRUE,  sep = ";", na.strings = "NA", stringsAsFactors = FALSE)
pwruse$Date <- as.Date(pwruse$Date, "%d/%m/%Y")
pwruse <- subset(pwruse, pwruse$Date >= "2007-02-01" & pwruse$Date <= "2007-02-02")
pwruse$Global_active_power <- as.numeric(as.character(pwruse$Global_active_power))
pwruse <- transform(pwruse, datetime=as.POSIXct(paste(Date, Time)))
plot(pwruse$datetime, pwruse$Global_active_power, type = "l", ylab = "Global Active Power (kilowatt)", xlab = " ")

#Copy Plot to PNG File
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()