if (!require("pacman")) install.packages("pacman")
pacman::p_load(dplyr,
               ggplot2,
               RefManageR,
               here,
               purrr,
               magick,
               stargazer,
               dplyr,
               tidyr,
               papeR,
               kableExtra,
               gridExtra,
               cowplot,
               png,
               knitr,
               xaringan,
               leaflet,
               plotly,
               emoji,
               fixest
               )

# install packages from Github (no CRAN version at the moment)
if (!require("icons")) devtools::install_github('mitchelloharawild/icons')
library(icons)

# download fontawesome icons
if(icons::icon_installed(fontawesome) == FALSE) icons::download_fontawesome()

   
   