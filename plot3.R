#subsetting the data from "household_power_consumption.txt" for the days 1/2/2007 and 2/2/2007:
power_consump <- read.table("household_power_consumption.txt", header = TRUE, 
                            sep = ";", stringsAsFactors = FALSE, dec = ".")
subpower_consump <- subset(power_consump,power_consump$Date=="1/2/2007" | power_consump$Date =="2/2/2007")

#transforming the Time values to POSIXlt format:
subpower_consump$Time <- strptime(paste(subpower_consump$Date, subpower_consump$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#creating a plot
png("plot3.png", width=480, height=480)
plot(subpower_consump$Time,subpower_consump$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpower_consump,lines(Time,as.numeric(Sub_metering_1),type="l"))
with(subpower_consump,lines(Time,as.numeric(Sub_metering_2),type="l",col="red"))
with(subpower_consump,lines(Time,as.numeric(Sub_metering_3),type="l",col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()