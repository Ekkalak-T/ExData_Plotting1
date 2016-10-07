#Plot 4 graphs in one time
plot4 <- function(){
  
  #Define specific date to plot data within interested area  
  startDate <- as.Date("2007-02-01",format = "%Y-%m-%d")
  endDate <- as.Date("2007-02-02",format = "%Y-%m-%d")
  
  #Import electrical data 
  elec <- read.csv("household_power_consumption.txt",sep = ";",na.strings = "?", stringsAsFactors = FALSE)
  
  #Filtering based on specific date
  filter <- subset(elec,as.Date(Date,format = "%d/%m/%Y")>=startDate&as.Date(Date,format = "%d/%m/%Y")<=endDate)
  
  #Open graphical device as PNG
  png(filename="plot4.png",width = 480,height = 480)
  
  #Define Margin
  par(mar = c(5,5,5,2),mfcol=c(2,2))
  
  # Graph 1 : Plot Global Active Power
  plot(filter$Global_active_power,type = "l",xaxt ='n',ylab = "Global Active Power",xlab ="")
  day <- c("Thu","Fri","Sat")
  lengthX <- length(filter$Global_active_power)
  axis(1, at = seq(1, lengthX+1, by = lengthX/2), labels = day)

  # Graph 2 : Plot Energy sub metering  
  plot(filter$Sub_metering_1,type = "l",xaxt ='n',ylab = "Energy sub metering",xlab ="")
  points(filter$Sub_metering_2,type = "l",col="red")
  points(filter$Sub_metering_3,type = "l",col="blue")
  day <- c("Thu","Fri","Sat")
  lengthX <- length(filter$Global_active_power)
  axis(1, at = seq(1, lengthX+1, by = lengthX/2), labels = day)
  legend("topright",
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=c(1,1),
         lwd=c(2.5,2.5),
         col=c("black","red","blue"),
         box.lty=0,
         inset=.02
  )
  
  # Graph 3 : Plot Voltage
  plot(filter$Voltage,type = "l",xaxt ='n',ylab = "Voltage",xlab ="datetime")
  day <- c("Thu","Fri","Sat")
  lengthX <- length(filter$Global_active_power)
  axis(1, at = seq(1, lengthX+1, by = lengthX/2), labels = day)
  
  # Graph 4 : Plot Global Reactive Power
  plot(filter$Global_reactive_power,type = "l",xaxt ='n',ylab = "Global_reactive_power",xlab ="datetime")
  day <- c("Thu","Fri","Sat")
  lengthX <- length(filter$Global_active_power)
  axis(1, at = seq(1, lengthX+1, by = lengthX/2), labels = day)
    
  dev.off()

}







