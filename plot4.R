twodays <- read.table("household_power_consumption.txt", sep=";", skip = 66637, nrows = 2881L, header=FALSE) ##1 Feb and 2 Feb, plus one datapoint from 3 Feb, 2007  
names(twodays) <- c("Date", "Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3") #getting the headers 
twodays$datetime <- strptime(paste(twodays$Date,twodays$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S") #creating datetime index

replace(twodays,"?", NA) #dealing with missing values

png("plot4.png",width=480,height=480,units="px",pointsize = 12,bg = "white") #plotting 4th picture to a file
        
        par(mfrow=c(2,2)) #prepare a layout: plot 2 by 2,  by rows
        
        plot(twodays$datetime,twodays$Global_active_power, main=NULL, xlab = "", ylab="Global Active Power",type="l")
        plot(twodays$datetime,twodays$Voltage, main=NULL, xlab = "datetime", ylab="Voltage",type="l")
        plot(twodays$datetime,twodays$Sub_metering_1, main=NULL, xlab = "", ylab="Energy sub metering",type="l")
        lines(twodays$datetime,twodays$Sub_metering_2, col="red",type="l")
        lines(twodays$datetime,twodays$Sub_metering_3, col="blue",type="l")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty='n')
        plot(twodays$datetime,twodays$Global_reactive_power, main=NULL, xlab = "datetime", ylab="Global_reactive_power",type="l")
dev.off()