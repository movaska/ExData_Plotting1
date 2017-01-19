plot1 <- function(){
 
    ## Read data
    data <- read.table("household_power_consumption.txt",
                       sep=";",
                       na.string="?",
                       header=TRUE)
    
    ## Get subset of data corresponding to correct dates (get rid of the rest)
    data <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007") )
    
    # Plot and save the figure
    png("plot1.png")
    hist(data$Global_active_power,
         col=2,
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)")
    dev.off()

}