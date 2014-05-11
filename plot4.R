read1<-read.table("C:\\Users\\Dinesh\\Downloads\\computing for data analysis\\4.exploratory data analysis\\week 1\\household_power_consumption.txt",header=TRUE,sep=";")
read1[,"Date"]<-as.Date(read1[,1],"%d/%m/%Y")
m<-subset(read1,read1[,1]=="2007-02-01" | read1[,1]=="2007-02-02")
b<-paste(m$Date,m$Time)
c<-strptime(b,"%Y-%m-%d %H:%M:%S") ## pasting both together in date_time format
z<-cbind.data.frame(m,c)
 a<-as.numeric(as.character(m[,3]))
 v<-as.numeric(as.character(m[,5]))

 m[,"Sub_metering_1"]<-as.numeric(as.character(m[,7]))
 m[,"Sub_metering_2"]<-as.numeric(as.character(m[,8]))
 m[,"Sub_metering_9"]<-as.numeric(as.character(m[,9]))
z<-cbind.data.frame(m,c)
 sm1<-z[,7]
 sm2<-z[,8]
 sm3<-z[,9]
par(mfrow=c(2,2))
plot(z$c,a,type="l",xlab="",ylab="Global Active Power")
plot(z$c,v,type="l",xlab="date time",ylab="Voltage")
with(z,plot(z$c,sm1,col="black",type="l",xlab="",ylab="Energy sub metering"))
with(subset(z,colnames(z)=="Sub_metering_2"),points(z$c,sm2,col="red",type="l"))
with(subset(z,colnames(z)=="Sub_metering_3"),points(z$c,sm3,col="blue",type="l"))
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
grp<-as.numeric(as.character(z[,4]))
plot(z$c,grp,type="l",xlab="date time",ylab="global reactive Power")
dev.copy(png,file="plot4.png")
dev.off()