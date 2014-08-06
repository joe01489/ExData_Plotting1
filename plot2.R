#Retrieve the column names
vars <- colnames(read.table("household_power_consumption.txt", header = TRUE,
                            sep = ";", nrows = 1))
#Import the data, starting with Feb. 1, 2007 at 00:00:00, ending with
#Feb. 2, 2007 at 23:59:00.
dat <- read.table("household_power_consumption.txt", sep = ";",
                  col.names = vars, na.strings = "?",
                  nrows = 2880, skip = 66637)
#Convert the "Date" and "Time" columns to a Date class
dat$Date <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")

#Plot 2
png(filename = "plot2.png")
par(bg = "transparent")
with(dat, plot(Date, Global_active_power, xlab = "", 
               ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()