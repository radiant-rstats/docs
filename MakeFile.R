library(knitr)
library(dplyr)
library(magrittr)

options(
  width = 250,
  scipen = 100,
  max.print = 5000,
  stringsAsFactors = FALSE
)

## generate (updated) html and md files
setwd("~/gh/docs/")
system('make')

knit_docs <- function(x) {
  setwd(file.path("~/gh/docs",x,"app"))
  list.files(pattern = "*.Rmd") %>% sapply(knit)
  setwd(file.path("../..",x)); system("make")
}

sapply(c("data","design","basics","model","multivariate"), knit_docs)

## setup articles for pkgdown
setwd("~/gh/docs/")
files <- c(
  "combine.Rmd", "explore.md", "manage.md", "pivotr.md",
  "report_r.md", "report_rmd.md", "state.md", "transform.Rmd",
  "view.Rmd", "visualize.md"
)

for (file in files) {
  article <- readLines(file.path("data/app", file))
  article <- gsub("figures/", "https://radiant-rstats.github.io/docs/data/figures/", article)
  file <- paste0("_", sub("\\.md$", ".Rmd", file))
  cat(article, file = file.path("../radiant.data/vignettes/pkgdown/", file), sep = "\n")
}

## making the README.md file after clean-up
setwd("~/gh/docs/")
knit("README.Rmd")
setwd("~/gh/docs/sub")
knit("README_dev.Rmd")
knit("tutorials_dev.Rmd")

file.copy("README_dev.md",file.path("../../radiant.data/inst/app/tools/app/about.md"),overwrite = TRUE)
file.copy("tutorials_dev.md",file.path("../../radiant.data/inst/app/tools/app/tutorials.md"),overwrite = TRUE)

copy_docs <- function(app) {
  readLines("README_dev.md") %>% paste0(., collapse = "\n") %>%
    sub("radiant.png",paste0(app,".png"), . ) %>%
    sub("radiant-rstats/radiant)",paste0("radiant-rstats/",app,")"), ., fixed = TRUE) %>%
    sub("badges/version/radiant)",paste0("badges/version/",app,")"), ., fixed = TRUE) %>%
    sub("package=radiant)",paste0("package=",app,")"), ., fixed = TRUE) %>%
    sub("radiant/issues",paste0(app,"/issues"), ., fixed = TRUE) %>%
    cat(file = file.path("../..",app,"README.md"))
}

sapply(c("radiant","radiant.data","radiant.design","radiant.basics","radiant.model","radiant.multivariate"), copy_docs)

## sync (R)md files to gh/radiant
setwd("~/gh/docs")
system('sh rsync_docs2app.sh')

## create documentation pdfs
unlink('radiant.data.pdf')
setwd("~")
unlink('radiant.data.pdf')
system("R CMD Rd2pdf gh/radiant.data --no-preview")
system("rm -rf .Rd2pdf*")
setwd("~/gh/docs/")
file.copy("~/radiant.data.pdf","radiant.data.pdf",overwrite = TRUE)
system("rm -rf .Rd2pdf*")

create_manuals <- function(x) {
  app <- paste0("radiant.",x)
  man <- paste0(app,".pdf")
  unlink(man)
  setwd("~")
  unlink(man)
  system(paste0("R CMD Rd2pdf gh/",app," --no-preview"))
  system("rm -rf .Rd2pdf*")
  setwd("~/gh/docs/")
  file.copy(paste0("~/",man), man, overwrite = TRUE)
  system("rm -rf .Rd2pdf*")
}

sapply(c("data","design","basics","model","multivariate"), create_manuals)

# tinytex::uninstall_tinytex()
