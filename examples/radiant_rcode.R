## loading the radiant library
library(radiant)

## analysis on built-in dataset mtcars
result <- single_mean(mtcars, "mpg", comp_value = 20, alternative = "greater")
summary(result)
plot(result)

result <- compare_means(mtcars, "cyl", "mpg")
summary(result)
plot(result)

result <- compare_means(diamonds, "cut", "price")
summary(result)
plot(result)

## get help for single_mean and compare_means using
?single_mean
?compare_means

## the help linked above also links to summary and plot methods for each class
## you can also use
?summary.single_mean
?plot.compare_means

## regression
result <- regress(diamonds, rvar = "price", evar = c("carat","clarity"))
summary(result)
plot(result, plots = "coef")
plot(result, plots = "dashboard")

## get help for the regression function
?regress

## loading shopping data from a remote source
load(curl::curl("https://github.com/radiant-rstats/radiant.multivariate/blob/master/data/shopping.rda?raw=true"))

## to view the shopping data in Rstudio's data viewer uncomment the line below
# View(shopping)

## start with hierarchical clustering, view help
?hclus

## run hierarchical cluster analysis on the shopping data, variables v1 through v6
result <- hclus(shopping, "v1:v6")

## summary - not much here - plots are more important
summary(result)

## check the help file on how to plot results from hierarchical cluster analysis
?plot.hclus

## default plots
plot(result)

## show the dendrogram
plot(result, plots = "dendro")

## show the dendrogram with cutoff at 0
plot(result, plots = "dendro", cutoff = 0)

## there seems to be three clusters (segments)
result <- kclus(shopping, vars = "v1:v6", nr_clus = 3)
summary(result)
plot(result)

## to add a variable with segment membership information to the shopping dataset
shopping <- store(shopping, result, name = "clusters")

## for help on the store function see ...
?store.kclus

## did that work? there should be a column 'clusters' in the dataset
head(shopping)

## to save the average shopping attitude scores for each segment
readr::write_csv(result$clus_means, "kclus.csv")

## the following command should open the created csv file in Excel
browseURL("kclus.csv")

## see if you can reproduce this output in radiant's web-interface
## the shopping data can be loaded from the global environment through the
## Data > Manage tab
## Choose "from global workspace" from the "Load data of type" dropdown
radiant::radiant()

## if you stop radiant by clicking the power icon this will put the current
## state into the global environment if you start radiant again it will read
## the state and you can continue where you left-off
## To reset to a clean state click the power icon and then click refresh
