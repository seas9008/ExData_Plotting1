Total_Data<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
Data1<-data.frame(Date=as.Date(Total_Data$Date,"%d/%m/%Y"),Total_Data[,2:9])
Data2<-subset(Data1,as.Date(Date)>="2007-02-01"&as.Date(Date)<="2007-02-02")
Data<-data.frame(Time=strptime(paste(Data2$Date,Data2$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),Data2[,3:9])
png(file="plot4.png")
par(mfrow=c(2,2))
with(Data,plot(Time,Global_active_power,type="l",xlab=NA,ylab="Global Active Power(kilowatts)"))
with(Data,plot(Time,Voltage,type="l",xlab="datetime",ylab="Voltage"))
with(Data,plot(Time,Sub_metering_1,type="l",xlab=NA,ylab="Energy sub metering"))
  lines(Data$Time,Data$Sub_metering_2,col="red")
  lines(Data$Time,Data$Sub_metering_3,col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
with(Data,plot(Time,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))
dev.off()