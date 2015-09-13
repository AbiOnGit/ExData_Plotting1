## Assignment Project 1

## Unzipped file
xmlFile = "C:\\Users\\Abi\\OneDrive\\Documents\\hsepwr\\exdata_data_household_power_consumption.xml"

## Unzip file

## Read XML file
## Parse XML file to a document
doc <- xmlTreeParse(fileUrl,useInternal = TRUE)

## Load the data
## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
## One alternative is to read the data from just those dates rather than 
## reading in the entire dataset and subsetting to those dates.

## Read in dates
date1 <- strptime(as.Date('2007-02-01'), "%Y-%m-%d")
date2 <- strptime(as.Date('2007-02-02'), "%Y-%m-%d")

## Format date to locale-specific version of date()
format(Sys.Date(), "%Y/%m/%d")

rowIndex <- date1:date2

## Extract the root node of the XML doc
dates <- xmlRoot(doc)
## Print name of XML root
xmlName(dates)
## Check the names of all the root nodes
names(dates)

## Use XPath language to extract the items and attributes e.g. menu and price
row1 <- xpathSApply(dates,date1,xmlValue)
row2 <- xpathSApply(dates,date2,xmlValue)

## Plot histogram
## Histogram
hist(islands, breaks = c(12,20,36,80,200,1000,17000), 
     freq = TRUE, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

## Multiplle base plots
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(airquality,{
  plot(Wind, datetime, ylab = "Global Active Power")
  plot(Solar.R, datetime, main = "Ozone and Solar Radiation")
  plot(Wind, datetime, main = "Wind and Ozone")
  plot(Solar.R, datetime, main = "Ozone and Solar Radiation")
  mtext("plot4", outer = TRUE)
})

## force the background to be white 
png(filename = "plot4.png", bg = "white")

## Save
dev.copy(png, file = "plot4.png")

## Close
dev.off()
