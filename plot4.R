d <- read.csv2("household_power_consumption.txt")
d$Date <- as.Date(strptime(d$Date, "%d/%m/%Y"))
start <- as.Date("2007-02-01", "%Y-%m-%d") 
end <- as.Date("2007-02-02", "%Y-%m-%d") 
d <- d[ d$Date >= start & d$Date <= end, ]

lineplot <- function()
{  
  f <- as.numeric(d$Global_active_power)
  plot(f,type="l", ylab="Global Active Power (kilowats)" , xaxt="n", yaxt="n", xlab="" )
  axis(1, at=c(1,length(f)/2,length(f)), labels=c("Thu","Fri","Sat") )
  axis(2, at=seq(from=0, to=length(f), by=length(f)/3), labels=c(0,2,4,6) )
}

submeteringplot <- function()
{
  f1 <- as.numeric(levels(d$Sub_metering_1))[d$Sub_metering_1]
  f2 <- as.numeric(levels(d$Sub_metering_2))[d$Sub_metering_2]
  f3 <- as.numeric(levels(d$Sub_metering_3))[d$Sub_metering_3]
  plot(f1, type="l", col="black", ylab="Energy sub metering", xaxt="n", xlab="")
  axis(1, at=c(1,length(f1)/2,length(f1)), labels=c("Thu","Fri","Sat") )
  lines(f2, type="l", col="red")
  lines(f3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red" ,"blue"), lty=1, bg="transparent", bty = "n")
}

voltplot <- function()
{
  Voltage <- as.numeric(levels(d$Voltage))[d$Voltage]
  plot(Voltage, type="l", xaxt="n", yaxt="n", xlab="Datetime")
  axis(1, at=c(1,length(Voltage)/2,length(Voltage)), labels=c("Thu","Fri","Sat") )
  axis(2, at=seq(from=234, to=264, by=4))
}

globalreactplot <- function()
{
  Global_reactive_power <- as.numeric(levels(d$Global_reactive_power))[d$Global_reactive_power]
  plot(Global_reactive_power, type="l", xaxt="n", xlab="Datetime", yaxt="n")
  axis(1, at=c(1,length(f1)/2,length(f1)), labels=c("Thu","Fri","Sat") )
  axis(2, at=seq(from=0.0, to=0.5, by=0.1))
}


png("plot4.png", width = 480, height = 480)
old <- par(no.readonly = T)
par(bg=NA)
par(mfrow=c(2,2))
lineplot()
voltplot()
submeteringplot()
globalreactplot()
dev.off()
par(old)