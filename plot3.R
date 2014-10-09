## data input ==> download and unzip the data in your folder directory!!!!
power <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", skip = 66637, nrow = 2879)
names <- colnames(read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", nrow = 1, head = T))
colnames(power) <- names
Sys.setlocale("LC_TIME", "English")

#changing the NA symbol

power[power == "?"] <- NA

#=============== handling the dates and time

##power$Date <- as.Date(power$Date, "%d/%m/%Y")

x <- paste(power$Date, power$Time)
x <- as.POSIXct(strptime(x, "%d/%m/%Y %H:%M:%S"))

#making the plot

with(power, plot(x, Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = ""))
points(x, power$Sub_metering_2, type = "l", col = "red")  ## adds a new variable
points(x, power$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.6)


# output as .png

dev.copy(png, file = "plot3.png", width=480,height=480)

dev.off()