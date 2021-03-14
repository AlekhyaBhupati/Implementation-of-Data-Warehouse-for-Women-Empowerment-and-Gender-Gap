library("dplyr")
library("reshape2")
getwd()
setwd("/Users/MOLAP/Documents/DWBI/Raw_Data_Files")
#read a file
population <- read.csv("World_Population_ten_largest_countries.csv",TRUE,",")
#Rename
population.d1 <- population
names(population.d1)[names(population.d1) == "Countries.with.the.largest.population.2018"] <- "Country"
names(population.d1)[names(population.d1) == "X"] <- "Inhabitants"
#Remove row from table
population.d2 <- population.d1
population.d2 <- population.d2[-c(1,2), ]
#Adding a column
population.d3 <-population.d2
population.d3$Year <- 2018
#Reorder columns
population.d3 <- population.d3[c(1,3,2)]
#Remove Commas
population.d4 <- population.d3
population.d4$Inhabitants= as.numeric(gsub(",", "", population.d4$Inhabitants))
#Omit NA values
population.d4 <- na.omit(population.d4)
write.csv(population.d4, file = "C:/Users/MOLAP/Documents/DWBI/Cleaned_Data_Files/Ten_Largest_Populated_Countries.csv", quote= F, row.names = F)

          