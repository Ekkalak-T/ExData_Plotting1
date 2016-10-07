#Plot Histograms of Global Active Power
plot1 <- function(){
  
  #Define specific date to plot data within interested area
  startDate <- as.Date("2007-02-01",format = "%Y-%m-%d")
  endDate <- as.Date("2007-02-02",format = "%Y-%m-%d")
  
  
  
  
  #Import electrical data 
  elec <- read.csv("household_power_consumption.txt",sep = ";",na.strings = "?", stringsAsFactors = FALSE)
  
  #Filtering based on specific date
  filter <- subset(elec,as.Date(Date,format = "%d/%m/%Y")>=startDate&as.Date(Date,format = "%d/%m/%Y")<=endDate)
 
  #Open graphical device as PNG
  png(filename="plot1.png",width = 480,height = 480)
  
  #Define margin
  par(mar = c(5,5,5,5))
  
  #Plot Histograms then close the graphical device
  hist(filter$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
  dev.off()
  
  
}







