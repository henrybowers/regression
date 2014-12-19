## Regression 12/06/14
## Quiz 1

setwd("~/R-projects/Regression")
install.packages('usingR')


#### Q1
#Give the value of mu that minimizes the least squares equation w*(x - mu)^2


x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)

sum(x*w)/sum(w)

# WRONG! Use weighted mean function instead
#a <- c(0.0025,0.300,0.1471,1.077)
#choices <- w*(x-a)^2
#choices <- cbind(a, choices)
#choices

mean(x)
weighted.mean(x,w)

# ANSWER = 0.1471



#### Q2
# Fit the regression through the origin and get the slope treating y as the outcome and x as the regressor. (Hint, do not 
# center the data since we want regression through the origin, not through the means of the data.

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

# pattern of call ---> lm(I(child - mean(child))~ I(parent - mean(parent)) - 1, data = galton)

# this is not correct -----
#y-mean(y)
#x-mean(x)
#model <- lm( I(y-mean(y)) ~ I(x-mean(x)) - 1) # no offset
#summary(model)
#model$coefficient
# --------------

model <- lm( y ~ x - 1) # no offset
summary(model)
model$coefficient

#plot(model)
plot.new()
plot(x,y,)
lines(x,model$fitted)

#ANSWER = 0.8263

# try with offset
model <- lm( y ~ x) # offset
summary(model)
model$coefficients
#plot(model)
plot.new()
plot(x,model$fitted)
lines(x,model$fitted)




#### Q3
# Do data(mtcars) from the datasets package and fit the regression model with mpg as the outcome and weight as the predictor. Give the slope coefficient.

data(mtcars)
model <- (lm(mpg ~ wt, data = mtcars))
summary(model)
model$coefficients
plot(mtcars$wt,model$fitted)
lines(mtcars$wt,model$fitted)

#ANSWER = -5.344



#### Q4
# Consider data with an outcome (Y) and a predictor (X). The standard deviation of the predictor is one half that of the 
# outcome. The correlation between the two variables is .5. What value would the slope coefficient for the regression model 
# with Y as the outcome and X as the predictor?

#coeff = cor(y,x) * (sd(y)/sd(x))

coeff <- 0.5 * 2

#ANSWER = 1



#### Q5
# Students were given two hard tests and scores were normalized to have empirical mean 0 and variance 1. The correlation 
# between the scores on the two tests was 0.4. What would be the expected score on Quiz 2 for a student who had a normalized 
# score of 1.5 on Quiz 1?

# intercept = mean(y) - coeff * mean(x)
#
# here the coeff = 0.4 because sd(x) = sd(y) = sqrt(1)
#
# then intercept = 0 - 0.4 * 0 = 0
#
# so regression line equation is y = 0 + 0.4x

expectedScore <- 0.4*1.5

#ANSWER = 0.6



#### Q6
# What is the value of the first measurement if x were normalized (to have mean 0 and variance 1)?

x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
xNorm <- (x - mean(x))/sd(x)
xNorm[1]

#ANSWER = -0.9719



#### Q7
# Consider the following data set (used above as well). What is the intercept for fitting the model with x as the predictor 
# and y as the outcome?

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

model <- lm(y ~ x)
model$coefficients[1]

#ANSWER = 1.567



#### Q8
# You know that both the predictor and response have mean 0. What can be said about the intercept when you fit a linear 
# regression?

#ANSWER = Intercept must be zero, because it = mean(y) - coeff * mean(x)



#### Q9
# What value minimizes the sum of the squared distances between these points and itself?

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)

#ANSWER = 0.573



#### Q10
# Let the slope having fit Y as the outcome and X as the predictor be denoted as Beta1. Let the slope from fitting X as the 
# outcome and Y as the predictor be denoted as Gamma1. Suppose that you divide Beta1 by Gamma1; in other words consider 
# Beta1/Gamma1. What is this ratio always equal to?

# Beta1 = Cor(y,x) * sd(y)/sd(x)
# Gamma1 = Cor(y,x) * sd(x)/sd(y)

# Beta1/Gamma1 = (sd(y)/sd(x)) * (sd(y)/sd(x))
# = var(y)/var(x)
