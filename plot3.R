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

#Plot 3
png(filename = "plot3.png")
par(bg = "transparent")
with(dat, plot(Date, Sub_metering_1, xlab = "", 
               ylab = "Energy sub metering", type = "l"))
lines(dat$Date, dat$Sub_metering_2, col = "red")
lines(dat$Date, dat$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1,
       legend = colnames(dat)[7:9])
dev.off()