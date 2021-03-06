plot3 <- function(){
  
  png("plot3.png", width = 480, height = 480)
  
  mydata<-read.table("household_power_consumption.txt",header=FALSE, skip = 66637, nrows = 2880, sep=";", 
                     colClasses=c("character","character", rep("numeric",7)),
                     col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                                   "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  a<-paste(mydata$Date,mydata$Time)
  Conv_time<-strptime(a, format="%d/%m/%Y %H:%M:%S")
  mydata<-mutate(mydata,Conv_time=Conv_time)
  
  plot(mydata$Conv_time,mydata$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
  lines(mydata$Conv_time,mydata$Sub_metering_1)
  lines(mydata$Conv_time,mydata$Sub_metering_2,col="red")
  lines(mydata$Conv_time,mydata$Sub_metering_3,col="blue")
  
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col=c("black","red","blue"))
  
  dev.off()
}