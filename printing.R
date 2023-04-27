
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

# generate HTML and PDF files (for all chapters; takes a moment)
walk(
  .x = paste0(base, "/", Rmd_files),
  .f = ~ renderthis::to_html(.)
)

walk(
  .x = paste0(base, "/", Rmd_files),
  .f = ~ renderthis::to_pdf(.)
)

renderthis::to_pdf("~/git_projects/KA_slides/Introduction/Introduction.Rmd")
renderthis::to_html("~/git_projects/KA_slides/Introduction/Introduction.Rmd")

renderthis::to_pdf("~/git_projects/KA_slides/ResearchQuestions/ResearchQuestions.Rmd")
renderthis::to_html("~/git_projects/KA_slides/ResearchQuestions/ResearchQuestions.Rmd")

renderthis::to_pdf("~/git_projects/KA_slides/TreatmentEffects/TreatmentEffects.Rmd")
renderthis::to_html("~/git_projects/KA_slides/TreatmentEffects/TreatmentEffects.Rmd")

renderthis::to_pdf("~/git_projects/KA_slides/Matching/Matching.Rmd")
renderthis::to_html("~/git_projects/KA_slides/Matching/Matching.Rmd")
