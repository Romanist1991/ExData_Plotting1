#subsetting the data from "household_power_consumption.txt" for the days 1/2/2007 and 2/2/2007:
power_consump <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", stringsAsFactors = FALSE, dec = ".")
subpower_consump <- subset(power_consump,power_consump$Date=="1/2/2007" | power_consump$Date =="2/2/2007")

#creating a histogram
activepower <- as.numeric(subpower_consump$Global_active_power)
png("plot1.png", width=480, height=480)
hist(activepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()