## reading data
data<-read.csv("./household_power_consumption.txt",header = TRUE, 
               na.strings = "?", sep = ";")
## formatting Date from Factor to Date
data$Date<-as.Date( x = data$Date, format = "%d/%m/%Y")
## searching rows only for 2007-02-01 and 2007-02-02
pldata <- data[grep("2007-02-0[12]",data$Date),]
## plotting
hist (pldata$Global_active_power, xlab = "Global Active Power (kilowatts)", 
      ylab = "Frequency", main = "Global Active Power", col = "red")
## saving to png file
dev.copy(png, file = "./plot1.png", width = 480, height = 480)
dev.off()
