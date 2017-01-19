plot2 <- function(){
    
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
    
    # Plot and save the figure
    png("plot2.png")
    plot(time_lt,
         data$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")
    dev.off()
    
}