#download the data zip file from the given url
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")
#unzip the data
unzip(zipfile="./data/Dataset.zip",exdir="./data")
#set working directory to the directory with the text file
setwd("./data")
#read the entire dataset as a table
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="",
                      quote='\"')
#read the dataset between 1/2/2007 and 2/2/2007
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
#create histogram
hist(data1$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#save plot as png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
