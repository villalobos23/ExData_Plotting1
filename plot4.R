plot4 <- function(){
  library(sqldf)
  unzip(zipfile = "exdata-data-household_power_consumption.zip")
  energyDF <- read.csv.sql("household_power_consumption.txt",
                           sql = "select * from file where Date in ('1/2/2007','2/2/2007')",
                           header = T,sep=";")
  closeAllConnections()
  png(file="plot4.png",bg="transparent",width = 480 ,height = 480)
  Sys.setlocale("LC_TIME","English")
  energyDF$DateTime <- as.POSIXct(paste(energyDF$Date, energyDF$Time),
                                  format="%d/%m/%Y %H:%M:%S")
  par(mfrow=c(2,2))
  plot(x = energyDF$DateTime,y = energyDF$Global_active_power,
       type = "l",ylab = "Global Active Power",xlab = "")
  plot(energyDF$DateTime,energyDF$Voltage,type = "l",xlab="datetime",ylab = "Voltage")
  plot(x = energyDF$DateTime,y = energyDF$Sub_metering_1,
       type = "l",ylab = "Energy Sub Metering",xlab = "")
  lines(x = energyDF$DateTime,y= energyDF$Sub_metering_2,col="red")
  lines(x = energyDF$DateTime,y= energyDF$Sub_metering_3,col="blue")
  legend("topright",
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col = c("black","red","blue"),lty=c(1,1,1),bty="n")
  plot(energyDF$DateTime,energyDF$Global_reactive_power,type = "l",
       xlab="datetime",ylab = "Global_reactive_power")
  dev.off()
}