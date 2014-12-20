#### Quiz 3 - Regression Course

# setwd("~/R-projects/Regression/regression")
setwd("~/Projects/Regression/regression")


### Q1 
# Consider the mtcars data set. Fit a model with mpg as the outcome that 
# includes number of cylinders as a factor variable and weight as confounder. 
# Give the adjusted estimate for the expected change in mpg comparing 8 
# cylinders to 4.

# ANSWER = -6.071

### this section just for fun###
data(mtcars)
plot(mtcars$cyl, mtcars$mpg)

model <- lm(mpg ~ as.factor(cyl), mtcars)
summary(model)$coefficients
### this section just for fun###

# adjusted estimate is intercept (cyl = 4) + coeff of 
modelconf <- lm(mpg ~ as.factor(cyl) + wt, mtcars)


answer <- summary(modelconf)$coefficients[3,1]

### Q2
# Consider the mtcars data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight as a possible 
# confounding variable. Compare the effect of 8 versus 4 cylinders on mpg for the adjusted and unadjusted by weight models. Here, adjusted means 
# including the weight variable as a term in the regression model and unadjusted means the model without weight included. What can be said about the 
# effect comparing 8 and 4 cylinders after looking at models with and without weight included?.

data(mtcars)
plot(mtcars$cyl, mtcars$mpg)

model <- lm(mpg ~ as.factor(cyl), mtcars)
summary(model)$coefficients

modelconf <- lm(mpg ~ as.factor(cyl) + wt, mtcars)

summary(model)$coefficients[3,1]
summary(modelconf)$coefficients[3,1]

# ANSWER = Holding weight constant, cylinder appears to have less of an impact on mpg than if weight is disregarded.


### Q3 
# Consider the mtcars data set. Fit a model with mpg as the outcome that considers number of cylinders as a factor variable and weight as confounder. 
# Now fit a second model with mpg as the outcome model that considers the interaction between number of cylinders (as a factor variable) and weight. 
# Give the P-value for the likelihood ratio test comparing the two models and suggest a model using 0.05 as a type I error rate significance benchmark.




### Q4


### Q5


### Q6


### Q7
