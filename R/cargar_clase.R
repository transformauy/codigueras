#' Cargar Clase
#'
#' Función para cargar clase de actividad de CIIU Rev. 4.
#' @title Subclase de actividad
#' @description Función para cargar clase de actividad de CIIU Rev. 4    Clasificación Industrial Internacional Uniforme.
#' @keywords clase
#' @export
#' @import
#'
#' @examples
#' cargar_clase()

# Cargar clase a partir de codiguera completa
cargar_clase <- function(df){
  codiguera_ciiu() %>%
    dplyr::transmute(clase, desc_clase) %>%
    dplyr::distinct()
}
