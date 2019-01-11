#' Cargar Clase
#'
#' Función para cargar clase de actividad de CIIU Rev. 4.
#' @title Subclase de actividad
#' @description Función para cargar clase de actividad de CIIU Rev. 4    Clasificación Industrial Internacional Uniforme.
#' @keywords clase
#' @export
#' @import tidyr dplyr
#'
#' @examples
#' cargar_clase()


# Librerías
library(tidyr)
library(dplyr)


# Cargar clase a partir de codiguera completa
cargar_clase <- function(df){
  codiguera_ciiu() %>%
    transmute(clase, desc_clase) %>%
    distinct()
}
