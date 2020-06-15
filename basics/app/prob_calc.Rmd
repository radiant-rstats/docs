> Probability calculator

Calculate probabilities or values based on the _Binomial_, _Chi-squared_, _Discrete_, _F_, _Exponential_, _Normal_, _Poisson_, _t_, or _Uniform_ distribution.

## Testing batteries

Suppose Consumer Reports (CR) wants to test manufacturer claims about battery life. The manufacturer claims that more than 90% of their batteries will power a laptop for at least 12 hours of continuous use. CR sets up 20 identical laptops with the manufacturer's batteries. If the manufacturer's claims are accurate, what is the probability that 15 or more laptops are still running after 12 hours?

The description of the problem suggests we should select `Binomial` from the `Distribution` dropdown. To find the probability, select `Values` as the `Input type` and enter `15` as the `Upper bound`. In the output below we can see that the probability is 0.989. The probability that exactly 15 laptops are still running after 12 hours is 0.032.

<p align="center"><img src="figures_basics/prob_calc_batteries.png"></p>

## Demand for headphones

A manufacturer wants to determine the appropriate inventory level for headphones required to achieve a 95% <a href="https://en.wikipedia.org/wiki/Service_level" target="_blank">service level</a>. Demand for the headphones obeys a normal distribution with a mean of 3000 and a standard deviation of 800.

To find the required number of headphones to hold in inventory choose `Normal` from the `Distribution` dropdown and then select `Probability` as the `Input type`. Enter `.95` as the `Upper bound`. In the output below we see the number of units to stock is 4316.

<p align="center"><img src="figures_basics/prob_calc_headphones.png"></p>

## Cups of ice cream

A **discrete** random variable can take on a limited (finite) number of possible values. The **probability distribution** of a discrete random variable lists these values and their probabilities. For example, probability distribution of the number of cups of ice cream a customer buys could be described as follows:

* 40% of customers buy 1 cup;
* 30% of customers buy 2 cups;
* 20% of customers buy 3 cups;
* 10% of customers buy 4 cups.

We can use the probability distribution of a random variable to calculate its **mean** (or **expected value**) as follows;

$$
  E(C) = \mu_C = 1 \times 0.40 + 2 \times 0.30 + 3 \times 0.20 + 4 \times 0.10 = 2\,,
$$

where $\mu_C$ is the mean number of cups purchased. We can _expect_ a randomly selected customer to buy 2 cups. The variance is calculated as follow:

$$
  Var(C) = (1 - 2)^2 \times 0.4 + (2 - 2)^2 \times 0.3 + (3 - 2)^2 \times 0.2 + (4 - 2)^2 \times 0.1 = 1\,.
$$

To get the mean and standard deviation of the discrete probability distribution above, as well as the probability a customer will buy 2 or more cups (0.6), specify the following in the probability calculator.

<p align="center"><img src="figures_basics/prob_calc_icecream.png"></p>

## Hypothesis testing

You can also use the probability calculator to determine a `p.value` or a `critical value` for a statistical test. See the help files for `Single mean`, `Single proportion`, `Compare means`, `Compare proportions`, `Cross-tabs` in the _Basics_ menu and `Linear regression (OLS)` in the _Model_ menu for details.

### Report > Rmd

Add code to <a href="https://radiant-rstats.github.io/docs/data/report_rmd.html" target="_blank">_Report > Rmd_</a> to (re)create the analysis by clicking the <i title="report results" class="fa fa-edit"></i> icon on the bottom left of your screen or by pressing `ALT-enter` on your keyboard. 

If a plot was created it can be customized using `ggplot2` commands (e.g., `plot(result) + labs(title = "Normal distribution")`). See <a href="https://radiant-rstats.github.io/docs/data/visualize.html" target="_blank">_Data > Visualize_</a> for details.

### R-functions

For an overview of related R-functions used by Radiant for probability calculations see <a href = "https://radiant-rstats.github.io/radiant.basics/reference/index.html#section-basics-probability" target="_blank">_Basics > Probability_</a>

Key functions from the `stats` package used in the probability calculator:

* `prob_norm` uses `pnorm`, `qnorm`, and `dnorm`
* `prob_lnorm` uses `plnorm`, `qlnorm`, and `dlnorm`
* `prob_tdist` uses `pt`, `qt`, and `dt`
* `prob_fdist` uses `pf`, `qf`, and `df`
* `prob_chisq` uses `pchisq`, `qchisq`, and `dchisq`
* `prob_unif` uses `punif`, `qunif`, and `dunif`
* `prob_binom` uses `pbinom`, `qbinom`, and `dbinom`
* `prob_expo` uses `pexp`, `qexp`, and `dexp`
* `prob_pois` uses `ppios`, `qpois`, and `dpois`

### Video Tutorials

Copy-and-paste the full command below into the RStudio console (i.e., the bottom-left window) and press return to gain access to all materials used in the probability calculator module of the <a href="https://www.youtube.com/playlist?list=PLNhtaetb48EdKRIY7MewCyvb_1x7dV3xw" target="_blank">Radiant Tutorial Series</a>:

<pre>usethis::use_course("https://www.dropbox.com/sh/zw1yuiw8hvs47uc/AABPo1BncYv_i2eZfHQ7dgwCa?dl=1")</pre>

<a href="https://youtu.be/UPL_8ujAXpww" target="_blank">Describing the Distribution of a Discrete Random
	Variable (#1)</a>

* This video shows how to summarize information about a discrete random variable using the probability calculator in Radiant
* Topics List:
    - Calculate the mean and variance for a discrete random variable by hand
    - Calculate the mean, variance, and select probabilities for a discrete random variable in Radiant

<a href="https://youtu.be/30YsxCTbDTc" target="_blank">Describing Normal and Binomial Distributions in Radiant(#2)</a>

* This video shows how to summarize information about Normal and Binomial distributions using the probability calculator in Radiant
* Topics List:
    - Calculate probabilities of a random variable following a Normal distribution in Radiant
    - Calculate probabilities of a random variable following a Binomial distribution by hand
    - Calculate probabilities of a random variable following a Binomial distribution in Radiant

<a href="https://youtu.be/LbwUpEwTJ_Q" target="_blank">Describing Uniform and Binomial Distributions in Radiant(#3)</a>

* This video shows how to summarize information about Uniform and Binomial distributions using the probability calculator in Radiant
* Topics List:
    - Calculate probabilities of a random variable following a Uniform distribution in Radiant
    - Calculate probabilities of a random variable following a Binomial distribution in Radiant

<a href="https://youtu.be/XC2yN5BY8jg" target="_blank">Providing Probability Bounds(#4)</a>

* This video demonstrates how to provide probability bounds in Radiant 
* Topics List:
    - Use probabilities as input type
    - Round up the cutoff value 
