library("dplyr")
library("reshape2")
getwd()
setwd("/Users/MOLAP/Documents/DWBI/Raw_Data_Files")
#read a file
gender1 <- read.csv("Gap.csv",TRUE,",")
#Melt
gender1.m1= melt(gender1, id.vars = c("Country.ISO3","Country.Name","Indicator","Subindicator.Type"),
                 measure.vars = c("X2006","X2007","X2008","X2009","X2010","X2011","X2012","X2013","X2014","X2015","X2016","X2018"))
gender1.m1= melt(gender1, measure.vars = c("X2006","X2007","X2008","X2009","X2010","X2011","X2012","X2013","X2014","X2015","X2016","X2018"),
                 variable.name = "Year", value.name = "subindex")
gender1.m2<- gender1.m1
#Filter
gender1.m2<- filter(gender1.m2,Indicator %in% c("Global Gender Gap Economic Participation and Opportunity Subindex","Global Gender Gap Educational Attainment Subindex","Global Gender Gap Health and Survival Subindex","Global Gender Gap Political Empowerment subindex"))
#Remove first letter in a value
gender1.m2$Year_1= as.numeric(gsub("\\X", "", gender1.m2$Year))
#Remove column
gender1.m2 <- gender1.m2[,-5]
#Rename
gender1.m3 <- gender1.m2
names(gender1.m3)[names(gender1.m3) == "Country.ISO3"] <- "Country_ID"
names(gender1.m3)[names(gender1.m3) == "Country.Name"] <- "Country"
names(gender1.m3)[names(gender1.m3) == "Subindicator.Type"] <- "Subindicator_Type"
names(gender1.m3)[names(gender1.m3) == "Year_1"] <- "Year"
#Reorder Columns
gender1.m3 <- gender1.m3[c(1,2,6,3,4,5)]
#Remove column
gender1.m3 <- gender1.m3[,-1]
#Remove spaces in strings
gender1.m4 <- gender1.m3
#to add underscore between strings
gender1.m4$Indicator= gsub(" ", "_", gender1.m4$Indicator)
#Remove unnecessary data
gender1.m4$Indicator= gsub("\\Global_Gender_Gap_", "", gender1.m4$Indicator)
#Remove Commas and rest of the value
gender1.m5 <- gender1.m4
gender1.m5$Country= gsub(",.*", "", gender1.m5$Country)
gender1.m6 <- gender1.m5
# Omit NA values
gender1.m6 <- na.omit(gender1.m6)
write.csv(gender1.m6, file = "C:/Users/MOLAP/Documents/DWBI/Cleaned_Data_Files/Global_Gender_gap.csv", quote= F, row.names = F)
