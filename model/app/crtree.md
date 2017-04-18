> Estimate a classification or regression tree

To estimate a model select the model type (i.e., Classification or Regression), Response variable, and one or more Explanatory variables. Press the `Estimate` button or `CTRL-enter` (`CMD-enter` on mac) to generate results. 

### R > Report

Add code to <a href="https://radiant-rstats.github.io/docs/data/report.html" target="_blank">_R > Report_</a> to (re)create the analysis by clicking the <i title="report results" class="fa fa-edit"></i> icon on the bottom left of your screen or by pressing `ALT-enter` on your keyboard. 

If either a `Prune` or `Importance` plot was created it can be customized using `ggplot2` commands (e.g., `plot(result, plots = "prune", custom = TRUE) + labs(x = "# nodes")`). See <a href="https://radiant-rstats.github.io/docs/data/visualize.html" target="_blank">_Data > Visualize_</a> for details.

It is not currently possible to add a title or caption directly to a `Tree` plot.
