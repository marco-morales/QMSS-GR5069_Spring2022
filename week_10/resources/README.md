
## Conditional effects and interactions



```r
library(readr)         
library(tidyverse)
library(BART)
library(parallel)
```





### Conditional effects: a parametric perspective

From our long running sample dataset, we are seeking to answer two different questions: 

1. **are there more expected deaths when combat is heavier?**
2. **are there no expected deaths when no weapons are seized?**

We start by computing your full interactive model, including **all terms** that constitute the **interactions**. In this case, we're interested in evaluating the effects of long guns and cartridges on confrontations where each armed force participated. 

Note that as long as you include the interactions, R will automatically include the constitutive terms. 


```r
ols_interaction <-
  lm(organized_crime_dead ~ organized_crime_wounded +
       afi*long_guns_seized + 
       army*long_guns_seized + 
       navy*long_guns_seized + 
       federal_police*long_guns_seized +
       afi*cartridge_sezied + 
       army*cartridge_sezied + 
       navy*cartridge_sezied + 
       federal_police*cartridge_sezied +
       small_arms_seized + 
       clips_seized , 
     data = AllData) 
summary(ols_interaction) 
```

```
## 
## Call:
## lm(formula = organized_crime_dead ~ organized_crime_wounded + 
##     afi * long_guns_seized + army * long_guns_seized + navy * 
##     long_guns_seized + federal_police * long_guns_seized + afi * 
##     cartridge_sezied + army * cartridge_sezied + navy * cartridge_sezied + 
##     federal_police * cartridge_sezied + small_arms_seized + clips_seized, 
##     data = AllData)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -8.6509 -0.7385 -0.4189  0.1933 27.2187 
## 
## Coefficients:
##                                   Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                      0.4188645  0.0336777  12.437  < 2e-16 ***
## organized_crime_wounded          0.3624050  0.0237796  15.240  < 2e-16 ***
## afi                             -0.0419271  0.5040535  -0.083   0.9337    
## long_guns_seized                 0.1713811  0.0172327   9.945  < 2e-16 ***
## army                             0.4244453  0.0556353   7.629 2.78e-14 ***
## navy                             0.2772627  0.1567621   1.769   0.0770 .  
## federal_police                  -0.1113463  0.0801781  -1.389   0.1650    
## cartridge_sezied                 0.0002292  0.0000968   2.368   0.0179 *  
## small_arms_seized               -0.0452969  0.0186014  -2.435   0.0149 *  
## clips_seized                     0.0003127  0.0003146   0.994   0.3202    
## afi:long_guns_seized             0.0229013  0.0784035   0.292   0.7702    
## long_guns_seized:army           -0.0459567  0.0181403  -2.533   0.0113 *  
## long_guns_seized:navy            0.1761160  0.0421782   4.176 3.02e-05 ***
## long_guns_seized:federal_police -0.0253811  0.0190541  -1.332   0.1829    
## afi:cartridge_sezied            -0.0050516  0.0031231  -1.617   0.1058    
## army:cartridge_sezied           -0.0003911  0.0000981  -3.987 6.78e-05 ***
## navy:cartridge_sezied           -0.0006909  0.0001728  -3.998 6.47e-05 ***
## federal_police:cartridge_sezied -0.0001518  0.0001102  -1.377   0.1685    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.714 on 5378 degrees of freedom
## Multiple R-squared:  0.1587,	Adjusted R-squared:  0.156 
## F-statistic: 59.67 on 17 and 5378 DF,  p-value: < 2.2e-16
```

As means of comparison this is how well this interactive model performs. 


```r
AllData %>%
  select(organized_crime_dead) %>%
  mutate(fitted = fitted(ols_interaction)) %>%
  ggplot(aes(x = organized_crime_dead, y = fitted )) +
  geom_point(color= "blue", size = 3) +
  geom_abline(aes(slope = 1, intercept = 0), color = "grey30") +
  scale_y_continuous("fitted", limits = c(0, 30)) +
  scale_x_continuous(limits = c(0, 30)) +
  theme_minimal()
```

