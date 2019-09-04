library(magrittr)
apps <-  c("data", "design", "basics", "model", "multivariate")
fl <- list.files(paste0(apps, "/app"), pattern = "(*.Rmd|*.md)", full.names = TRUE)

for (f in fl) {
  rmd <- paste0(readLines(f), collapse = "\n")

  gsub("(.*?)\\[(.*?)\\]\\((.*?)\\)(.*?)", "\\1<a href=\"\\3\" target=\"_blank\">\\2</a>\\4", rmd) %>%
    gsub("(.*?)<(http.*?)>(.*?)", "\\1<a href=\"\\2\" target=\"_blank\">\\2</a>\\3", .) %>%
    gsub("\\{target=\"[_]*blank\"\\}", "", .) %>%
    cat(file = f)
}

