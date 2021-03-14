library("xml2")
library("rvest")
library("stringr")
library("dplyr")
library("plyr")
library("reshape2")
webpage <- read_html("https://datahelpdesk.worldbank.org/knowledgebase/articles/906519")
#############################################
eap <- webpage %>% html_nodes("table")%>%.[2]%>%html_table(fill = T)
eap <- as.data.frame(eap)
eap.d1 <- eap
eap.d2= melt(eap.d1, measure.vars = c("X1","X2","X3"))
eap.d2= melt(eap.d1, measure.vars = c("X1","X2","X3"),
              variable.name = "Region", value.name = "Country")
eap.d3<- eap.d2
eap.d3$Country= gsub(",", "", eap.d3$Country)
eap.d3$Country= gsub("\n", "", eap.d3$Country)
eap.d3$Region= revalue(eap.d3$Region, c("X1" = "East Asia and Pacific"))
eap.d3$Region= revalue(eap.d3$Region, c("X2" = "East Asia and Pacific"))
eap.d3$Region= revalue(eap.d3$Region, c("X3" = "East Asia and Pacific"))
eap.d3 <- eap.d3[-c(39),]
################################################

eca <- webpage %>% html_nodes("table")%>%.[3]%>%html_table(fill = T)
eca <- as.data.frame(eca)
eca.d1 <- eca
eca.d2= melt(eca.d1, measure.vars = c("X1","X2","X3"))
eca.d2= melt(eca.d1, measure.vars = c("X1","X2","X3"),
             variable.name = "Region", value.name = "Country")
eca.d3<- eca.d2
eca.d3$Country= gsub(",", "", eca.d3$Country)
eca.d3$Country= gsub("\n", "", eca.d3$Country)
eca.d3$Region= revalue(eca.d3$Region, c("X1" = "Europe and Central Asia"))
eca.d3$Region= revalue(eca.d3$Region, c("X2" = "Europe and Central Asia"))
eca.d3$Region= revalue(eca.d3$Region, c("X3" = "Europe and Central Asia"))
eca.d3 <- eca.d3[-c(59,60),]

########################################################

lac <- webpage %>% html_nodes("table")%>%.[4]%>%html_table(fill = T)
lac <- as.data.frame(lac)
lac.d1 <- lac
lac.d2= melt(lac.d1, measure.vars = c("X1","X2","X3"))
lac.d2= melt(lac.d1, measure.vars = c("X1","X2","X3"),
             variable.name = "Region", value.name = "Country")
lac.d3<- lac.d2
lac.d3$Country= gsub(",", "", lac.d3$Country)
lac.d3$Country= gsub("\n", "", lac.d3$Country)
lac.d3$Region= revalue(lac.d3$Region, c("X1" = "Latin America & the Caribbean"))
lac.d3$Region= revalue(lac.d3$Region, c("X2" = "Latin America & the Caribbean"))
lac.d3$Region= revalue(lac.d3$Region, c("X3" = "Latin America & the Caribbean"))
write.csv(lac.d3,"Latin_America_and_the_Caribbean.csv")
#####################################################################

mena <- webpage %>% html_nodes("table")%>%.[5]%>%html_table(fill = T)
mena <- as.data.frame(mena)
mena.d1 <- mena
mena.d2= melt(mena.d1, measure.vars = c("X1","X2","X3"))
mena.d2= melt(mena.d1, measure.vars = c("X1","X2","X3"),
             variable.name = "Region", value.name = "Country")
mena.d3<- mena.d2
mena.d3$Country= gsub(",", "", mena.d3$Country)
mena.d3$Country= gsub("\n", "", mena.d3$Country)
mena.d3$Region= revalue(mena.d3$Region, c("X1" = "Middle East and North Africa"))
mena.d3$Region= revalue(mena.d3$Region, c("X2" = "Middle East and North Africa"))
mena.d3$Region= revalue(mena.d3$Region, c("X3" = "Middle East and North Africa"))
############################################################################
na <- webpage %>% html_nodes("table")%>%.[6]%>%html_table(fill = T)
na <- as.data.frame(na)
na.d1 <- na
na.d2= melt(na.d1, measure.vars = c("X1","X2","X3"))
na.d2= melt(na.d1, measure.vars = c("X1","X2","X3"),
            variable.name = "Region", value.name = "Country")
na.d3<- na.d2
na.d3$Country= gsub(",", "", na.d3$Country)
na.d3$Country= gsub("\n", "", na.d3$Country)
na.d3$Region= revalue(na.d3$Region, c("X1" = "North America"))
na.d3$Region= revalue(na.d3$Region, c("X2" = "North America"))
na.d3$Region= revalue(na.d3$Region, c("X3" = "North America"))

###########################################################################
sa <- webpage %>% html_nodes("table")%>%.[7]%>%html_table(fill = T)
sa <- as.data.frame(sa)
sa.d1 <- sa
sa.d2= melt(sa.d1, measure.vars = c("X1","X2","X3"))
sa.d2= melt(sa.d1, measure.vars = c("X1","X2","X3"),
            variable.name = "Region", value.name = "Country")
sa.d3<- sa.d2
sa.d3$Country= gsub(",", "", sa.d3$Country)
sa.d3$Country= gsub("\n", "", sa.d3$Country)
sa.d3$Region= revalue(sa.d3$Region, c("X1" = "South Asia"))
sa.d3$Region= revalue(sa.d3$Region, c("X2" = "South Asia"))
sa.d3$Region= revalue(sa.d3$Region, c("X3" = "South Asia"))
sa.d3 <- sa.d3[-c(9),]
#############################################################################

