# MechaCar_Statistical_Analysis
Performing `Retrospective, Statistical Analysis` on Car Manufacturing Datasets: Designed `Hypothesis Testing` with ` R`.
--

## Challenge Overview
---

1. Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes.
2. Collect Summary Statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots.
3. Run t-tests to determine if the manufacturing lots are statistically diffrent from the mean population .
4. Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers in conjunction with summary insights based on results.


---
## Features and Data Sources
- Data Source: `MechaCar_mpg.csv` and `Suspension_Coil.csv`
- Data Tools: `tidyverse`, `dplyr`, `ggplot2` and `MechaCarChallenge.RScript`
- Software: `RStudio` and `R`

## Challenge Deliverables
---
- Deliveragle 1: Linear Regression to Predict MPG
- Deliverable 2: Summary Statistics on Suspension Coils
- Deliverable 3: T-Test on Suspension Coils
- Deliverable 4: Design a Study Comparing the MechaCar to the competition


## Deliverable 1: Linear Regression to Predict MPG 
---
#### _Technical Analysis_
```
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
```
_Output of Results_

<img width="452" alt="D1_LinearRegressionModel" src="https://user-images.githubusercontent.com/77628698/119855515-f7d75180-bedf-11eb-8c8b-e46bed422d04.png">

#### _Summary of Results_
The above exercise of building a predicitve, multiple linear regression modeling tool allows for data scientists to extrapolate future observations and measurements of a continuous, dependent variable of interest based on various independent variables. 
Based on the summary results of our analysis above, we can conclude that:

1. The __vehichle length__, __ground clearnace__ and the __y intercept coefficent__ are statistically likely to provide a non-random amount of variance to the mpg values in the dataset as their p-values are much smaller than our significance level of 0.05%. Additionally, when the intercept has significant predicitive impact, there may be other variables of interest that can better explain variability of mpg that are not included in the model, or we may need to transform the current regression model (i.e. remove variables with little to none predicitve power) to better improve the model (__vehicle weight__, __spoiler angle__, and __AWD (All Wheel Drive)__).

2. We can reject the null hypothesis of our regression analysis test that the slope of the linear model is not considered to be zero. This interpretation is due to the fact that there are at least two known independent variables with significant predictability of the MechCar's mpg. To corroborate this, the p-value of our regression model is 5.35 x 10^-11 which is much smaller than the assumed signficance level of 0.05%, indicating that there is sufficent evidence to reject the aforementioned null hypothesis.

3. The linear model has an r-squared value of 0.7149, which means approximately 71.5% of all mpg predicitions will be correct when using this model. Thus, we can confirm that this multiple linear regression __does predict mpg of the MechaCar prototypes effectively__. We could perform additional modifications to our analysis by removing variables with little to none predictibility of variance to further quantify the effectiveness of this model, which would be determined by the updated r-squared value.

## Deliverable 2: Summary Statistics on Suspension Coils
---
#### _Technical Analysis_

```
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
```
					

_Output of Results_

1. Total Summary Statistics

<img width="307" alt="D2_total_summary" src="https://user-images.githubusercontent.com/77628698/120023385-b320e880-bfbb-11eb-91ad-aaf22272cd85.png">

2. Lot Summary Statistics

<img width="431" alt="D2_lot_summary" src="https://user-images.githubusercontent.com/77628698/120023460-cd5ac680-bfbb-11eb-9c43-93490371153f.png">

#### _Summary of Results_
The design specifications for the MechaCar suspension coils dicate that the variance of the suspension coils must not exceed 100 pounds per square inch (PSI). Based on the technical analysis above, which summarizes the results of testing the weight capacities of various suspension coils from multiple production lots, we can conclude that:

1. The sample population of manufacturing lots as a whole has a suspension coil PSI variance of ~62.3, which is comfortability within range of the 100 PSI variance requirement.

2. From an individual lot perspective, lots 1 and 2 both pass the 100 PSI variance of the suspension coils, and with even tighter variability (statistically consistent within ~1 PSI and ~7.5 PSI, respecitively. 

3. However, lot 3 does not meet the suspension coil PSI variance requirement, with a variance of ~170.30. We can interpret that lot 3 is disproprotionally skewing the total manufacturer's variance to the right. We can assume that there are data points from lot 3 that would be considered outliers, as the SD from the mean is 13 pounds per square inch. 

## Deliverable 3: T-Test on Suspension Coils
---
#### _Technical Analysis_


#### _Summary of Results_

---

## Study Design: MechaChar vs Competition
---
<brief intro to study design and though process behind usefullness to production>

2. Write a short description of a statistical study that can quantify how the MechaCar performs against the competition. In your study design, think critically about what metrics would be of interest to a consumer:
	- examples: cost, city or highway fuel efficency, horse power, maintenance cost, saftey rating.
3. In your description, address the following questions:
	- What metrics are you going to test?
	- what is the null hypothesis or altnernaive hypothesis?
	- What statistical test would you use to test the hypothesis? And why?
	- What data is neeeded to run the statistical test?
