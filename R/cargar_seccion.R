#' Cargar seccion
#'
#' Función para cargar seccion de actividad de CIIU Rev. 4.
#' @title Subclase de actividad
#' @description Función para cargar seccion de actividad de CIIU Rev. 4    Clasificación Industrial Internacional Uniforme.
#' @keywords seccion
#' @export
#' @import
#'
#' @examples
#' cargar_seccion()

# Cargar seccion a partir de codiguera completa
cargar_seccion <- function(df){
  codiguera_ciiu() %>%
    dplyr::transmute(seccion, desc_seccion) %>%
    dplyr::distinct()
}
