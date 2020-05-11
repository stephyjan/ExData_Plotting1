        setwd("C:/Users/Eric/Desktop/Steph/rhw/household")

        fh <- file("household_power_consumption.txt")

        ba <- read.table(text=grep("^[1,2]/2/2007",readLines(fh),value=TRUE),
                  col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  sep = ";",header = TRUE)

        ba$Date <- as.Date(ba$Date,"%d/%m/%Y")
        datetme <- paste(ba$Date,ba$Time)
        ba$Datetime <- as.POSIXct(datetme)
        
        setwd("C:/Users/Eric/Desktop/Steph/rhw/ExData_Plotting1")
        
        png("plot2.png", width=480, height=480)
        
        plot(ba$Global_active_power~ba$Datetime, type="l", ylab="Global Active Power (kilowatts)",xlab="")

        dev.off()
