#' Codiguera CNBCU - CIIU
#'
#' Función para cargar codiguera de CNBCU - CIIU
#' @title Codiguera CIIU CNBCU
#' @description Función para cargar codiguera de CIIU CNBCU    Codiguera de productos del BCU y sus equivalencias según códigos ciiu3 y ciiu4 (Clasificación Industrial Internacional Uniforme Rev.3 y Rev.4, respectivamente)
#' @keywords ciiu
#' @export
#' @import tidyverse readxl stringr
#'
#' @examples
#' codiguera_ciiu()


# Librerías
library(tidyverse)
library(readxl)
library(stringr)


## codiguera cnbcu, ciiu4, ciiu3

codiguera_cnbcu_ciius <- function(df){
  ciiu %>%
    dplyr::mutate(ciiu4 = str_sub(ciiu, 1, 4)) %>%
    dplyr::group_by(ciiu4) %>%
    dplyr::summarize() %>%
    dplyr::left_join(ciiu4_ciiu3) %>%
    dplyr::left_join(cnbcu_subclase) %>%
    dplyr::select(-denominacion.cnbcu) %>%
    dplyr::group_by(ciiu4) %>%
    dplyr::summarize(ciiu3 = first(ciiu3),
                     cnbcu = first(cnbcu)) %>%                                                     # ciiu4 no se repite
    filter(is.na(ciiu3) != TRUE) %>%
    filter(is.na(cnbcu) != TRUE) %>%
    dplyr::left_join(cnbcu_subclase %>%
                       dplyr::rename(descripcion.cnbcu = denominacion.cnbcu)) %>%                  # agrega descripción cnbcu
    dplyr::left_join(ciiu %>%
                       dplyr::mutate(ciiu4 = str_sub(ciiu, 1, 4)) %>%
                       dplyr::transmute(ciiu4, descripcion.ciiu4 = descripcion))
}
