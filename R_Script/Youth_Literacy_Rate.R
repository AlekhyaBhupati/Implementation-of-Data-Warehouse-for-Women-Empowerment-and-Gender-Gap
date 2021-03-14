library("dplyr")
library("reshape2")
getwd()
setwd("/Users/MOLAP/Documents")
#read a file
lit <- read.csv("Youth_Literacy_Rate.csv",TRUE,",")
names(lit)
str(lit)
#Rename
lit.d1 <- lit
str(lit.d1)
names(lit.d1)[names(lit.d1) == "Youth.literacy.rate..population.15.24.years..both.sexes"] <- "L_R_BOTH_sexes"
names(lit.d1)[names(lit.d1) == "ï.."] <- "Year"
names(lit.d1)[names(lit.d1) == "Youth.literacy.rate..population.15.24.years..female"] <- "L_R_Female"
names(lit.d1)[names(lit.d1) == "Youth.literacy.rate..population.15.24.years..male"] <- "L_R_Male"
write.csv(lit.d1, file = "C:/Users/MOLAP/Documents/Literacy_Rate.csv", quote= F, row.names = F)
