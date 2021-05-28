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

2. From an individual lot perspective, lots 1 and 2 both pass the mandated 100 PSI variance of the suspension coils with even tighter variability and they are statistically more consistent than the total sample population (within ~1 PSI and ~7.5 PSI, respecitively). 

3. However, lot 3 does not meet the suspension coil PSI variance requirement, with a variance of ~170.30. We can interpret that lot 3 is disproprotionally skewing the total manufacturer's variance to the right. We can assume that there are data points from lot 3 that would be considered outliers, as the SD from the mean is 13 pounds per square inch. 

## Deliverable 3: T-Test on Suspension Coils
---
#### _Technical Analysis_

1. All Manufacturing Lots
```
> #Deliverable 3: T-Tests on Suspension Coils
> #All Manufacturing Lots
> t.test(mecha_coil$PSI, mu=1500)

	One Sample t-test

data:  mecha_coil$PSI
t = -1.8931, df = 149, p-value = 0.06028
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1497.507 1500.053
sample estimates:
mean of x 
  1498.78 
```

*Rscript for subsetted manufacturing lot tables required for sample population t-test

```
#Subset summary tables for each manufacturing lot
lot1 <- mecha_coil %>% filter(Manufacturing_Lot=='Lot1')
lot2 <- mecha_coil %>% filter(Manufacturing_Lot=='Lot2')
lot3 <- mecha_coil %>% filter(Manufacturing_Lot=='Lot3')

#Subset Manufacturing Lots t-tests
t.test(lot1$PSI, mu=1500)
t.test(lot2$PSI, mu=1500)
t.test(lot3$PSI, mu=1500)
```
2. Lot 1

```
> t.test(lot1$PSI, mu=1500)

	One Sample t-test

data:  lot1$PSI
t = 0, df = 49, p-value = 1
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.719 1500.281
sample estimates:
mean of x 
     1500 
```

3. Lot 2
```
> t.test(lot2$PSI, mu=1500)

	One Sample t-test

data:  lot2$PSI
t = 0.51745, df = 49, p-value = 0.6072
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.423 1500.977
sample estimates:
mean of x 
   1500.2 
```

4. Lot 3
```
> t.test(lot3$PSI, mu=1500)

	One Sample t-test

data:  lot3$PSI
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1492.431 1499.849
sample estimates:
mean of x 
  1496.14 
 ```
#### _Summary of Results_

The above t-tests evaulate the null hypothesis, which states that true mean of the sample population's PSI is statistically similar to that of the total population's PSI (mu=1500).

1. From the first t-test, which summarizes results across all manufacturing lots, we can see that the true mean of thr sample s 1498.78 with a p-value of 0.06. With this being higher than the assumed significance level of 0.05, we can then conclude that there is not enough sufficent evidence to reject the null hypothesis. In other words, in totalilty, the mean PSI of all three manufacturing lots is statisitcally similar to the presumed population mean of 1500.

2. Sample dataset Lot1 has a p-value of 1, which is much larger than our assumed significance level of 0.05. That means that the propability of another sample prototype producing the same PSI measurement from lot 1 is 100%. Alternatively, there is a 0% chance that another sample population from lot 1 would be statistically different from the population mean.

3. Lot 2 has a similar result output to the first t-test performed of all manufacturing lots, with a p-value of 0.61. Therefore, there is not sufficient evidence to reject the null hypothesis, and the sample mean is statistically similar to the populaiton mean of 1500.

4. Lot 3's t-test results produce a different scenario compared to lot1 and lot2; however, this is not surprising based on our evaluation of its summary statistics of suspension coil's PSI. The p-value output is 0.04, which is less than our assumed significance level of 0.05. Thus, we can say that there is enough evidence to reject our null hypthesis, and the sample population mean PSI is NOT statistically similar to the population's mean.

This is valuable information to the production division: Lot 3's MechaCar protoypes do not meet quality assurance requirements, specifically concerning the suspension coils, and the process in which these cars were manufactured needs to be closely reviewed moving forward. 

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
