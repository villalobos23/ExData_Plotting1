plot1 <- function(){
  library(sqldf)
  unzip(zipfile = "exdata-data-household_power_consumption.zip")
  energyDF <- read.csv.sql("household_power_consumption.txt",
                           sql = "select * from file where Date in ('1/2/2007','2/2/2007')",
                           header = T,sep=";")
  closeAllConnections()
  png(file="plot1.png",bg="transparent",width = 480 ,height = 480)
  hist(energyDF$Global_active_power,
       main="Global Active Power",
       xlab = "Global Active Power (kilowatts)",
       col="red")
  dev.off()
}