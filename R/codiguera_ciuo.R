#' Codiguera CIUO.
#'
#' Función para cargar codiguera de CIUO.
#' @title Codiguera CIUO.
#' @description Función para cargar codiguera de CIUO.    Listado Nacional de Denominaciones de Ocupaciones (CIUO)
#' @keywords ciuo
#' @export
#' @import readxl dplyr
#'
#' @examples
#' codiguera_ciuo()


# Librerías
library(readxl)
library(dplyr)

# Helpers
listado_ocupaciones <- file.path('data-raw', 'listado_a_usar_Ocupaciones.xls') %>%
  read_excel(skip = 1, col_names = TRUE)
# save(listado_ocupaciones, file = 'data/listado_ocupaciones.rda')

codiguera_ciuo <- function() {
  listado_ocupaciones %>%
    rename_at(1:4, ~c("denominacion_ocupaciones", "cnuo_95", "descripcion", "ciuo")) %>%
    transmute(ciuo, descripcion) %>%
    mutate(descripcion = case_when(ciuo == "1412" ~ "Gerentes de restaurantes",
                                   ciuo == "1431" ~ "Gerentes de centros deportivos, de esparcimiento y culturales",
                                   TRUE ~ descripcion)) %>%
    unique
}
