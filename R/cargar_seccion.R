#' Cargar seccion
#'
#' Función para cargar seccion de actividad de CIIU Rev. 4.
#' @title Subclase de actividad
#' @description Función para cargar seccion de actividad de CIIU Rev. 4    Clasificación Industrial Internacional Uniforme.
#' @keywords seccion
#' @export
#' @import tidyr dplyr
#'
#' @examples
#' cargar_seccion()


# Librerías
library(tidyr)
library(dplyr)


# Cargar seccion a partir de codiguera completa
cargar_seccion <- function(df){
  codiguera_ciiu() %>%
    transmute(seccion, desc_seccion) %>%
    distinct()
}
