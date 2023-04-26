
library(tidyverse)

# install.packages("renderthis")
# Chrome browser needs to be installed for this to work!

# base directory
base <- "~/git_projects/KA_slides"

# screen for Rmds
Rmd_files <- dir(recursive = T) %>% 
  str_subset(pattern = ".*(\\.Rmd|rmd)") %>%
  str_subset(pattern = "^(?!index).*$")

file_nms <- Rmd_files %>% str_remove(pattern = "\\.rmd|.Rmd$")

# old:
# render files to HTML moon_reader format
# walk(
#   .x = Rmd_files, 
#   .f = ~ rmarkdown::render(paste0("~/git_projects/KA_slides/", .x), 'xaringan::moon_reader')
# )

# new: 
# generate HTML and then PDF files (takes a moment)
walk(
  .x = paste0(base, "/", Rmd_files),
  .f = ~ renderthis::to_html(.)
)

walk(
  .x = paste0(base, "/", Rmd_files),
  .f = ~ renderthis::to_pdf(.)
)

# renderthis::to_pdf("~/git_projects/KA_slides/Introduction/Introduction.Rmd")


