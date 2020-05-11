        setwd("C:/Users/Eric/Desktop/Steph/rhw/household")

        fh <- file("household_power_consumption.txt")

        ba <- read.table(text=grep("^[1,2]/2/2007",readLines(fh),value=TRUE),
                 col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                 sep = ";",header = TRUE)

        ba$Date <- as.Date(ba$Date,"%d/%m/%Y")
        datetme <- paste(ba$Date,ba$Time)
        ba$Datetime <- as.POSIXct(datetme)

        setwd("C:/Users/Eric/Desktop/Steph/rhw/ExData_Plotting1")
        
        png("plot4.png", width=480, height=480)
        
        par(mfcol = c(2, 2))

        with(ba,{
                  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)",xlab="")
                  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering",xlab="")
                  lines(Sub_metering_2~Datetime, type="l", col = "red")
                  lines(Sub_metering_3~Datetime, type="l", col = "blue")
                  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1, lwd=1,bty="n",cex=0.9)
                  plot(Voltage~Datetime, type="l", ylab="Voltage",xlab="datetime")
                  plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power",xlab="datetime")
                  })

        dev.off()
        