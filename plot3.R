## reading data
data<-read.csv("./household_power_consumption.txt",header = TRUE, 
               na.strings = "?", sep = ";")
## formatting Date and Time from Factor to Date
data$Date<-as.Date( x = data$Date, format = "%d/%m/%Y")
## searching rows only for 2007-02-01 and 2007-02-02
pldata <- data[grep("2007-02-0[12]",data$Date),]
## setting Date and Time together (to the list) 
dateTime   <- as.POSIXlt(paste(as.Date(pldata$Date, format="%d/%m/%Y"), 
                               pldata$Time, sep=" "))
## solving problem with language of days names
backup_locale <- Sys.getlocale('LC_TIME')
Sys.setlocale('LC_TIME', 'C')
## plotting
plot(dateTime,pldata$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering", col = "black" )
lines(dateTime,pldata$Sub_metering_2, col = "red"  )
lines(dateTime,pldata$Sub_metering_3, col = "blue" )
legend("topright", legend = c("Sub_metering_1","Sub_metering_2" 
       ,"Sub_metering_3" ), lty = c(1,1,1) , col = c("black", "red", "blue"),cex = 0.6)
## saving to png file
dev.copy(png, file = "./plot3.png", width = 480, height = 480)
dev.off()
Sys.setlocale('LC_TIME', backup_locale)