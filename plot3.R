plot3 <- function(){
    
    ## Read data
    data <- read.table("household_power_consumption.txt",
                       sep=";",
                       na.string="?",
                       header=TRUE)
    
    ## Get subset of data corresponding to correct dates (get rid of the rest)
    data <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007") )
    
    ## Convert Date+Time into POSIXlt time objects:
    date_and_time <- paste(data[,1], data[,2])
    time_lt <- strptime(date_and_time, format="%d/%m/%Y %H:%M:%S")
    
    # Uncomment next line to turn off local time definitions
    # Sys.setlocale("LC_TIME", "C")
    
    y1 <- data$Sub_metering_1
    y2 <- data$Sub_metering_2
    y3 <- data$Sub_metering_3
    
    # Plot and save figure
    png("plot3.png")
    plot(time_lt, y1, type="l", xlab="", ylab="Energy sub metering")
    lines(time_lt, y2, type="l", col="red")
    lines(time_lt, y3, type="l", col="blue")
    legend("topright",
           names(data[7:9]),
           lty=c(1,1,1),
           col=c("black", "red", "blue"))
    dev.off()
    
}

