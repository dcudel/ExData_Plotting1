setwd("C://Users//dcudel//OneDrive//Documents//Machine Learning//Courses Johns Hopkins//Exploratory Data Analysis//Course Project//ExData_Plotting1")

## Load data set
data <- read.csv(".//household_power_consumption.txt",
                 header = FALSE,
                 sep = ";",
                 col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                 skip = 66637,
                 nrows = 69517-66637,
                 colClasses = c("character", "character", rep("numeric", 7)))

## Create a new column combining Date & Time
data$ts = with(data, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

## Plot chart 1
par(mar = c(5, 5, 2, 1))
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Copy screen device to a PNG file device
dev.copy(device = png, filename = "plot1.png", width=480, height=480)
dev.off()