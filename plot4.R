

mainfolder <- '/Users/laureniannolo/Documents/Coursera Data Science/Course 4 Assign 1'


#Read in the data using read.table
getwd()
setwd(mainfolder)
getwd()

household_data <- read.table('household_power_consumption.txt',header=TRUE,
                             sep = ";",na.strings = "?")


#change date and time to date and time objects
str(household_data)
household_data$datetime <- with(household_data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

#crop to only the necessary dates for assignment and remove NA lines
household_data_cut <- household_data[,c(10,3:9)]
household_data_cut_2 <- household_data_cut[((household_data_cut$datetime >= '2007-02-01 00:00:00') 
                                            & (household_data_cut$datetime <='2007-02-02 23:59:59')),]

household_data_cut_2 <- na.omit(household_data_cut_2)



#plot 4

par(mfcol = c(2,2))

#top left
plot(household_data_cut_2$datetime, household_data_cut_2$Global_active_power, 
     type = "l",
     ylab = "Global Active Power",
     xlab = "")



#bottom left
with(household_data_cut_2, plot(datetime, Sub_metering_1, main = "", type = 'n',
                                ylab = "Energy sub metering",
                                xlab = ""))
with(household_data_cut_2, points(datetime, Sub_metering_1, col= "black", type = 'l'))
with(household_data_cut_2, points(datetime, Sub_metering_2, col= "red", type = 'l'))
with(household_data_cut_2, points(datetime, Sub_metering_3, col= "blue", type = 'l'))
legend("topright",col = c("black","red","blue"), lty=1, cex=0.8, 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  bty = "n")


#top right
plot(household_data_cut_2$datetime, household_data_cut_2$Voltage, 
     type = "l",
     ylab = "Voltage",
     xlab = "")

#botom right
plot(household_data_cut_2$datetime, household_data_cut_2$Global_reactive_power, 
     type = "l",
     ylab = "Global Reactive Power",
     xlab = "")



dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()


