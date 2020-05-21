library(lubridate)

setwd("C:/Software Development/R/Coursework/Exploratory_Data_Analysis/Week1")

dataset <-
  read.table(
    "C:/Downloads/Datasets/household_power_consumption.txt"
    ,
    header = TRUE
    ,
    sep = ";"
  )
head(dataset)



dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
head(data)

newData <- subset(dataset , Date >= "2007-2-1" & Date <= "2007-2-2")


newData$date.time <- paste(newData$Date , newData$Time)
newData$date.time <- as.POSIXct(newData$date.time)


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

dev.copy(png
         ,
         file = "plot2.png"
         ,
         width = 480
         ,
         height = 480)
dev.off()