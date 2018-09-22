> How correlated are the variables in the data?

Create a correlation matrix of the selected variables. Correlations and p.values are provided for each variable pair. To show only those correlations above a certain (absolute) level, use the correlation cutoff box.

> Note: Correlations can be calculated for variables of type `numeric`, `integer`, and `date`. Variables of other types with no more than two unique levels are transformed into 0-1 dummies and can also be selected. For these variable types, the first level is converted to a 1 and the second to a 0.

<p align="center"><img src="figures_basics/correlation_summary.png"></p>

A visual representation of the correlation matrix is provided in the _Plot_ tab. Note that scatter plots in the graph at most 1,000 data points by default. To generate scatter plots that use all observations use `plot(result, n = -1)` in _Report > Rmd_.

Stars shown in the _Plot_ tab are interpreted as:

- p.value between 0 and 0.001:  ***
- p.value between 0.001 and 0.01: **
- p.value between 0.01 and 0.05: *
- p.value between 0.05 and 0.1: .

<p align="center"><img src="figures_basics/correlation_plot.png"></p>

The font-size used in the plot is proportional to the size and significance of the correlation between two variables.

### Method

Select the method to use to calculate correlations. The most common method is `Pearson`. See <a href="https://en.wikipedia.org/wiki/Pearson_product-moment_correlation_coefficient" target = "_blank">Wikipedia</a> for details.

### Correlation cutoff

To show only correlations above a certain value choose a non-zero value in the numeric input between 0 and 1 (e.g., 0.15).

### Covariance matrix

Although we generally use the correlation matrix, you can also show the covariance matrix by checking the `Show covariance matrix` box.

### Khan on correlation

<p align="center"><iframe width="640" height="375" src="https://www.youtube.com/embed/-Y-M9aD_ccQ" frameborder="0" allowfullscreen></iframe></p>

### Report > Rmd

Add code to <a href="https://radiant-rstats.github.io/docs/data/report.html" target="_blank">_Report > Rmd_</a> to (re)create the analysis by clicking the <i title="report results" class="fa fa-edit"></i> icon on the bottom left of your screen or by pressing `ALT-enter` on your keyboard. 

By default the correlation plot samples 1,000 data points. To include all data points use `plot(result, n = -1)`
To add, for example, a title to the plot use `title(main = "Correlation plot\n\n")`. See the <a href="https://cran.r-project.org/doc/manuals/R-intro.html#Low_002dlevel-plotting-commands" target="_blank">R graphics</a> documentation for additional information.

### R-functions

For an overview of related R-functions used by Radiant to evaluate correlations see <a href = "https://radiant-rstats.github.io/radiant.basics/reference/index.html#section-basics-tables" target="_blank">_Basics > Tables</a>
