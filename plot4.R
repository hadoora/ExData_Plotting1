## this script demonstrates drawing 3 simple plots and 1 compound plot on a single graphic device

## read in sample data to extract data field names
a<- read.table('household_power_consumption.txt',header=TRUE,sep=';',nrows=10)
b<- names(a)

## read in complete data subset and assign field names as appropriate
a<- read.table('household_power_consumption.txt',header=TRUE,sep=';', skip=66636, na.strings='?',nrows=2880)
names(a)<-b

##create png file with specified dimensions
png(file='plot4.png', width=480, height=480)

## set row count
par(mfrow=c(2,2))

## replicate data set a
b<-a

##populate graphic device one element after the other
with(a,{
plot(as.POSIXlt(paste(a$Date, a$Time), format='%d/%m/%Y %H:%M:%S'), a$Global_active_power, type='l', ylab='Global Active Power', xlab='')
plot(as.POSIXlt(paste(a$Date, a$Time), format='%d/%m/%Y %H:%M:%S'), a$Voltage, type='l', ylab='Voltage', xlab='datetime')
with(b,plot(as.POSIXlt(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'), Sub_metering_1, type='n', ylab='Energy sub metering', xlab=''))
with(b,lines(as.POSIXlt(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'), Sub_metering_1, ylab='Energy sub metering', xlab=''))
with(b,lines(as.POSIXlt(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'), Sub_metering_2, col='red', ylab='Energy sub metering', xlab=''))
with(b,lines(as.POSIXlt(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'), Sub_metering_3, col='blue', ylab='Energy sub metering', xlab=''))
legend('topright', pch = '-', col = c('black', 'red', 'blue' ), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
plot(as.POSIXlt(paste(a$Date, a$Time), format='%d/%m/%Y %H:%M:%S'), a$Global_reactive_power, type='l', ylab='Global_reactive_power', xlab='datetime')
})

dev.off()