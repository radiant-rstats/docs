library(knitr)
library(dplyr)

## generate (updated) html and md files
setwd("~/gh/docs/")
system('make')

knit_docs <- function(x) {
	setwd(file.path("~/gh/docs",x,"app"))
	list.files(pattern = "*.Rmd") %>% sapply(knit)
	setwd(file.path("../..",x)); system("make")
}

sapply("basics", knit_docs)

sapply(c("data","design","basics","model","multivariate"), knit_docs)

## making the README.md file after clean-up
setwd("~/gh/docs/")
knit("README.Rmd")
setwd("~/gh/docs/sub")
knit("README_dev.Rmd")
file.copy("README_dev.md","../../radiant/README.md",overwrite = TRUE)
file.copy("README_dev.md","../../radiant.data/inst/app/tools/app/about.md",overwrite = TRUE)
knit("tutorials_dev.Rmd")
file.copy("tutorials_dev.md","../../radiant.data/inst/app/tools/app/tutorials.md",overwrite = TRUE)
setwd("~/gh/docs")

## sync (R)md files to gh/radiant
system('sh rsync_docs2app.sh')

## create documentation pdf
## make function for sapply
unlink('radiant.data.pdf')
setwd("~")
unlink('radiant.data.pdf')
system("R CMD Rd2pdf gh/radiant.data --no-preview")
system("rm -rf .Rd2pdf*")
setwd("~/gh/docs/")
file.copy("~/radiant.data.pdf","radiant.data.pdf",overwrite = TRUE)
system("rm -rf .Rd2pdf*")
