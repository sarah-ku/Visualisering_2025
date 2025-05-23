library(knitr)
opts_chunk$set(
  comment = "#>",
  message = FALSE, 
  warning = FALSE, 
  cache = TRUE, 
  eval = TRUE,
  tidy = "styler", 
  dev = "svglite",
  dpi = 105, # this creates 2*105 dpi at 6in, which is 300 dpi at 4.2in
  fig.align = 'center',
  fig.width = 6,
  fig.asp = 0.618, # 1 / phi
  dev.args = list(pdf = list(colormodel = 'cmyk', useDingats = TRUE))
)

opts_template$set(
  fig.large = list(fig.asp = 0.8),
  fig.square = list(fig.asp = 1),
  fig.long = list(fig.asp = 1.5)
)

# library(paletteer)
# library(prismatic)
# library(magrittr)
# paletteer_d("RColorBrewer::Set3") %>%
#   clr_saturate(0.25) %>%
#   clr_darken(0.15) %>%
#   plot()
discrete_colors <- c("#5BBCACFF", "#D5D587FF", "#9993C5FF", "#DE6454FF", 
                     "#5497C2FF", "#DA9437FF", "#92C22BFF", "#D8A8C1FF", 
                     "#C0ACACFF", "#B556B7FF", "#A3CA9AFF", "#D7C637FF")

alpha_viridis <- function(...) {
  scale_fill_gradientn(..., colors = viridis::viridis(256, alpha = 0.7))
}

suppressPackageStartupMessages(library(tidyverse))
#suppressPackageStartupMessages(library(tidymodels))
#theme_set(theme_light())
#tidymodels_prefer()
conflicted::conflict_prefer("vi", "vip")
conflicted::conflict_prefer("explain", "lime")

#update_geom_defaults("col", list(fill = "#8097ae", alpha = 0.9))
#update_geom_defaults("bar", list(fill = "#8097ae", alpha = 0.9))
#update_geom_defaults("point", list(color = "#566675"))
#update_geom_defaults("line", list(color = "#566675", alpha = 0.7))

#options(
#  ggplot2.discrete.fill = discrete_colors,
#  ggplot2.discrete.colour = discrete_colors,
#  ggplot2.continuous.fill = alpha_viridis,
#  ggplot2.continuous.colour = alpha_viridis
#)

# https://github.com/EmilHvitfeldt/smltar/issues/114
#hook_output = knit_hooks$get('output')
#knit_hooks$set(output = function(x, options) {
  # this hook is used only when the linewidth option is not NULL
#  if (!is.null(n <- options$linewidth)) {
#    x = knitr:::split_lines(x)
    # any lines wider than n should be wrapped
#    if (any(nchar(x) > n)) x = strwrap(x, width = n)
#    x = paste(x, collapse = '\n')
#  }
#  hook_output(x, options)
#})

options(crayon.enabled = FALSE)

library(htmltools)
#library(quanteda)


columnize <- function(words, ncol = 5) {
  
  tagList(
    tags$div(
      words %>%
        map(tags$p) %>%
        tagList(),
      style = sprintf("column-count:%d;font-size:11pt;line-height:11.5pt", 
                      as.integer(ncol))
    )
  )
  
}

#sparse_bp <- hardhat::default_recipe_blueprint(composition = "dgCMatrix")

