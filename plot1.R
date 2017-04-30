## this script demonstrates creating a simple histogram

## read in sample data to extract data field names
a<- read.table('household_power_consumption.txt',header=TRUE,sep=';',nrows=10)
b<- names(a)

## read in complete data subset and assign field names as appropriate
a<- read.table('household_power_consumption.txt',header=TRUE,sep=';', skip=66636, na.strings='?',nrows=2880)
names(a)<-b

##create png file with specified dimensions
png(file='plot1.png', width=480, height=480)

## draw histogram
hist(a$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()