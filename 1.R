# Downloaded the data from website.
# data is in a zip folder
# unzipped the data

data<-read.table("household_power_consumption.txt",header = TRUE, sep=";") #load the data
names(data)
lapply(data, class)
data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S") #make the date & time in a universal format
start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data2<-data[start:end,]

#plot no. 1
hist(as.numeric(as.character(data2$Global_active_power)), # note we used as.character and as numeric since
                                                          # the variable is factor variable.
                main="Global Active Power",
                xlab="Global Active Power (kilowatts)", col="red")
#plot no. 2

plot(data2$DateTime, as.numeric(as.character(data2$Global_active_power)),
      type='l',ylab="Global Active Power (Kilowatts)", xlab="")

#plot no. 3
plot(data2$DateTime, as.numeric(as.character(data2$Sub_metering_1)),type='l', 
     ylab ="Energy sub metering", xlab="")
 lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_2)),type='l', col='red')
 lines(data2$DateTime, data2$Sub_metering_3,type='l', col="blue")
  legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                    lty=c(1,1,1)
                    ,col=c("black","red","blue"))

#plot no. 4

par(mfcol=c(2,2))

 plot(data2$DateTime, as.numeric(as.character(data2$Global_active_power)),type='l',ylab="Global Active Power", xlab="")

plot(data2$DateTime, as.numeric(as.character(data2$Sub_metering_1)),type='l', xlab="",ylab ="Energy sub metering")
 lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_2)),type='l', col='red')
 lines(data2$DateTime, data2$Sub_metering_3,type='l', col="blue")
  legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                    lty=c(1,1,1),col=c("black","red","blue"))

plot(data2$DateTime, as.numeric(as.character(data2$Voltage)),type='l', 
    ylab="Voltage",xlab="datetime" )

plot(data2$DateTime, as.numeric(as.character(data2$Global_reactive_power)),type='l', 
    ylab="Global_reactive_power",xlab="datetime" )