ssa <- webpage %>% html_nodes("table")%>%.[8]%>%html_table(fill = T)
ssa <- as.data.frame(ssa)
ssa.d1 <- ssa
ssa.d2= melt(ssa.d1, measure.vars = c("X1","X2","X3"))
ssa.d2= melt(ssa.d1, measure.vars = c("X1","X2","X3"),
            variable.name = "Region", value.name = "Country")
ssa.d3<- ssa.d2
ssa.d3$Country= gsub(",", "", ssa.d3$Country)
ssa.d3$Country= gsub("\n", "", ssa.d3$Country)
ssa.d3$Region= revalue(ssa.d3$Region, c("X1" = "Sub-Saharan Africa"))
ssa.d3$Region= revalue(ssa.d3$Region, c("X2" = "Sub-Saharan Africa"))
ssa.d3$Region= revalue(ssa.d3$Region, c("X3" = "Sub-Saharan Africa"))

################################################################################

lie <- webpage %>% html_nodes("table")%>%.[9]%>%html_table(fill = T)
lie <- as.data.frame(lie)
lie.d1 <- lie
lie.d2= melt(lie.d1, measure.vars = c("X1","X2","X3"))
lie.d2= melt(lie.d1, measure.vars = c("X1","X2","X3"),
             variable.name = "Income_Level", value.name = "Country")
lie.d3<- lie.d2
lie.d3$Country= gsub(",", "", lie.d3$Country)
lie.d3$Country= gsub("\n", "", lie.d3$Country)
lie.d3$Income_Level= revalue(lie.d3$Income_Level, c("X1" = "Low-income economies"))
lie.d3$Income_Level= revalue(lie.d3$Income_Level, c("X2" = "Low-income economies"))
lie.d3$Income_Level= revalue(lie.d3$Income_Level, c("X3" = "Low-income economies"))
lie.d3 <- lie.d3[-c(35,36),]
#################################################################################

lmie <- webpage %>% html_nodes("table")%>%.[10]%>%html_table(fill = T)
lmie <- as.data.frame(lmie)
lmie.d1 <- lmie
lmie.d2= melt(lmie.d1, measure.vars = c("X1","X2","X3"))
lmie.d2= melt(lmie.d1, measure.vars = c("X1","X2","X3"),
             variable.name = "Income_Level", value.name = "Country")
lmie.d3<- lmie.d2
lmie.d3$Country= gsub(",", "", lmie.d3$Country)
lmie.d3$Country= gsub("\n", "", lmie.d3$Country)
lmie.d3$Income_Level= revalue(lmie.d3$Income_Level, c("X1" = "Lower-middle-income economies"))
lmie.d3$Income_Level= revalue(lmie.d3$Income_Level, c("X2" = "Lower-middle-income economies"))
lmie.d3$Income_Level= revalue(lmie.d3$Income_Level, c("X3" = "Lower-middle-income economies"))
lmie.d3 <- lmie.d3[-c(48),]
#######################################################################################

umie <- webpage %>% html_nodes("table")%>%.[11]%>%html_table(fill = T)
umie <- as.data.frame(umie)
umie.d1 <- umie
umie.d2= melt(umie.d1, measure.vars = c("X1","X2","X3"))
umie.d2= melt(umie.d1, measure.vars = c("X1","X2","X3"),
              variable.name = "Income_Level", value.name = "Country")
umie.d3<- umie.d2
umie.d3$Country= gsub(",", "", umie.d3$Country)
umie.d3$Country= gsub("\n", "", umie.d3$Country)
umie.d3$Income_Level= revalue(umie.d3$Income_Level, c("X1" = "Upper-middle-income economies"))
umie.d3$Income_Level= revalue(umie.d3$Income_Level, c("X2" = "Upper-middle-income economies"))
umie.d3$Income_Level= revalue(umie.d3$Income_Level, c("X3" = "Upper-middle-income economies"))
umie.d3 <- umie.d3[-c(57),]
#######################################################################################

hie <- webpage %>% html_nodes("table")%>%.[12]%>%html_table(fill = T)
hie <- as.data.frame(hie)
hie.d1 <- hie
hie.d2= melt(hie.d1, measure.vars = c("X1","X2","X3"))
hie.d2= melt(hie.d1, measure.vars = c("X1","X2","X3"),
              variable.name = "Income_Level", value.name = "Country")
hie.d3<- hie.d2
hie.d3$Country= gsub(",", "", hie.d3$Country)
hie.d3$Country= gsub("\n", "", hie.d3$Country)
hie.d3$Income_Level= revalue(hie.d3$Income_Level, c("X1" = "High-income economies"))
hie.d3$Income_Level= revalue(hie.d3$Income_Level, c("X2" = "High-income economies"))
hie.d3$Income_Level= revalue(hie.d3$Income_Level, c("X3" = "High-income economies"))

################################################################################

RWC <- rbind(eap.d3,eca.d3,lac.d3,mena.d3,na.d3,sa.d3,ssa.d3)
RWC$World <- "World"
#Reorder columns
Region_Wise_Countries <- RWC[c(3,1,2)]
#Remove NA Values
Region_Wise_Countries <- na.omit(Region_Wise_Countries)
write.csv(Region_Wise_Countries, file = "C:/Users/MOLAP/Documents/DWBI/Cleaned_Data_Files/Region_Wise_Countries.csv", quote= F, row.names = F)

###############################################################################

IEC <- rbind(lie.d3,lmie.d3,umie.d3,hie.d3)
IEC$World <- "World"
#Reorder columns
Income_Wise_Countries <- IEC[c(3,1,2)]
#Remove NA Vales
Income_Wise_Countries <- na.omit(Income_Wise_Countries)
write.csv(Income_Wise_Countries, file = "C:/Users/MOLAP/Documents/DWBI/Cleaned_Data_Files/Income_Wise_Countries.csv", quote= F, row.names = F)

###############################################################################

