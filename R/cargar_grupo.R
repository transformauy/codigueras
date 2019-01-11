#' Cargar grupo
#'
#' Función para cargar grupo de actividad de CIIU Rev. 4.
#' @title Subclase de actividad
#' @description Función para cargar grupo de actividad de CIIU Rev. 4    Clasificación Industrial Internacional Uniforme.
#' @keywords grupo
#' @export
#' @import tidyr dplyr
#'
#' @examples
#' cargar_grupo()


# Librerías
library(tidyr)
library(dplyr)


# Cargar grupo a partir de codiguera completa
cargar_grupo <- function(df){
  codiguera_ciiu() %>%
    transmute(grupo, desc_grupo) %>%
    distinct()
}
