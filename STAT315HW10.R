install.packages('mosaic')
require(mosaic)

trellis.par.set(theme = col.mosaic())
options(digits = 4)

install.packages('Sleuth3')
require(Sleuth3)

head(case1201)
pairs(~ Takers + Rank + Years + Income + Public + Expend + SAT, data = case1201)

lm1 = lm(SAT ~ Takers, data = case1201)
lm2 = lm(SAT ~ log(Takers), data = case1201)

summary(lm1)
plot(lm1)
summary(lm2)
plot(lm2)

## Q1) Which model does a better job of predicting/explaining SAT?
##  Comment on residual plots and measures of fit/signifigance.
##
## lm1 shows a clear curve in the Residuals vs Fitted plot, indicatating a lack of linearity, and a slight s-skew in the Normal-QQ plot suggesting the residuals are not Normaly distributed
## lm2 shows a much closer to linear Residuals vs Fitted plot, indicating a better linear corilarion between SAT scores and the logarithem of the number of takers, however lm2's
##      Normal-QQ plot is slightly more s-skewed than that of lm1, implying residuals are not normaly distributed.
## lm2's R^2 is higher than that of lm1 for both multiple and adjusted.
##

lm3 = lm(SAT ~ Income, data = case1201)
lm4 = lm(SAT ~ Expend, data = case1201)

summary(lm3)
plot(lm3)
summary(lm4)
plot(lm4)

## Q2) Which variable (Income/Expend) has a stronger linear relationship with SAT?
##  Comment on residual plots and measures of fit/signifigance.
##
##  Income would appear to be a better predictor of SAT score than expendature, but neither (espically expendature) have a particullarly high R^2.
##  lm3's residual vs fitted has an outlier far to the right, while lm4's shows an outlier even further to the left.
##  Residuals of Income vs SAT appear to be close to normally distributed, but Expend vs SAT shows a strong s-skew.
##

## Q3) Explain the relationship, in terms of the slope of the linear model, between the median
##      Income of test takers in a state and the SAT score.
##
##

lm.inter = lm(SAT ~ Income * Expend, data = case1201)

summary(lm.inter)
plot(lm.inter)

## Q4) Does there seem to be any interaction effect between the two variables?
##  Comment on measures of fit/signifigance.
##
##  With an adjusted R^2 of 0.374, lm.itter is not a good comparison model.

lm5 = lm(SAT ~ log(Takers) + Income + Years + Public + Expend + Rank, data = case1201)

summary(lm5)
plot(lm5)

## Q5) Do all of the variables significantly “add information” about SAT to the
##      model? Which ones do and don’t? What are you using to make that conclusion
##      (aka justify)?
##

lm6 = lm(SAT ~ log(Takers) * Income, data = case1201)
summary(lm6)

## Q6) Write out your final model (with coefficients).
##
##
##

## Q7) Are all of your variables statistically significant at the α = 0.05 level?
##
##
##

## Q8) What percentage of the variation of SAT is explained by the model?
##
##
##
