#subsetting the data from "household_power_consumption.txt" for the days 1/2/2007 and 2/2/2007:
power_consump <- read.table("household_power_consumption.txt", header = TRUE, 
                            sep = ";", stringsAsFactors = FALSE, dec = ".")
subpower_consump <- subset(power_consump,power_consump$Date=="1/2/2007" | power_consump$Date =="2/2/2007")

#transforming the Time values to POSIXlt format:
subpower_consump$Time <- strptime(paste(subpower_consump$Date, subpower_consump$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#creating a plot
activepower <- as.numeric(subpower_consump$Global_active_power)
png("plot2.png", width=480, height=480)
plot(subpower_consump$Time, activepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()