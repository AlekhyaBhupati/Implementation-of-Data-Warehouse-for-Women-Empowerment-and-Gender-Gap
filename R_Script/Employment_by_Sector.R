library("dplyr")
library("reshape2")
getwd()
setwd("/Users/MOLAP/DWBI/Cleaned_Data_Files")
#read a file
emp1<- read.csv("Employment_by_sector_1.csv",TRUE,",")
emp2<- read.csv("Employment_by_sector_2.csv",TRUE,",")
emp3<- read.csv("Employment_by_sector_3.csv",TRUE,",")
#remove comma
emp1$Employment.by.Sector..Rate...= gsub(",", "", emp1$Employment.by.Sector..Rate...)
emp2$Employment.by.Sector..Rate...= gsub(",", "", emp2$Employment.by.Sector..Rate...)
emp3$Employment.by.Sector..Rate...= gsub(",", "", emp3$Employment.by.Sector..Rate...)
#remove rows
emp1 <- emp1[-c(1,2),]
emp2 <- emp2[-c(1,2),]
emp3 <- emp3[-c(1,2),]
es<- rbind(emp1,emp2,emp3)
es.d1<-es
#remove columns
es.d1 <- es.d1[,-c(16,17,18,19,20)]
#melt
es.d2<-es.d1 
es.d2= melt(es.d1, id.vars = c("Employment.by.Sector..Rate...","X","X.1"),
            measure.vars = c("X.2","X.3","X.4","X.5","X.6","X.7","X.8","X.9","X.10","X.11","X.12","X.13"))
str(es.d2)
es.d2= melt(es.d1, measure.vars = c("X.2","X.3","X.4","X.5","X.6","X.7","X.8","X.9","X.10","X.11","X.12","X.13"),
            variable.name = "Year", value.name = "Percentage")
#Rename column
es.d3<- es.d2
names(es.d3)[names(es.d3) == "Employment.by.Sector..Rate..."] <- "Country"
names(es.d3)[names(es.d3) == "X"] <- "Gender"
names(es.d3)[names(es.d3) == "X.1"] <- "Sector"
#Reorder Columns
es.d3 <- es.d3[c(1,4,2,3,5)]
#Revalue data
es.d4<-es.d3
es.d4$Year= revalue(es.d4$Year, c("X.2" = "2007", "X.3" = "2008", "X.4" = "2009", "X.5" = "2010", "X.6" = "2011", "X.7" = "2012"
                                  , "X.8" = "2013", "X.9" = "2014", "X.10" = "2015", "X.11" = "2016", "X.12" = "2017", "X.13" = "2018"))
es.d4$Country= gsub(",", "", es.d4$Country)
es.d4$Percentage= gsub("%", "", es.d4$Percentage)
#Remove NA Values
es.d4 <- na.omit(es.d4)
write.csv(es.d4, file = "C:/Users/MOLAP/Documents/DWBI/Cleaned_Data_Files/Employment_by_Sector.csv", quote= F, row.names = F)
