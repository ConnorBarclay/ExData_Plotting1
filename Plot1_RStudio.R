

library(dplyr)
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



newData <-
  rbind(filter(data , Date == "1/2/2007") ,
        filter(data , Date == "2/2/2007"))


hist(
  as.numeric(newData$Global_active_power)
  ,
  col = "red"
  ,
  main = "Global Active Power"
  ,
  xlab = "Global Active Power (kilowatts)"
)

dev.copy(png
         ,
         file = "plot1.png"
         ,
         width = 480
         ,
         height = 480)
dev.off()