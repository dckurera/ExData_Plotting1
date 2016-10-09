setwd("C:/Users/dkurera001/Documents/Data Science/4. Exploratory Data Analysis/")

Dates <- c ("1/2/2007",  "2/2/2007")
Data <- read.table ( file = "household_power_consumption.txt", header = TRUE, sep =";", , stringsAsFactors=FALSE )



Data2 <- Data[which(Data$Date %in% Dates),]
Data2$Time <- strptime(do.call(paste0,Data2[c(1,2)]), "%d/%m/%Y%H:%M:%S")
Data2$Date <- as.Date(Data2$Date, "%d/%m/%Y")

with (Data2, plot(Time, as.numeric(Sub_metering_1),  type = "l", ylab = "Energy Sub Metering" , xlab =""), axis(2,at= c(10,20,30,40)))
with (Data2, points(Time, as.numeric(Sub_metering_2), type="l", col="red"))
with (Data2, points(Time, as.numeric(Sub_metering_3), type="l", col="blue"))
legend("topright", pch = NA, lwd = 3, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png")
dev.off()
