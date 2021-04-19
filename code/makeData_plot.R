#####################################################################
##
## Script name: makeData_plot.R
##
## Author: Adam N. Price
##
## Date Created: 2021-04-19
##
## Copyright (c) Adam N. Price, 2021
## Email: adnprice@ucsc.edu
##
############################# Description ##########################
##
## 
##   
##
############################# Packages #############################
##
## 
library(ggplot2)
library(tidyverse)
library(dataRetrieval)
##
############################# Code ################################

site ="11160500"

plt = dataRetrieval::readNWISdv(siteNumbers = site,startDate = "2019-10-01",endDate = "2020-09-30",parameterCd = "00060") %>%
  ggplot()+
  geom_line(aes(x=Date,y=X_00060_00003))+
  theme_minimal()+
  ylab('Discharge(cfs)')+
  xlab("Date")

pdf(paste0("docs/",site,"_plot.pdf"))
plt
dev.off()

write_csv(x = dataRetrieval::readNWISdv(siteNumbers = site,startDate = "2019-10-01",endDate = "2020-09-30",parameterCd = "00060"),file="data/SanLorenzoWY2020.csv")
