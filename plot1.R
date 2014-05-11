read1<-read.table("C:\\Users\\Dinesh\\Downloads\\computing for data analysis\\4.exploratory data analysis\\week 1\\household_power_consumption.txt",header=TRUE,sep=";")
read1[,"Date"]<-as.Date(read1[,1],"%d/%m/%Y")
m<-subset(read1,read1[,1]=="2007-02-01" | read1[,1]=="2007-02-02")
m[,"Global_active_power"]<-as.numeric(as.character(m[,3]))
a<-m$Global_active_power
hist(a,main="Global Active Power","col="red",xlab="Global Active Power(kilowatts)" ) ##plot 1
dev.copy(png,file="plot1.png")
dev.off() 