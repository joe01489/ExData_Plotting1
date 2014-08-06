#Retrieve the column names
vars <- colnames(read.table("household_power_consumption.txt", header = TRUE,
                            sep = ";", nrows = 1))
#Import the data, starting with Feb. 1, 2007 at 00:00:00, ending with
#Feb. 2, 2007 at 23:59:00.
dat <- read.table("household_power_consumption.txt", sep = ";",
                  col.names = vars, na.strings = "?",
                  nrows = 2880, skip = 66637)

#Plot 1: Global Active Power
png(filename = "plot1.png")
par(bg = "transparent")
hist(dat$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()