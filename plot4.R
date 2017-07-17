# read data and plot 4
library(dplyr)
library(ggplot2)
epc=read.table("2days_household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")

if (file.exists("plot4.png"))
    file.remove ("plot4.png")

png(filename = "plot4.png")
par(mfrow = c(2, 2))

# first plot
plot.ts(epc$Global_active_power, xlab = "", ylab = "Global Active Power", xaxt = 'n')
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
# second plot
plot.ts(epc$Voltage, xlab = "datetime", ylab = "Voltage", xaxt = 'n')
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
# third plot
epc_time_series = epc[,7:9]
epc_time_series=ts(epc_time_series)
ts.plot(epc_time_series, 
        gpars = list(col = c("black", "red", "blue"), 
                     xlab = "", ylab = "Energy sub metering", xaxt = 'n'))
legend("topright", pch = "___ ___ ___", 
       col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
# fourth plot
plot.ts(epc$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", xaxt = 'n')
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()