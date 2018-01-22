d <- read.csv2("household_power_consumption.txt")
d$Date <- as.Date(strptime(d$Date, "%d/%m/%Y"))
start <- as.Date("2007-02-01", "%Y-%m-%d") 
end <- as.Date("2007-02-02", "%Y-%m-%d") 
d <- d[ d$Date >= start & d$Date <= end, ]

png("plot1.png", width = 480, height = 480)
f <- d$Global_active_power
f <- as.numeric(levels(f))[f]
par(bg=NA)
hist(f, main="Global Active Power" , col = "red", xlab= "Global Active Power (kilowats)")
dev.off()

