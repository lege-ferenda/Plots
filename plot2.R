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

plot(x, power$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# output as .png

dev.copy(png, file = "plot2.png", width=480,height=480)

dev.off()

