# read data and plot 1
library(dplyr)
library(ggplot2)
epc=read.table("2days_household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")

if (file.exists("plot1.png"))
    file.remove ("plot1.png")

png(filename = "plot1.png")
hist(epc$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power" )
dev.off()