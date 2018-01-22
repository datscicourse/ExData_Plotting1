d <- read.csv2("household_power_consumption.txt")
d$Date <- as.Date(strptime(d$Date, "%d/%m/%Y"))
start <- as.Date("2007-02-01", "%Y-%m-%d") 
end <- as.Date("2007-02-02", "%Y-%m-%d") 
d <- d[ d$Date >= start & d$Date <= end, ]


png("plot2.png", width = 480, height = 480)
par(bg=NA)
f <- as.numeric(d$Global_active_power)
plot(f,type="l", ylab="Global Active Power (kilowats)" , xaxt="n", yaxt="n", xlab="" )
axis(1, at=c(1,length(f)/2,length(f)), labels=c("Thu","Fri","Sat") )
axis(2, at=seq(from=0, to=length(f), by=length(f)/3), labels=c(0,2,4,6) )
dev.off()