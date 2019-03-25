#' Codiguera CIIU
#'
#' Función para cargar codiguera de CIIU Rev. 4.
#' @title Codiguera CIIU
#' @description Función para cargar codiguera de CIIU Rev. 4    Clasificación Industrial Internacional Uniforme.
#' @keywords ciiu
#' @export
#' @import
#'
#' @examples
#' codiguera_ciiu()


# Librerías
library(readr)
library(stringr)
library(tidyr)
library(readxl)
library(dplyr)


# Cargar codiguera completa
codiguera_ciiu <- function(df){

  seccion %>%
    dplyr::left_join(seccion_division, by = "seccion") %>%
    dplyr::left_join(division, by = "division") %>%
    dplyr::left_join(grupo %>% mutate(division = str_sub(grupo, 1, 2)), by = "division") %>%
    dplyr::left_join(clase %>% mutate(grupo = str_sub(clase, 1, 3)), by = "grupo") %>%                              # ciiu a 4 dígitos
    dplyr::mutate(clase = case_when(is.na(clase) == TRUE ~ str_c(grupo, 0), TRUE ~ clase),
           desc_clase = case_when(is.na(desc_clase) == TRUE ~ desc_grupo, TRUE ~ desc_clase)) %>%
    dplyr::left_join(subclase %>% mutate(clase = str_sub(subclase, 1, 4),                                           # ciiu a 5 dígitos
                                  grupo = str_sub(subclase, 1, 3)),
              by = c("clase", "grupo")) %>%
    dplyr::mutate(subclase = case_when(is.na(subclase) == TRUE ~ str_c(clase, 0), TRUE ~ subclase),
           desc_subclase = case_when(is.na(desc_subclase) == TRUE ~ desc_clase, TRUE ~ desc_subclase)) %>%
    dplyr::mutate(desc_clase = if_else(clase == "4631", "Comercio al por mayor de alimentos, bebidas y tabaco.",
                                desc_clase)) %>%
    dplyr::union_all(cargar_ciiu_INE_anexo) %>%
    unique
}
