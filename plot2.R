

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



#plot 2

plot(household_data_cut_2$datetime, household_data_cut_2$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (killowatts)",
     xlab = "")


dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
