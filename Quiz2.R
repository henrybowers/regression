#### Quiz 2 - Regression Course

setwd("~/R-projects/Regression")


### Q1 
# Give a P-value for the two sided hypothesis test of whether B1 from a linear regression model is 0 or not.

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

plot(x,y)

model <- lm(y ~ x)

# p-value of intercept
summary(model)$coefficients[1,4]


# ANSWER = 0.391



### Q2
# Give the standard deviation for the residuals of the model above

# standard error of residuals
summary(model)$sigma

# ANSWER = 0.223


### Q3 
# In the mtcars data set, fit a linear regression model of weight (predictor) on mpg (outcome). Get a 95% confidence interval 
# for the expected mpg at the average weight. What is the lower endpoint?

data(mtcars)
plot(mtcars$wt,mtcars$mpg)

# adjust x so that B1 = expected y at mean of x
model <- lm(mpg ~ I(wt-mean(wt)) ,mtcars)

#as an aside
expectedMPGatMeanWt <- summary(model)$coefficients[1,1]

#confint gives confidence intervals for coefficients of model, defaults to 95%
confint(model)

#to get lower bound of B1
confint(model)[2,1]

# ANSWER = -6.486


### Q4
# Refer to the previous question. Read the help file for mtcars. What is the weight coefficient interpreted as?

# ANSWER = The estimated expected change in mpg per 1,000 lb increase in weight.



### Q5
# Consider again the mtcars data set and a linear regression model with mpg as predicted by weight (1,000 lbs). A new car is 
# coming weighing 3000 pounds. Construct a 95% prediction interval for its mpg. What is the upper endpoint?

data(mtcars)

model <- lm(mpg ~ wt ,mtcars)

predX <- data.frame(wt=c(3))

pred <- predict(model,predX,interval="prediction")
pred
pred[3]

# ANSWER = 27,57



### Q6
# Consider again the mtcars data set and a linear regression model with mpg as predicted by weight (in 1,000 lbs). A "short" 
# ton is defined as 2,000 lbs. Construct a 95% confidence interval for the expected change in mpg per 1 short ton increase in 
# weight. Give the lower endpoint.

# multiplication of X by a factor 'a' results in dividing the coefficient by a factor of 'a'.
# x is measured in 1000s of lbs; we want 2000s of lbs
# factor here then is 1/2 (1000/2000), so multiply X by 0.5 to get Y in mpgs/short ton

# x 1klbs, convert to x short tons multiply by short-ton / 2 klbs

model <- lm(mpg ~ I(0.5*wt),mtcars)
summary(model)
confint(model)
confint(model)[2,1]

# ANSWER = -12.973



### Q7
# If my X from a linear regression is measured in centimeters and I convert it to meters what would happen to the slope 
# coefficient?

# multipl x by 1 m / 100 cm , so divide B1 by 1/100 , or multiply B1 by 100

# ANSWER = slope increases 100x


### Q8
# I have an outcome, Y, and a predictor, X and fit a linear regression model with Y=??B0 + B1 * X +??e to obtain B0 and B1. What 
# would be the consequence to the subsequent slope and intercept if I were to refit the model with a new regressor, X + c for 
# some constant, c?

# Y = B0 - cB1 + B1(x + c)
# so new intercept would be B0 - cB1

# ANSWER = intercept is now B0 - c*B1


### Q9
# Refer back to the mtcars data set with mpg as an outcome and weight (wt) as the predictor. About what is the ratio of the 
# the sum of the squared errors, ???ni=1(Yi???Y^i)2 when comparing a model with just an intercept (denominator) to the model with 
# the intercept and slope (numerator)?

model1 <- lm(mpg ~ wt,mtcars)
model2 <- lm(mpg ~ wt - 1, mtcars)

sse1<-summary(model1)$sigma
sse2<-summary(model2)$sigma

sse1/sse2

# ANSWER = 0.27 which is nearest 0.25


### Q10
# Do the residuals always have to sum to 0 in linear regression?

# ANSWER = If an intercept is included, then they will sum to 0.