![plot of chunk ols_fit](images//ols_fit-1.png)


#### How do we compute interactive effects?

Looking at the coefficients of the interaction - such as `long_guns_seized:federal_police` is not sufficient to get the estimated interactive effects. You need to include all constitutive terms for the particular effect you seek to estimate.  

To do that, first, we need to extract the vector with the estimated coefficients from the model, as well as the the corresponding stantard errors from the estimated covariance matrix.


```r
beta <- coef(ols_interaction)                # extracts a vector of betas
varcov <- as.matrix(vcov(ols_interaction))   # extracts estimated covariance matrix
var <- diag(vcov(ols_interaction))           # extracts a vector with variances
```


```r
beta
```

```
##                     (Intercept)         organized_crime_wounded 
##                    0.4188644926                    0.3624049670 
##                             afi                long_guns_seized 
##                   -0.0419271355                    0.1713811265 
##                            army                            navy 
##                    0.4244453302                    0.2772627314 
##                  federal_police                cartridge_sezied 
##                   -0.1113463514                    0.0002292115 
##               small_arms_seized                    clips_seized 
##                   -0.0452968567                    0.0003127547 
##            afi:long_guns_seized           long_guns_seized:army 
##                    0.0229012592                   -0.0459567529 
##           long_guns_seized:navy long_guns_seized:federal_police 
##                    0.1761159609                   -0.0253811442 
##            afi:cartridge_sezied           army:cartridge_sezied 
##                   -0.0050515632                   -0.0003911263 
##           navy:cartridge_sezied federal_police:cartridge_sezied 
##                   -0.0006909381                   -0.0001518391
```

```r
var
```

```
##                     (Intercept)         organized_crime_wounded 
##                    1.134184e-03                    5.654716e-04 
##                             afi                long_guns_seized 
##                    2.540700e-01                    2.969655e-04 
##                            army                            navy 
##                    3.095287e-03                    2.457437e-02 
##                  federal_police                cartridge_sezied 
##                    6.428527e-03                    9.370303e-09 
##               small_arms_seized                    clips_seized 
##                    3.460137e-04                    9.896533e-08 
##            afi:long_guns_seized           long_guns_seized:army 
##                    6.147108e-03                    3.290699e-04 
##           long_guns_seized:navy long_guns_seized:federal_police 
##                    1.779002e-03                    3.630599e-04 
##            afi:cartridge_sezied           army:cartridge_sezied 
##                    9.753700e-06                    9.624112e-09 
##           navy:cartridge_sezied federal_police:cartridge_sezied 
##                    2.986624e-08                    1.215546e-08
```

#### Are there more expected deaths when combat is heavier?

To address the first question, we have to assume that a high number of long guns seized is a proxy for heavy combat. That is, we need to assume that it is more likely that more long guns are **used and seized** when heavy combat takes place. Therefore, we'll compute the marginal effect of 5 seized long guns on the expected number of dead on events that involve the Navy. 

We begin by defining an appropriate quantity for our conditioning variable `long_guns_seized`


```r
long_guns <- 5 
```

Then, we use our known formula to compute the appropriate marginal effect: 



```r
mfx_1 <- as.numeric(beta["navy"]) + 
         as.numeric(beta["long_guns_seized:navy"])*long_guns
mfx_1
```

```
## [1] 1.157843
```

Similarly, we use our known formula to compute the appropriate standard errors, per the variance formula:



```r
mfx_1_se <- sqrt(
            var["navy"] + 
            long_guns^2*var["long_guns_seized:navy"] +
            2*long_guns*varcov["navy", "long_guns_seized:navy"]
            )
mfx_1_se
```

```
##      navy 
## 0.2104287
```

It is now easy to compute the lower and higher bounds of the marginal effect:


```r
mfx_1_lo_se <- mfx_1 - 1.96* mfx_1_se  # computing a lower bound se
mfx_1_hi_se <- mfx_1 + 1.96* mfx_1_se  # computing the higher bound se

print(paste0(long_guns, " seized long guns increase the expected number of dead in events that involve the Navy by ",
             round(mfx_1, 2), " [", round(mfx_1_lo_se, 2), ", ", round(mfx_1_hi_se, 2), "]."
             ))
```

```
## [1] "5 seized long guns increase the expected number of dead in events that involve the Navy by 1.16 [0.75, 1.57]."
```


#### Are there no expected deaths when no weapons are seized?

To address the second question, we repeat the exercise and compute the marginal effect on the expected number of dead of events that involve the Army when no long guns (zero) are seized. This value is now assigned to our  conditioning variable `long_guns_seized`.


```r
long_guns_null <- 0
```

Again, we use our known formula to compute the appropriate marginal effect. Note that the second term is effectively dropped as the value of `long_guns_seized` is zero (0). 


```r
mfx_2 <- as.numeric(beta["army"]) + 
  as.numeric(beta["long_guns_seized:army"])*long_guns_null
mfx_2
```

```
## [1] 0.4244453
```

We compute the appropriate standard errors, per the variance formula, with the same caveat as above:



```r
mfx_2_se <- sqrt(
            var["army"] + 
            long_guns_null^2*var["long_guns_seized:army"] +
            2*long_guns_null*varcov["army", "long_guns_seized:army"]
            )
mfx_2_se
```

```
##       army 
## 0.05563531
```

We can now compute the lower and higher bounds of the marginal effect:


```r
mfx_2_lo_se <- mfx_2 - 1.96* mfx_2_se  # computing a lower bound se
mfx_2_hi_se <- mfx_2 + 1.96* mfx_2_se  # computing the higher bound se

print(paste0(long_guns_null, " seized long guns produce an expected number of dead in events that involve the Army of ",
             round(mfx_2, 2), " [", round(mfx_2_lo_se, 2), ", ", round(mfx_2_hi_se, 2), "]."
             ))
```

```
## [1] "0 seized long guns produce an expected number of dead in events that involve the Army of 0.42 [0.32, 0.53]."
```

### Conditional effects: a non-parametric perspective

From a different perspective, we try to quantify conditional effects but using predicted values using predictions from a **Bayesian Additive Regression Trees** (BART) model.

For this specific purpose, we train BART on all of our data (no test or validation sets), and separate only the Y vector from all of our predictors to create two matrices. Note that we need to pass the data frame through a processing function (`bartModelMatrix()`) so that it can be read seamlessly. 


```r
# target variable for training
y_train <- AllData %>%
  select(organized_crime_dead) %>%
  data.frame() %>%
  bartModelMatrix()

# predictors to be re-used for multiple predictions
x_train_base <- AllData %>%
  select(
    organized_crime_wounded, afi, army, navy, federal_police, 
    long_guns_seized, small_arms_seized, clips_seized, 
    cartridge_sezied, organized_crime_dead
  )
  
# explanatory variables for training
x_train <- x_train_base %>%
  data.frame() %>%
  bartModelMatrix()
```

#### fitting BART and diagnostics

BART needs little tuning and usually works well with default settings for `m = 200` and default priors for other parameters. 


```r
m <- detectCores() # number of available cores for paralellization

# fitting bart on the training data
bart_fit <- mc.wbart(x_train, y_train, mc.cores = m, seed = 12347)
```

Once fit, we diagnose the model. Note how well BART fits the observed data. Compared to the fit of the OLS interactive model, it is quite an improvement due to BART's ability to capture non-linearities and interactions. 


```r
# assess fit of the model
qqplot(y_train, bart_fit$yhat.train.mean)
```

![plot of chunk fit_observed](images//fit_observed-1.png)

A different view of the plot above, confirms the same pattern: most errors produced by BART are very small and concentrated very close to zero. 


```r
hist(y_train - bart_fit$yhat.train.mean)
```

![plot of chunk unnamed-chunk-13](images//unnamed-chunk-13-1.png)

#### how do we compute marginal effects?

To compute the marginal effects, we can use the predictive posterior generated by fitting BART to all our data and create predictions changing the values of specific predictors to values of interest. In our case, we are interested in the change in the expected number of `organized_crime_dead` given a specific number of `long_guns_seized` (say, between 0 and 20) for events where the navy participated (`navy == 1`). 

To do that, we must:

1. create a new `x_train` matrix where all values of `navy` are set to `1` and `long_guns_seized` to a specific value between 0 and 20, maintaining the values of all other predictors unchanged
2. use this new `x_train` matrix and BART's predictive posterior to generate synthetic values for each combination of `navy` and `long_guns_seized`
3. this produces a new `y_test` matrix that summarizes `L = 1000` simulatons for ach of our `N = 5396` events, which we summarize by averaging over `N` to get a single `M x 1` vector of synthetic values for eacg combinations of values we are iterating over
4. we collect those vectors in a matrix of simulations with 21 columns for eacg value of `long_guns_seized` we are allowing to change

Through this process, we hold the value of `navy` constant at `1` and conditional on that value, we iterate through values for `long_guns_seized` giving us an equivalent view of the conditional effects we are seeking to evaluate.



```r
# creating synthetic values from the predictive posterior
synth_vals <- matrix(nrow = 1000, ncol=21)
for(i in 0:20){
  # create new matrix to predict with conditioning on navy events and cycling
  # through the number of long guns seized
  x_test <- x_train_base %>%
    mutate(
      navy = 1,  
      long_guns_seized = i
    ) %>%
    data.frame() %>%
    bartModelMatrix()
  print(paste0("synthetic values for long guns seized == ", i))
  # create prediction matrices
  bart_post <- predict(bart_fit, x_test, mc.cores = m) 
  # store synthetic values in a matrix
  synth_vals[ , i+1] = apply(bart_post, 1, mean)
}
```

```
## [1] "synthetic values for long guns seized == 0"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 1"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 2"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 3"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 4"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 5"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 6"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 7"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 8"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 9"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 10"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 11"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 12"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 13"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 14"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 15"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 16"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 17"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 18"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 19"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
## [1] "synthetic values for long guns seized == 20"
## *****In main of C++ for bart prediction
## tc (threadcount): 8
## number of bart draws: 1000
## number of trees in bart sum: 200
## number of x columns: 10
## from x,np,p: 10, 5396
## ***using parallel code
```

The matrix gives a information not only about expected values but also about their uncertainty. We can summarize it to construct an initial view of expected values of `organized_crime_dead` conditional on events where the `navy` participates and specific numbers of `long_guns_seized`.



```r
guns  <- seq(0, 20) 
mean_vals  <- apply(synth_vals, 2, mean)
lo_ci <- apply(synth_vals, 2, quantile, probs = 0.025)
hi_ci <- apply(synth_vals, 2, quantile, probs = 0.975)

cbind(guns, mean_vals, lo_ci, hi_ci) %>%
  as.data.frame() %>%
  ggplot(aes(x = guns, y = mean_vals)) + 
  geom_ribbon(aes(ymin = lo_ci, ymax = hi_ci), fill = "grey70") +
  geom_line(color = "red") +
  scale_x_continuous("long guns seized") +
  scale_y_continuous("expected organized crime deaths") +
  theme_minimal()
```

![plot of chunk synthetics](images//synthetics-1.png)

To get a comparable estimate to the marginal effect on the **parametric perspective** where we want to quantify the marginal effect of having 5 `long_guns_seized` on the expected number of `organized_crime_dead` in events that involve the `navy`, we can compute the difference between the expected number of `organized_crime_dead` when 4 and 5 `long_guns_seized` exist for events that involve the `navy` and its associated uncertainty. 

To do that we simply subtract columns for `organized_crime_dead == 4` from the column `organized_crime_dead == 5` in the matrix above, and summarize its mean value and 95% credible intervals. 

You'll note how small that contibution is: 0.002143251 



```r
format(mean(synth_vals[, 6] - synth_vals[, 5]), scientific = FALSE) 
```

```
## [1] "0.002143251"
```

```r
format(quantile((synth_vals[, 6] - synth_vals[, 5]), probs = c(0.025, 0.9725)),scientific = FALSE)
```

```
##            2.5%          97.25% 
## "-0.0004315623" " 0.0075670728"
```


For reference, details on the R session where all this was performed.


```r
sessionInfo()
```

```
## R version 3.5.2 (2018-12-20)
## Platform: x86_64-apple-darwin15.6.0 (64-bit)
## Running under: macOS High Sierra 10.13.6
## 
## Matrix products: default
## BLAS: /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
## LAPACK: /Library/Frameworks/R.framework/Versions/3.5/Resources/lib/libRlapack.dylib
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## attached base packages:
## [1] parallel  stats     graphics  grDevices utils     datasets  methods  
## [8] base     
## 
## other attached packages:
##  [1] here_0.1          ezknitr_0.6       forcats_0.4.0    
##  [4] stringr_1.4.0     dplyr_0.8.0.1     purrr_0.3.2      
##  [7] readr_1.3.1       tidyr_0.8.3       tibble_2.1.1     
## [10] ggplot2_3.1.1     tidyverse_1.2.1   BART_2.4         
## [13] survival_2.44-1.1 nnet_7.3-12       nlme_3.1-139     
## 
## loaded via a namespace (and not attached):
##  [1] tidyselect_0.2.5  xfun_0.6          splines_3.5.2    
##  [4] haven_2.1.0       lattice_0.20-38   colorspace_1.4-1 
##  [7] generics_0.0.2    yaml_2.2.0        rlang_0.3.4      
## [10] R.oo_1.22.0       pillar_1.3.1      R.utils_2.8.0    
## [13] glue_1.3.1        withr_2.1.2       modelr_0.1.4     
## [16] readxl_1.3.1      plyr_1.8.4        munsell_0.5.0    
## [19] gtable_0.3.0      cellranger_1.1.0  R.methodsS3_1.7.1
## [22] rvest_0.3.3       evaluate_0.13     labeling_0.3     
## [25] knitr_1.22        markdown_0.9      highr_0.8        
## [28] broom_0.5.2       Rcpp_1.0.1        scales_1.0.0     
## [31] backports_1.1.4   jsonlite_1.6      mime_0.6         
## [34] hms_0.4.2         stringi_1.4.3     grid_3.5.2       
## [37] rprojroot_1.3-2   cli_1.1.0         tools_3.5.2      
## [40] magrittr_1.5      lazyeval_0.2.2    crayon_1.3.4     
## [43] pkgconfig_2.0.2   Matrix_1.2-17     xml2_1.2.0       
## [46] lubridate_1.7.4   assertthat_0.2.1  httr_1.4.0       
## [49] rstudioapi_0.10   R6_2.4.0          compiler_3.5.2
```
