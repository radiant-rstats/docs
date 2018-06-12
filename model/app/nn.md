> Estimate a Neural Network (ANN)

To estimate a model select the model type (i.e., Classification or Regression), response variable, and one or more explanatory variables. Press the `Estimate` button or `CTRL-enter` (`CMD-enter` on mac) to generate results. 

### Report > Rmd

Add code to <a href="https://radiant-rstats.github.io/docs/data/report.html" target="_blank">_Report > Rmd_</a> to (re)create the analysis by clicking the <i title="report results" class="fa fa-edit"></i> icon on the bottom left of your screen or by pressing `ALT-enter` on your keyboard. 

If either a `Olden` or `Garson` plot was created it can be customized using `ggplot2` commands (e.g., `plot(result, plots = "garson", custom = TRUE) + labs(title = "Garson plot")`). See <a href="https://radiant-rstats.github.io/docs/data/visualize.html" target="_blank">_Data > Visualize_</a> for details.

To add, for example, a title to a network plot use `title(main = "Network plot")`. See the <a href="https://cran.r-project.org/doc/manuals/R-intro.html#Low_002dlevel-plotting-commands" target="_blank">R graphics</a> documentation for additional information.

### R-functions

For an overview of related R-functions used by Radiant to estimate a neural network model see <a href = "https://radiant-rstats.github.io/radiant.model/reference/index.html#section-model-neural-network" target="_blank">_Model > Neural network_</a>
