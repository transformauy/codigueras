#' Codiguera CIIU
#'
#' Función para cargar codiguera de CIIU Rev. 4.
#' @title Codiguera CIIU
#' @description Función para cargar codiguera de CIIU Rev. 4    Clasificación Industrial Internacional Uniforme.
#' @keywords ciiu
#' @export
#' @import readxl dplyr stringr
#'
#' @examples
#' codiguera_ciiu()


# Librerías
library(readr)
library(stringr)
library(tidyr)
library(readxl)
library(dplyr)

# helpers
file.path('www', 'auxiliares_ciiu.R') %>% source()


# Cargar codiguera completa
codiguera_ciiu <- function(df){

  seccion %>%

    left_join(seccion_division, by = "seccion") %>%

    left_join(division, by = "division") %>%

    left_join(grupo %>% mutate(division = str_sub(grupo, 1, 2)), by = "division") %>%

    left_join(clase %>% mutate(grupo = str_sub(clase, 1, 3)), by = "grupo") %>%                              # ciiu a 4 dígitos
    mutate(clase = case_when(is.na(clase) == TRUE ~ str_c(grupo, 0), TRUE ~ clase),
           desc_clase = case_when(is.na(desc_clase) == TRUE ~ desc_grupo, TRUE ~ desc_clase)) %>%

    left_join(subclase %>% mutate(clase = str_sub(subclase, 1, 4),                                           # ciiu a 5 dígitos
                                  grupo = str_sub(subclase, 1, 3)),
              by = c("clase", "grupo")) %>%
    mutate(subclase = case_when(is.na(subclase) == TRUE ~ str_c(clase, 0), TRUE ~ subclase),
           desc_subclase = case_when(is.na(desc_subclase) == TRUE ~ desc_clase, TRUE ~ desc_subclase)) %>%
    mutate(desc_clase = if_else(clase == "4631", "Comercio al por mayor de alimentos, bebidas y tabaco.",
                                desc_clase)) %>%

    union_all(cargar_ciiu_INE_anexo()) %>%
    unique
}

