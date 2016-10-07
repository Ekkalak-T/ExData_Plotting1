#Scatterplot of Global Active Power
plot2 <- function(){

  #Define specific date to plot data within interested area  
  startDate <- as.Date("2007-02-01",format = "%Y-%m-%d")
  endDate <- as.Date("2007-02-02",format = "%Y-%m-%d")
  
  #Import electrical data 
  elec <- read.csv("household_power_consumption.txt",sep = ";",na.strings = "?", stringsAsFactors = FALSE)
  
  #Filtering based on specific date
  filter <- subset(elec,as.Date(Date,format = "%d/%m/%Y")>=startDate&as.Date(Date,format = "%d/%m/%Y")<=endDate)
  
  #Open graphical device as PNG
  png(filename="plot2.png",width = 480,height = 480)
  
  #Define margin
  par(mar = c(5,5,5,5))

  #Scatterplot of Global Active Power without detail the x axis
  plot(filter$Global_active_power,type = "l",xaxt ='n',ylab = "Global Active Power (Kilowatts)",xlab ="")
  
  #Define X axis at location 1, 1441, 2880 (begin, middle, end)
  day <- c("Thu","Fri","Sat")
  lengthX <- length(filter$Global_active_power)
  axis(1, at = seq(1, lengthX+1, by = lengthX/2), labels = day)
  
  dev.off()
  
  
}







