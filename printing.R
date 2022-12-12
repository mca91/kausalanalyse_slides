
# Chrome browser is necessary for this to work

source("xaringan_to_pdf.R")
library(tidyverse)

# base directory
base <- "~/git_projects/KA_slides"

# screen for Rmds
Rmd_files <- dir(recursive = T) %>% 
  str_subset(pattern = ".*(\\.Rmd|rmd)") %>%
  str_subset(pattern = "^(?!index).*$")

file_nms <- Rmd_files %>% str_remove(pattern = "\\.rmd|.Rmd$")

# render files to HTML moon_reader format
walk(
  .x = Rmd_files, 
  .f = ~ rmarkdown::render(paste0("~/git_projects/KA_slides/", .x), 'xaringan::moon_reader')
)

# generate PDFs
walk2(
  .x = paste0("file:///", path.expand(base), "/", file_nms, ".html"),
  .y = paste0(path.expand(base), "/", file_nms, ".pdf"),
  .f = ~ xaringan_to_pdf(input = .x, output_file = .y)
)



