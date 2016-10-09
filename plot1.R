setwd("C:/Users/dkurera001/Documents/Data Science/4. Exploratory Data Analysis/")

Dates <- c ("1/2/2007",  "2/2/2007")
Data <- read.table ( file = "household_power_consumption.txt", header = TRUE, sep =";", , stringsAsFactors=FALSE )



Data2 <- Data[which(Data$Date %in% Dates),]
Data2$Time <- strptime(do.call(paste0,Data2[c(1,2)]), "%d/%m/%Y%H:%M:%S")
Data2$Date <- as.Date(Data2$Date, "%d/%m/%Y")
hist (as.numeric(Data2$Global_active_power), col= "red", xlab= "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png,"plot1.png")
dev.off()
