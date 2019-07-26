> Predict product ratings using Collaborative Filtering

To estimate recommendations using Collaborative Filtering select a user id, a product id, one or more products to generate recommendations for, and product ratings. To generate recommendations press the `Estimate` button or `CTRL-enter` (`CMD-enter` on mac). 

<p align="center"><img src="figures_model/cf_summary.png"></p>

### Report > Rmd

Add code to <a href="https://radiant-rstats.github.io/docs/data/report_rmd.html" target="_blank">_Report > Rmd_</a> to (re)create the analysis by clicking the <i title="report results" class="fa fa-edit"></i> icon on the bottom left of your screen or by pressing `ALT-enter` on your keyboard. 

If a plot was created it can be customized using `ggplot2` commands (e.g., `plot(result) + labs(caption = "Based on data from ...")`). See <a href="https://radiant-rstats.github.io/docs/data/visualize.html" target="_blank">_Data > Visualize_</a> for details.

### R-functions

For an overview of related R-functions used by Radiant for collaborative filtering see <a href = "https://radiant-rstats.github.io/radiant.model/reference/index.html#section-model-collaborative-filtering" target="_blank">_Model > Collaborative Filtering_</a>
