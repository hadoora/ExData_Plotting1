## this script demonstrates drawing a compound plot

## read in sample data to extract data field names
a<- read.table('household_power_consumption.txt',header=TRUE,sep=';',nrows=10)
b<- names(a)

## read in complete data subset and assign field names as appropriate
a<- read.table('household_power_consumption.txt',header=TRUE,sep=';', skip=66636, na.strings='?',nrows=2880)
names(a)<-b

##create png file with specified dimensions
png(file='plot3.png', width=480, height=480)

## draw empty plot outline
with(a,plot(as.POSIXlt(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'), a$Sub_metering_1, type='n', ylab='Energy sub metering', xlab=''))

## populate outline with three plots super-imposed on each other
with(a,lines(as.POSIXlt(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'), Sub_metering_1, ylab='Energy sub metering', xlab=''))
with(a,lines(as.POSIXlt(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'), Sub_metering_2, col='red', ylab='Energy sub metering', xlab=''))
with(a,lines(as.POSIXlt(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'), Sub_metering_3, col='blue', ylab='Energy sub metering', xlab=''))

##insert color-coded legend
legend('topright', pch = '-', col = c('black', 'red', 'blue' ), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()