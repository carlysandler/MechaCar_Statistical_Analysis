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

1. The __vehichle length__, __ground clearnace__ and the __y intercept coefficent__ are statistically likely to provide a non-random amount of variance to the mpg values in the dataset as their p-values are much smaller than our significance level of 0.05%. When the intercept has significant predicitive impact, there may be other variables of interest that can better explain variability of mpg that are not included in the model, or we may need to transform the current regression model (i.e. remove variables with little to none predicitve power) to better improve the model (__vehicle weight__, __spoiler angle__, and __AWD (All Wheel Drive)__).
2. We can reject the null hypothesis of our regression test because the The slope of the linear model is not considered to be zero.

## Deliverable 2: Summary Statistics on Suspension Coils
---
#### _Technical Analysis_

_Output of Results_

#### _Summary of Results_



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
