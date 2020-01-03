> Estimate a Random Forest

To create a Random Forest, first select the type (i.e., Classification or Regression), response variable, and one or more explanatory variables. Press the `Estimate model` button or `CTRL-enter` (`CMD-enter` on mac) to generate results. 

The model can be "tuned" by changing the `mtry`, `# trees`, `Min node size`, and `Sample fraction` inputs. The best way to determine the optimal values for these hyper parameters is to use Cross-Validation. In radiant, you can use the `cv.rforest` function for this purpose. See the <a href="https://radiant-rstats.github.io/radiant.model/reference/cv.rforest.html" target="_blank">documentation</a> for more information.

### Report > Rmd

Add code to <a href="https://radiant-rstats.github.io/docs/data/report_rmd.html" target="_blank">_Report > Rmd_</a> to (re)create the analysis by clicking the <i title="report results" class="fa fa-edit"></i> icon on the bottom left of your screen or by pressing `ALT-enter` on your keyboard. 

### R-functions

For an overview of related R-functions used by Radiant to estimate a neural network model see <a href = "https://radiant-rstats.github.io/radiant.model/reference/index.html#section-model-random-forest" target="_blank">_Model > Neural network_</a>.

The key function from the `ranger` package used in the `rforest` tool is `ranger`.
