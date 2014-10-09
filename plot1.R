## data input ==> download and unzip the data in your folder directory!!!!
power <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", skip = 66637, nrow = 2879)
names <- colnames(read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", nrow = 1, head = T))
colnames(power) <- names

##creating the histogram and saving in .png

hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width=480,height=480)

dev.off()

