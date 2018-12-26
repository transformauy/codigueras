#' @title Tema de Transforma Uruguay.
#'
#' @description Configura como default el tema de Transforma Uruguay para los gráficos creados en ggplot2.
#'
#' @param
#'
#' @return
#'
#' @examples
#'
#' @export
#'
#' @import ggthemr, syfonts, ggplot2

library(ggplot2)

sysfonts::font_add("MyriadPro", "MyriadPro-Regular.otf")

get_theme_palette <- function() {

  ggthemr::define_palette(
    swatch = c("#BACB33",
               "#F7941E",
               "#999B9E",
               "#2974B4",
               "#ffcc00",
               "#a7b62d",
               "#c0504d",
               "#538fc3",
               "#d0400a",
               "#0a98cc",
               "#94a228",
               "#ffe066",
               "#865eae",
               "#f9b461",
               "#de7953",
               "#94b9d9",
               "#c1c3c4",
               "#c7d55b",
               "#f57f17",
               "#fb8c00",
               "#afb42b",
               "#ffa726",
               "#616161"),
    gradient = c(lower = "#ffcc00", upper = "#BACB33")
  )

}

theme_our <- function(base_size = 12) {

  theme_gray(base_size, base_family = "MyriadPro") +
  theme(panel.grid.major = element_line(color = "#b6b6b6"),
                 plot.background  = element_rect(fill="#ffffff"),
                 panel.background = element_rect(fill="#ffffff"),
                 panel.grid.minor = element_line("#D5D0CE"),
                 axis.ticks =  element_line(colour = "#b6b6b6"),
                 text = element_text(family = "MyriadPro"))

}

update_font_defaults <- function() {

  update_geom_defaults("text", list(family = "MyriadPro"))
  update_geom_defaults("label", list(family = "MyriadPro"))

}

set_estilotu <- function(base_size = 12)  {

  ggthemr::ggthemr(get_theme_palette())

  theme_set(theme_our(base_size = base_size))

  update_font_defaults()

}

