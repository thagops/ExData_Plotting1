

pwruse <- read.csv("./power_use_data/household_power_consumption.txt", header = TRUE,  sep = ";", na.strings = "NA", stringsAsFactors = FALSE)
pwruse$Date <- as.Date(pwruse$Date, "%d/%m/%Y")
pwruse <- subset(pwruse, pwruse$Date >= "2007-02-01" & pwruse$Date <= "2007-02-02")
pwruse$Global_active_power <- as.numeric(as.character(pwruse$Global_active_power))
hist(pwruse$Global_active_power, main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)" )

#Copy Plot to PNG File
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()