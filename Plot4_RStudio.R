library(lubridate)


setwd("C:/Software Development/R/Coursework/Exploratory_Data_Analysis/Week1")

data <-
  read.table(
    "C:/Downloads/Datasets/household_power_consumption.txt"
    ,
    header = TRUE
    ,
    sep = ";"
  )

data$Date <- as.Date(data$Date, "%d/%m/%Y")

newData <- subset(data , Date >= "2007-2-1" & Date <= "2007-2-2")

newData$date.time <- paste(newData$Date , newData$Time)
newData$date.time <- as.POSIXct(newData$date.time)


par(mfrow = c(2, 2))

# Plot 1 (Top-left)
plot(
  x = newData$date.time
  ,
  y = newData$Global_active_power
  ,
  type = "l"
  ,
  xlab = ""
  ,
  ylab = "Global Active Power (kilowatts)"
)

# Plot 2 (Top-right)
plot(
  x = newData$date.time
  ,
  y = newData$Voltage
  ,
  type = "l"
  ,
  xlab = "datetime"
  ,
  ylab = "Voltage"
)

# Plot 3 (Bottom-left)
plot(
  x = newData$date.time
  ,
  y = newData$Sub_metering_1
  ,
  type = "l"
  ,
  ylab = "Global Active Power (kilowatts)"
  ,
  xlab = ""
)
lines(x = newData$date.time
      ,
      y = newData$Sub_metering_2
      ,
      col = "red")
lines(x = newData$date.time
      ,
      y = newData$Sub_metering_3
      ,
      col = "blue")
legend(
  "topright"
  ,
  col = c("black", "red", "blue")
  ,
  lwd = c(1, 1, 1)
  ,
  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  ,
  bty = "n"
)

# Plot 4 (Bottom-right)
plot(
  x = newData$date.time
  ,
  y = newData$Global_reactive_power
  ,
  type = "l"
  ,
  xlab = "datetime"
  ,
  ylab = "Global_reactive_power"
)

dev.copy(png
         ,
         file = "plot4.png"
         ,
         width = 480
         ,
         height = 480)
dev.off()