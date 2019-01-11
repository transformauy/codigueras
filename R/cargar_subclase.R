#' Cargar Subclase
#'
#' Función para cargar subclase de actividad de CIIU Rev. 4.
#' @title Subclase de actividad
#' @description Función para cargar subclase de actividad de CIIU Rev. 4    Clasificación Industrial Internacional Uniforme.
#' @keywords subclase
#' @export
#' @import readr readxl dplyr stringr
#'
#' @examples
#' cargar_subclase()


# Librerías
library(tidyr)
library(dplyr)


# Cargar subclase a partir de codiguera completa
cargar_subclase <- function(df){
  codiguera_ciiu() %>%
    transmute(subclase, desc_subclase) %>%
    distinct()
}
