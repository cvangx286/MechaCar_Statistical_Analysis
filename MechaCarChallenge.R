MechaCarChallenge.RScript

library(dplyr)
library(jsonlite)
library(tidyverse)
MechaCar_mpg <- read.csv(file='MechaCar_mpg.csv', header = TRUE, check.names=F,stringsAsFactors = F)
MechaCar_mpg
head(MechaCar_mpg)

MechaCar_mpg_2 = lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + AWD + ground_clearance, data=MechaCar_mpg)
summary(MechaCar_mpg_2)

Sus_Coil <- read.csv(file='Suspension_Coil.csv', header = TRUE, check.names=F,stringsAsFactors = F)
head(Sus_Coil)

total_summary <- Sus_Coil %>% summarize(Mean=mean(PSI), Median = median(PSI),VAR = var(PSI),SD= sd(PSI)) #create summary table
total_summary

lot_summary <- Sus_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median = median(PSI),VAR = var(PSI),SD= sd(PSI),.groups = 'keep') #create summary table with multiple columns                                           
lot_summary

t.test(Sus_Coil$PSI,mu = 1500)

?t.test()

t.test(subset(Sus_Coil, Manufacturing_Lot=="Lot1")$PSI, mu = 1500)
                
t.test(subset(Sus_Coil, Manufacturing_Lot=="Lot2")$PSI, mu = 1500)

t.test(subset(Sus_Coil, Manufacturing_Lot=="Lot3")$PSI, mu = 1500)

