> Randomly assign respondents to experimental conditions

To use the random assignment tool, select a data set where each row in the data set is unique (i.e., no duplicates). A dataset that fits these requirements is bundled with Radiant and is available through the _Data > Manage_ tab (i.e., choose `Examples` from the `Load data of type` drop-down and press `Load`). Select `rndnames` from the `Datasets` dropdown.

`Names` is a unique identifier in this dataset. If we select this variable and specify two (or more) `Conditions` (e.g., "test" and "control") a table will be shown with a columns `.conditions` that indicates to which condition each person was (randomly) assigned.

By default, the `Random assignment` tool will use equal probabilities for each condition. However, as can be seen in the screenshot below, it is also possible to specify the probabilities to use in assignment (e.g., 30% to "test" and 70% to the "control" condition). 

<p align="center"><img src="figures_design/randomizer.png"></p>

If we expect that some variables are likely predictive of the outcome of our experiment then we can use `blocking` to decrease sampling variability. In block random assignment (or stratified random assignment) subjects are first sorted into blocks (or strata) based on one or more characteristics before being randomly assigned within each block. For example, if we select `Gender` as a `Blocking variable` the `Random assignment` tool will attempt to put exactly 30% of men and exactly 30% of women in the treatment condition based on the `Probabilities` we specified in advance. As we can see in the screenshot below, the assignment of men and women to the test and control condition turned out exactly as intended.

<p align="center"><img src="figures_design/randomizer_block.png"></p>

By default, the random seed is set to `1234` to ensure the sampling results are reproducible. If there is no input in `Rnd. seed`, the selected rows will change every time we generate a sample.

To download data with the assignments in the `.conditions` column in CSV format, click on the <i title="download" class="fa fa-download"></i> icon in the top-right of your screen. The same data can also be stored in Radiant by providing a name for the dataset and then clicking on the `Store` button. 

### Report > Rmd

Add code to <a href="https://radiant-rstats.github.io/docs/data/report_rmd.html" target="_blank">_Report > Rmd_</a> to (re)create the sample by clicking the <i title="report results" class="fa fa-edit"></i> icon on the bottom left of your screen or by pressing `ALT-enter` on your keyboard. 

### R-functions

For an overview of related R-functions used by Radiant for sampling and sample size calculations see <a href = "https://radiant-rstats.github.io/radiant.design/reference/index.html#section-design-sample" target="_blank">_Design > Sample_</a>

For more information see the <a href="https://cran.r-project.org/web/packages/randomizr/vignettes/randomizr_vignette.html" target="_blank">vignette</a> for the `randomizr` package that radiant uses for the `Random assignment` tool.

The key functions from the `randomizr` package used in the `randomizer` tool are `complete_ra` and `block_ra`.
