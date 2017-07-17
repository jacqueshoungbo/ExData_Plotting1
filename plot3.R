# read data and plot 3
library(dplyr)
library(ggplot2)
epc=read.table("2days_household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")

if (file.exists("plot3.png"))
    file.remove ("plot3.png")

epc_time_series = epc[,7:9]
epc_time_series=ts(epc_time_series)
png(filename = "plot3.png")
ts.plot(epc_time_series, 
        gpars = list(col = c("black", "red", "blue"), 
                     xlab = "", ylab = "Energy sub metering", xaxt = 'n'))
legend("topright", pch = "___ ___ ___", 
       col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()