#' Cargar division
#'
#' Función para cargar division de actividad de CIIU Rev. 4.
#' @title Subclase de actividad
#' @description Función para cargar division de actividad de CIIU Rev. 4    Clasificación Industrial Internacional Uniforme.
#' @keywords division
#' @export
#' @import tidyr dplyr
#'
#' @examples
#' cargar_division()


# Librerías
library(tidyr)
library(dplyr)


# Cargar division a partir de codiguera completa
cargar_division <- function(df){
  codiguera_ciiu() %>%
    transmute(division, desc_division) %>%
    distinct()
}
