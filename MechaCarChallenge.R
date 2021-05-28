#MODULE 15: CHALLENGE CODE `R`

#Deliverable 1: Linear Regression to Predict MPG

#Setting up R package dependencies:dplyr, tidyverse
library(dplyr)
library(tidyverse)

#Import and read in the `MechaCar_mpg.csv` file as a dataframe
mecha_mpg <- read.csv(file='MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

#Perform Linear Regression using `lm()` function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_mpg)

#Determine the p-value and the r-squared value for linear regression model using `summary()` function
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_mpg))

#Deliverable 2: Summary Statistics on Suspension Coils

#Import and read in the Suspension_Coil.csv file as a table
mecha_coil <- read.csv(file='Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

#Create a total_summary dataframe to get summary statistics of PSI column
total_summary <- mecha_coil %>% summarize(Mean_PSI=mean(PSI),
                                          Median_PSI=median(PSI),
                                          Var_PSI=var(PSI),
                                          SD_PSI =sd(PSI),.groups = 'keep')

#Create a lot_summary dataframe. Group eacb manufacturing lot by the mean, median, variance and std.dev of PSI column
lot_summary <- mecha_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                                                        Median_PSI=median(PSI),
                                                                        Var_PSI=var(PSI),
                                                                        SD_PSI =sd(PSI),.groups = 'keep')

#Deliverable 3: T-Tests on Suspension Coils

#All Manufacturing Lots t-test
t.test(mecha_coil$PSI, mu=1500)

#Subset summary tables for each manufacturing lot
lot1 <- mecha_coil %>% filter(Manufacturing_Lot=='Lot1')
lot2 <- mecha_coil %>% filter(Manufacturing_Lot=='Lot2')
lot3 <- mecha_coil %>% filter(Manufacturing_Lot=='Lot3')

#Subset Manufacturing Lots t-tests
t.test(lot1$PSI, mu=1500)
t.test(lot2$PSI, mu=1500)
t.test(lot3$PSI, mu=1500)