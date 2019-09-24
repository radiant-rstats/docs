> Estimate a Multinomial Logistic regression for classification

### Functionality

To estimate a Multinomial Logistic regression (MNL) we need a categorical response variable with two or more levels and one or more explanatory variables. 

This document is a work in progress. For a worked example using the `multinom` function, see the link below.

<a href="https://stats.idre.ucla.edu/r/dae/multinomial-logistic-regression" target="_blank">https://stats.idre.ucla.edu/r/dae/multinomial-logistic-regression</a>

### Report > Rmd

Add code to <a href="https://radiant-rstats.github.io/docs/data/report_rmd.html" target="_blank">_Report > Rmd_</a> to (re)create the analysis by clicking the <i title="report results" class="fa fa-edit"></i> icon on the bottom left of your screen or by pressing `ALT-enter` on your keyboard. 

If a plot was created it can be customized using `ggplot2` commands or with `gridExtra`. See example below and <a href="https://radiant-rstats.github.io/docs/data/visualize.html" target="_blank">_Data > Visualize_</a> for details.

```r
plot(result, plots = "coef", custom = TRUE) +
  labs(title = "Coefficient plot")
```

### R-functions

<!-- For an overview of related R-functions used by Radiant to estimate a logistic regression model see <a href = "https://radiant-rstats.github.io/radiant.model/reference/index.html#section-model-logistic-regression" target="_blank">_Model > Logistic regression_</a> -->
