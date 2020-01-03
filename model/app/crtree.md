> Estimate a classification or regression tree

To create a tree model, first select the type (i.e., Classification or Regression), response variable, and one or more explanatory variables. Press the `Estimate model` button or `CTRL-enter` (`CMD-enter` on mac) to generate results. 

### Report > Rmd

Add code to <a href="https://radiant-rstats.github.io/docs/data/report_rmd.html" target="_blank">_Report > Rmd_</a> to (re)create the analysis by clicking the <i title="report results" class="fa fa-edit"></i> icon on the bottom left of your screen or by pressing `ALT-enter` on your keyboard. 

If either a `Prune` or `Importance` plot was created it can be customized using `ggplot2` commands (e.g., `plot(result, plots = "prune", custom = TRUE) + labs(x = "# nodes")`). See <a href="https://radiant-rstats.github.io/docs/data/visualize.html" target="_blank">_Data > Visualize_</a> for details.

It is not currently possible to add a title or caption directly to a `Tree` plot.

### R-functions

For an overview of related R-functions used by Radiant to estimate classification and regression trees see <a href = "https://radiant-rstats.github.io/radiant.model/reference/index.html#section-model-classification-and-regression-trees" target="_blank">_Model > Classification and regression trees_</a>

The key function from the `rpart` package used in the `crtree` tool is `rpart`.
