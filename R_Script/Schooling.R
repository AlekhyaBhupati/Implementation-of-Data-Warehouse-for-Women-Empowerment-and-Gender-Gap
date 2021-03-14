library("plyr")
library("dplyr")
library("reshape2")
getwd()
setwd("/Users/MOLAP/Documents")
#read a file
schm<- read.csv("Mean years of schooling_Male.csv",TRUE,",")
str(schm)
#remove column
schm.d1 <- schm[, -which(names(schm) %in% c("Mean.years.of.schooling..male..years.","X.2","X.4","X.6","X.8","X.10","X.12",
                                        "X.14","X.16","X.18","X.20","X.22","X.24"))]
str(schm.d1)
#remove row
schm.d1 <- schm.d1[-c(1),]
names(schm.d1)[names(schm.d1) == "X"] <- "Country"
schm.d1$Country
schm.d1 <- schm.d1[-c(173,174,175,176,177,178,179,180),]
#melt
schm.d2= melt(schm.d1, id.vars = c("Country"),
            measure.vars = c("X.1","X.3","X.5","X.7","X.9","X.11","X.13","X.15","X.17","X.19","X.21","X.23"))
str(schm.d2)
schm.d2= melt(schm.d1, measure.vars = c("X.1","X.3","X.5","X.7","X.9","X.11","X.13","X.15","X.17","X.19","X.21","X.23"),
            variable.name = "Year", value.name = "Mean_years_schooling")
#Rename column
schm.d3<- schm.d2
schm.d3
schm.d3$Year= revalue(schm.d3$Year, c("X.1" = "1990", "X.3" = "1995", "X.5" = "2000", "X.7" = "2005", "X.9" = "2010","X.11" = "2011", "X.13" = "2012", "X.15" = "2013", "X.17" = "2014", "X.19" = "2015", "X.21" = "2016", "X.23" = "2017"))
#Add column
schm.d3$Gender <- "Male"
str(schm.d3)
#Reoder columns
schm.d4 <-schm.d3[c(1,2,4,3)]
schm.d4
#Remove comma
schm.d5<-schm.d4
schm.d5$Country= gsub(",", "", schm.d5$Country)
#Omit NA
schm.d5 <- na.omit(schm.d5)
schm.d5
#Write csv
write.csv(schm.d5, file = "C:/Users/MOLAP/Documents/schooling_M.csv", quote= F, row.names = F)


####################################################################################

#read a file
schf<- read.csv("Mean years of schooling_Female.csv",TRUE,",")
str(schf)
#remove column
schf.d1 <- schf[, -which(names(schf) %in% c("Mean.years.of.schooling..female..years.","X.2","X.4","X.6","X.8","X.10","X.12",
                                            "X.14","X.16","X.18","X.20","X.22","X.24"))]
str(schf.d1)
#remove row
schf.d1 <- schf.d1[-c(1),]
names(schf.d1)[names(schf.d1) == "X"] <- "Country"
schf.d1$Country
schf.d1 <- schf.d1[-c(173,174,175,176,177,178,179,180),]
#melt
schf.d2= melt(schf.d1, id.vars = c("Country"),
              measure.vars = c("X.1","X.3","X.5","X.7","X.9","X.11","X.13","X.15","X.17","X.19","X.21","X.23"))
str(schf.d2)
schf.d2= melt(schf.d1, measure.vars = c("X.1","X.3","X.5","X.7","X.9","X.11","X.13","X.15","X.17","X.19","X.21","X.23"),
              variable.name = "Year", value.name = "Mean_years_schooling")
#Rename column
schf.d3<- schf.d2
schf.d3
schf.d3$Year= revalue(schf.d3$Year, c("X.1" = "1990", "X.3" = "1995", "X.5" = "2000", "X.7" = "2005", "X.9" = "2010","X.11" = "2011", "X.13" = "2012", "X.15" = "2013", "X.17" = "2014", "X.19" = "2015", "X.21" = "2016", "X.23" = "2017"))
#Add column
schf.d3$Gender <- "Female"
str(schf.d3)
#Reoder columns
schf.d4 <-schf.d3[c(1,2,4,3)]
schf.d4
#Remove comma
schf.d5<-schf.d4
schf.d5$Country= gsub(",", "", schf.d5$Country)
#Omit NA
schf.d5 <- na.omit(schf.d5)
schf.d5
#Write csv
write.csv(schf.d5, file = "C:/Users/MOLAP/Documents/schooling_F.csv", quote= F, row.names = F)
################################################################################################

Mean_years_of_schooling <- rbind(schm.d5,schf.d5)
Mean_years_of_schooling

#Write csv
write.csv(Mean_years_of_schooling, file = "C:/Users/MOLAP/Documents/Mean_years_of_schooling.csv", quote= F, row.names = F)
