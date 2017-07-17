# read data and plot 2
library(dplyr)
library(ggplot2)
epc=read.table("2days_household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")

if (file.exists("plot2.png"))
    file.remove ("plot2.png")

png(filename = "plot2.png")
plot.ts(epc$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = 'n')
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()