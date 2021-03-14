library("tidyverse")
library("hablar")
library("dplyr")
library("plyr")
library("reshape2")
getwd()
setwd("/Users/MOLAP/Documents/DWBI/Raw_Data_Files")
#read a file
parl <- read.csv("Seats_held_by_Women_in_Parliament.csv",TRUE,",")
#Rename Column names
parl.d1 <- parl
str(parl.d1)
names(parl.d1)[names(parl.d1) == "Proportion.of.seats.held.by.women.in.national.parliament"] <- "Country"
names(parl.d1)[names(parl.d1) == "X"] <- "Year"
names(parl.d1)[names(parl.d1) == "X.1"] <- "Sector"
names(parl.d1)[names(parl.d1) == "X.4"] <- "Percentage_0f_seats"
#Remove columns
parl.d1 <- parl.d1[,-c(1,5,6,8,9)]
#Revalue data
str(parl.d2)
parl.d2 <-parl.d1
parl.d2$Sector= revalue(parl.d2$Sector, c("Seats held by women in national parliament, as of February (%)" = "Parliment"))
#Remove comma
parl.d2$Country= gsub(",.*", "", parl.d2$Country)
parl.d2$Country= gsub("\\Total", "World", parl.d2$Country)
#Filter Not values
parl.d3 <- parl.d2
parl.d3<- filter(parl.d3,!Country %in% c("World","Africa","Northern Africa","Sub-Saharan Africa","Eastern Africa","Middle Africa","Southern Africa"   ,"Western Africa"
                                         ,"Americas","Northern America","Latin America & the Caribbean","Caribbean","Central America","South America","Asia","Central Asia","Eastern Asia"
                                         ,"South-eastern Asia","Southern Asia","Western Asia","Europe","Eastern Europe" ,"Northern Europe","Southern Europe","Western Europe","Oceania",
                                         "Australia and New Zealand","Melanesia","Micronesia","Polynesia"))
parl.d3 <- parl.d3[-c(1),]
#Add a column
parl.d4 <- parl.d3
names(parl.d4)[names(parl.d4) == "Percentage_0f_seats"] <- "Female"
#Converting to numeric character
parl.d4$Female <- as.numeric(as.character(parl.d4$Female) ) 
parl.d4$Male <- (100 - parl.d4$Female)
#melt
parl.d5 <- parl.d4
parl.d6= melt(parl.d5, id.vars = c("Country","Year","Sector"),
                 measure.vars = c("Female","Male"))
parl.d6= melt(parl.d5, measure.vars = c("Female","Male"),
                 variable.name = "Gender", value.name = "Percentage")
#omit NA values
parl.d6 <- na.omitparl.d6
write.csv(parl.d6, file = "C:/Users/MOLAP/Documents/DWBI/Cleaned_Data_Files/Women_in_Parliment.csv", quote= F, row.names = F) 


