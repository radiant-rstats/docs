> Estimate Gradient Boosted Trees

To estimate a Gradient Boosted Trees model model select the type (i.e., Classification or Regression), response variable, and one or more explanatory variables. Press the `Estimate` button or `CTRL-enter` (`CMD-enter` on mac) to generate results. 

The model can be "tuned" by changing by adjusting the  parameter inputs available in Radiant. In addition to these parameters, any others can be adjusted in _Report > Rmd_. The best way to determine the optimal values for all these hyper-parameters is to use Cross-Validation. In Radiant, you can use the `cv.gbt` function for this purpose. See the <a href="https://radiant-rstats.github.io/radiant.model/reference/cv.gbt.html" target="_blank">documentation</a> for more information.

For more information on parameters that can be set for XGBoost, see the links below

* <a href="https://xgboost.readthedocs.io/en/latest/parameter.html" target="_blank">https://xgboost.readthedocs.io/en/latest/parameter.html</a>
* <a href="https://xgboost.readthedocs.io/en/latest/tutorials/param_tuning.html" target="_blank">https://xgboost.readthedocs.io/en/latest/tutorials/param_tuning.html</a>

### Report > Rmd

Add code to <a href="https://radiant-rstats.github.io/docs/data/report_rmd.html" target="_blank">_Report > Rmd_</a> to (re)create the analysis by clicking the <i title="report results" class="fa fa-edit"></i> icon on the bottom left of your screen or by pressing `ALT-enter` on your keyboard. 

### R-functions

For an overview of related R-functions used by Radiant to estimate a neural network model see <a href = "https://radiant-rstats.github.io/radiant.model/reference/index.html#section-model-gradient-boosted-trees" target="_blank">_Model > Neural network_</a>.

The key function from the `xgboost` package used in the `gbt` tool is `xgboost`.
