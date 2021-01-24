#subsetting the data from "household_power_consumption.txt" for the days 1/2/2007 and 2/2/2007:
power_consump <- read.table("household_power_consumption.txt", header = TRUE, 
                            sep = ";", stringsAsFactors = FALSE, dec = ".")
subpower_consump <- subset(power_consump,power_consump$Date=="1/2/2007" | power_consump$Date =="2/2/2007")

#transforming the Time values to POSIXlt format:
subpower_consump$Time <- strptime(paste(subpower_consump$Date, subpower_consump$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#creating a plot with several graphs
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

with(subpower_consump,{
    plot(subpower_consump$Time,as.numeric(subpower_consump$Global_active_power),type="l", xlab="", ylab="Global Active Power")  
    plot(subpower_consump$Time,as.numeric(subpower_consump$Voltage), type="l", xlab="datetime", ylab="Voltage")
    plot(subpower_consump$Time,subpower_consump$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        with(subpower_consump,lines(Time,as.numeric(Sub_metering_1)))
        with(subpower_consump,lines(Time,as.numeric(Sub_metering_2),col="red"))
        with(subpower_consump,lines(Time,as.numeric(Sub_metering_3),col="blue"))
        legend("topright", lty=1, bty="n", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(subpower_consump$Time,as.numeric(subpower_consump$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.off()