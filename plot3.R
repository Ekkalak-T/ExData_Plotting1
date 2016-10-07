#ScatterPlot of Sub_metering (Comparison)
plot3 <- function(){
  
  #Define specific date to plot data within interested area  
  startDate <- as.Date("2007-02-01",format = "%Y-%m-%d")
  endDate <- as.Date("2007-02-02",format = "%Y-%m-%d")
  
  #Import electrical data 
  elec <- read.csv("household_power_consumption.txt",sep = ";",na.strings = "?", stringsAsFactors = FALSE)
  
  #Filtering based on specific date
  filter <- subset(elec,as.Date(Date,format = "%d/%m/%Y")>=startDate&as.Date(Date,format = "%d/%m/%Y")<=endDate)
  
  #Open graphical device as PNG
  png(filename="plot3.png",width = 480,height = 480)
  
  #Define Margin
  par(mar = c(5,5,5,5))

  #Plot Sub_metering_1
  plot(filter$Sub_metering_1,type = "l",xaxt ='n',ylab = "Energy sub metering",xlab ="")
  
  #Plot Sub_metering_2 and 3
  points(filter$Sub_metering_2,type = "l",col="red")
  points(filter$Sub_metering_3,type = "l",col="blue")
  
  #Define X axis at location 1, 1441, 2880 (begin, middle, end)
  day <- c("Thu","Fri","Sat")
  lengthX <- length(filter$Global_active_power)
  axis(1, at = seq(1, lengthX+1, by = lengthX/2), labels = day)
  
  #Define the Legend 
  legend("topright",
  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
  lty=c(1,1),
  lwd=c(2.5,2.5),
  col=c("black","red","blue")
  )
  
  dev.off()

}







