> Determine the required sample size for comparisons of means or proportions

Leave one of the inputs blank to determine its value. By default the sample size inputs (_n1_ and _n2_) are left empty and the required sample size for both groups is calculated. If values are provided for both _n1_ and _n2_ the value for any one of the other inputs left blank will be calculated. If only a value for _n1_ (_n2_) is entered, all other inputs must be provided to determine the required sample size for _n2_ (_n1_)

### Input

* Sample size: Number of respondents required
* Confidence level: 1 - significance level (e.g, .95 = 1 - .05).<sup>1, 2</sup>
* Power: 1 - $\beta$ (e.g, .8 = 1 - .2).<sup>3</sup>

### Input for a comparison of means

* Delta: Difference between group means that we hope to detect
* Std. deviation: Assumed standard deviation

### Input for a comparison of proportions

* Proportion 1: Assumed proportion in group 1 (e.g., .1)
* Proportion 2: Proportion 1 plus the difference we hope to detect (e.g., .1 + .05 = .15)

**Note:** The (match) the control group sample size (_n1_) to the test group sample size (_n2_) leave both inputs for sample size blank (i.e., groups are of the same size). If a value for _n1_ or _n2_ is provided group sizes are likely to differ

<sup>1</sup> The **significance level**, often denoted by $\alpha$, is the highest probability you are willing to accept of rejecting the null hypothesis when it is actually true. A commonly used significance level is 0.05 (or 5%)

<sup>2</sup> $1 - \alpha$ is called the **confidence level**. A commonly used confidence level is 0.95 (or 95%)

<sup>3</sup> Beta ($\beta$), is the probability of accepting the null hypothesis when it is actually false. The power of a test is calculated as 1 - $\beta$. A commonly used power level is 0.8 (or 80%)

### Report > Rmd

Add code to <a href="https://radiant-rstats.github.io/docs/data/report_rmd.html" target="_blank">_Report > Rmd_</a> to (re)create the sample size calculations by clicking the <i title="report results" class="fa fa-edit"></i> icon on the bottom left of your screen or by pressing `ALT-enter` on your keyboard. 

### R-functions

For an overview of related R-functions used by Radiant for sampling and sample size calculations see <a href = "https://radiant-rstats.github.io/radiant.design/reference/index.html#section-design-sample" target="_blank">_Design > Sample_</a>

The key functions from the `pwr` package used in the `sample_size_comp` tool are `pwr.t2n.test`, `pwr.t.test`, `pwr.2p.test`, `pwr.2p2n.test`, and `pwr.2p2n.test`.
