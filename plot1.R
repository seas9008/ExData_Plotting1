Total_Data<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
Data1<-data.frame(Date=as.Date(Total_Data$Date,"%d/%m/%Y"),Total_Data[,2:9])
Data<-subset(Data1,as.Date(Date)>="2007-02-01"&as.Date(Date)<="2007-02-02")
png(file="plot1.png")
with(Data,hist(Global_active_power,main="Global Active Power",xlab="Golbal Active Power(kilowatts)",ylab="Frequency",col="red"))
dev.off()