read1<-read.table("C:\\Users\\Dinesh\\Downloads\\computing for data analysis\\4.exploratory data analysis\\week 1\\household_power_consumption.txt",header=TRUE,sep=";")
read1[,"Date"]<-as.Date(read1[,1],"%d/%m/%Y")
m<-subset(read1,read1[,1]=="2007-02-01" | read1[,1]=="2007-02-02")
m[,"Global_active_power"]<-as.numeric(as.character(m[,3]))
a<-m$Global_active_power
b<-paste(m$Date,m$Time)
c<-strptime(b,"%Y-%m-%d %H:%M:%S") ## pasting both together in date_time format
z<-cbind.data.frame(m,c)
plot(z$Global_active_power,z$c,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()


