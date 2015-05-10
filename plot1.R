rawData = "household_power_consumption.txt"
loadData = read.table(rawData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- loadData[loadData$Date %in% c("1/2/2007","2/2/2007") ,]
globalAPower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalAPower, col="red", main="Global Active Power", xlab="Global Active Power (Kilo Watts)")
dev.off()