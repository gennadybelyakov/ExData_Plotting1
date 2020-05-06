twodays <- read.table("household_power_consumption.txt", sep=";", skip = 66637, nrows = 2881L, header=FALSE) ##1 Feb and 2 Feb, plus one datapoint from 3 Feb, 2007  
names(twodays) <- c("Date", "Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3") #getting the headers 
twodays$datetime <- strptime(paste(twodays$Date,twodays$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S") #creating datetime index

replace(twodays,"?", NA) #dealing with missing values

png("plot3.png",width=480,height=480,units="px",pointsize = 12,bg = "white")  #plotting 3rd picture to a file
        plot(twodays$datetime,twodays$Sub_metering_1, main=NULL, xlab = "", ylab="Energy sub metering",type="l")
        lines(twodays$datetime,twodays$Sub_metering_2, col="red",type="l")
        lines(twodays$datetime,twodays$Sub_metering_3, col="blue",type="l")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1,inset=0)
dev.off()