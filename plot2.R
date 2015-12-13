plot2 <- function(){
  library(sqldf)
  unzip(zipfile = "exdata-data-household_power_consumption.zip")
  energyDF <- read.csv.sql("household_power_consumption.txt",
                           sql = "select * from file where Date in ('1/2/2007','2/2/2007')",
                           header = T,sep=";")
  closeAllConnections()
  png(file="plot2.png",bg="transparent",width = 480 ,height = 480)
  Sys.setlocale("LC_TIME","English")
  energyDF$DateTime <- as.POSIXct(paste(energyDF$Date, energyDF$Time), format="%d/%m/%Y %H:%M:%S")
  plot(x = energyDF$DateTime,y = energyDF$Global_active_power,
       type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
  dev.off()
}