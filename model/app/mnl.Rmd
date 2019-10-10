> Estimate a Multinomial Logistic regression (MNL) for classification

### Functionality

To estimate a Multinomial Logistic regression (MNL) we need a categorical response variable with two or more levels and one or more explanatory variables. We also need to specify the level of the response variable to count as the _base_ level for comparison (i.e., use the `Choose level:` dropdown). In the example data file, `ketchup`, we can use `heinz28` as the base for comparison.

To access this dataset go to _Data > Manage_, select `examples` from the `Load data of type` dropdown, and press the `Load` button. Then select the `ketchup` dataset.

In the _Summary_ tab we can test if two or more variables together add significantly to the fit of a model by selecting them in the `Variables to test` dropdown. This functionality can be very useful to test if the overall influence of a variable of type `factor` is statistically significant.

Additional output that requires re-estimation:

* Standardize: Relative risk ratios (RRRs) can be hard to compare if the explanatory variables are measured on different scales. By standardizing the explanatory variables before estimation we can see which variables move-the-needle most. Note that in radiant a one-unit change will now equated to 2 x the standard deviation of the explanatory variable.
* Center: Replace all explanatory variables X by X - mean(X). This can be useful when trying to interpret interaction effects.
* Stepwise: A data-mining approach to select the best fitting model

Additional output that does not require re-estimation:

* Confidence intervals: Coefficient confidence intervals
* RRRs: Relative Risk Ratios with confidence intervals
* Confusion: A confusion matrix that shows the (lack) of consistency between (1) the classes observed in the data and (2) the class predicted as most likely by the model.

We can use the _Predict_ tab to predict probabilities for different values of the explanatory variable(s) (i.e., a common use of MNL models). First, select the type of input for prediction using the `Prediction` radio buttons. Choose either an existing dataset for prediction ("Data") or specify a command ("Command") to generate the prediction inputs. If you choose to enter a command you must specify at least one variable and one value to get a prediction. If you do not specify a value for each variable in the model either the mean value or the most frequent level will be used. It is only possible to predict outcomes based on variables used in the model (e.g., `price.heinz32` must be one of the selected explanatory variables to predict the probability of choosing to buy `heinz32` when priced at \$3.80.

* To predict the probability of choosing `hunts32` when a display is available in stores use `disp.hunts32 = "yes"` and press enter
* To predict the probability of choosing `heinz28` when priced between $3 and \$6 at 10 cent intervals type `price.heinz28 = seq(3, 6, 0.1)` and press enter
* To predict the probability of choosing `heinz41` when the brand is (not) on display and (not) featured type `disp.heinz41 = c("yes", "no"), feat.heinz41 = c("yes", "no")` and press enter

To generate predicted values for all cases in, for example, the `ketchup` dataset select `Data` from the `Prediction input` dropdown then select the `ketchup` dataset. You can also create a dataset for input in _Data > Transform_ using `Expand grid` or in a spreadsheet and then paste it into Radiant through the _Data > Manage_ tab. You can also load CSV data as input for prediction. 

Once the desired predictions have been generated they can be saved to a CSV file by clicking the download button button on the top right of the screen. To add predictions to the dataset used for estimation, click the `Store` button. Note that MNL models generate as many columns of probabilities as there are level in the categorical response variable. If you want to store only the predictions for the first level (e.g., `heinz28`) provide only one name in the the `Store predictions` input. If you want to store predictions for all ketchup brands, enter four variable names, separated by a comma.

### Example: Choice of ketchup brands

As an example we will use a dataset on on choice behavior for 300 individuals in a panel of households in Springfield, Missouri (USA). The data captures information on 2,798 purchase occasions over a period of around 2 years and includes the follow variables:

* id: individual identifier
* choice: one of heinz41, heinz32, heinz28, hunts32
* price.z: price of brand z
* disp.z: is there a display for brand z (yes or no)?
* feat.z: is there a newspaper feature advertisement for brand z (yes or no)?

Suppose we want to investigate how prices of the different products influence the choice of ketchup brand and package size. In the _Model > Multinomial logistic regression (MNL)_ select `choice` as the response variable and `heinz28` from the **Choose base level** dropdown menu. Select `price.heinz28` through `price.hunts32` as the explanatory variables. In the screenshot below we see that several, but not all, of the coefficients are statistically significant (p.value < .05) and that the model has some predictive power (Chi-squared statistic < .05). The left-most output column show the which brand the coefficients apply to. 

Unfortunately the coefficients from a logistic regression model are difficult to interpret. The `OR` column provides estimated odds-ratios. We see that the odds of survival were significantly lower for 2nd and 3rd class passengers compared to 1st class passenger. The odds of survival for males were also lower than for females. While the effect of age is statically significant, for each extra year in age the odds of survival are not as strongly affected (see also the standardized coefficient). 

<p align="center"><img src="figures_model/mnl_summary.png"></p>
<p align="center"><img src="figures_model/mnl_plot.png"></p>
<p align="center"><img src="figures_model/mnl_predict.png"></p>
<p align="center"><img src="figures_model/mnl_predict_data.png"></p>

For each of the explanatory variables the following null and alternate hypotheses can be formulated for the odds ratios:

* H0: The odds-ratio associated with explanatory variable x is equal to 1
* Ha: The odds-ratio associated with explanatory variable x is not equal to 1

The odds-ratios from the logistic regression can be interpreted as follows:

- Compared to 1st class passengers, the odds of survival for 2nd class passengers was 72% lower, keeping all other variables in the model constant.
- Compared to 1st class passengers, the odds of survival for 3rd class passengers was 89.8% lower, keeping all other variables in the model constant.
- Compared to female passengers, the odds of survival for male passengers was 91.7% lower, keeping all other variables in the model constant.
- For an increase in passenger age of 1 year the odds of survival decreased by 3.4%, keeping all other variables in the model constant.


### Report > Rmd

Add code to <a href="https://radiant-rstats.github.io/docs/data/report_rmd.html" target="_blank">_Report > Rmd_</a> to (re)create the analysis by clicking the <i title="report results" class="fa fa-edit"></i> icon on the bottom left of your screen or by pressing `ALT-enter` on your keyboard. 

If a plot was created it can be customized using `ggplot2` commands or with `gridExtra`. See example below and <a href="https://radiant-rstats.github.io/docs/data/visualize.html" target="_blank">_Data > Visualize_</a> for details.

```r
plot(result, plots = "coef", custom = TRUE) +
  labs(title = "Coefficient plot")
```

### R-functions


This document is a work in progress. For a worked example using the `multinom` function, see the link below.

<!-- For an overview of related R-functions used by Radiant to estimate a logistic regression model see <a href = "https://radiant-rstats.github.io/radiant.model/reference/index.html#section-model-logistic-regression" target="_blank">_Model > Logistic regression_</a> -->


<!-- <a href="https://stats.idre.ucla.edu/r/dae/multinomial-logistic-regression" target="_blank">https://stats.idre.ucla.edu/r/dae/multinomial-logistic-regression</a> -->

### R-functions

For an overview of related R-functions used by Radiant to estimate a multinomial logistic regression model see <a href = "https://radiant-rstats.github.io/radiant.model/reference/index.html#section-model-multinomial-logistic-regression" target="_blank">_Model > Multinomial logistic regression_</a>.

The key functions used in the `mnl` tool are `multinom` from the `nnet` package and `linearHypothesis` from the `car` package. 
