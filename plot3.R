d <- read.csv2("household_power_consumption.txt")
d$Date <- as.Date(strptime(d$Date, "%d/%m/%Y"))
start <- as.Date("2007-02-01", "%Y-%m-%d") 
end <- as.Date("2007-02-02", "%Y-%m-%d") 
d <- d[ d$Date >= start & d$Date <= end, ]


png("plot3.png", width = 480, height = 480)
par(bg=NA)
f1 <- as.numeric(levels(d$Sub_metering_1))[d$Sub_metering_1]
f2 <- as.numeric(levels(d$Sub_metering_2))[d$Sub_metering_2]
f3 <- as.numeric(levels(d$Sub_metering_3))[d$Sub_metering_3]
plot(f1, type="l", col="black", ylab="Energy sub metering", xaxt="n", xlab="")
axis(1, at=c(1,length(f1)/2,length(f1)), labels=c("Thu","Fri","Sat") )
lines(f2, type="l", col="red")
lines(f3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red" ,"blue"), lty=1)
dev.off()