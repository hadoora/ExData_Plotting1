## this script demonstrates drawing a simple plot

## read in sample data to extract data field names
a<- read.table('household_power_consumption.txt',header=TRUE,sep=';',nrows=10)
b<- names(a)

## read in complete data subset and assign field names as appropriate
a<- read.table('household_power_consumption.txt',header=TRUE,sep=';', skip=66636, na.strings='?',nrows=2880)
names(a)<-b

##create png file with specified dimensions
png(file='plot2.png', width=480, height=480)

##draw line-type plot with specified label using concatenated date and time fields
plot(as.POSIXlt(paste(a$Date, a$Time), format='%d/%m/%Y %H:%M:%S'), a$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='')
dev.off()