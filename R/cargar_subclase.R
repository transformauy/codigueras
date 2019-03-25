#' Cargar Subclase
#'
#' Función para cargar subclase de actividad de CIIU Rev. 4.
#' @title Subclase de actividad
#' @description Función para cargar subclase de actividad de CIIU Rev. 4    Clasificación Industrial Internacional Uniforme.
#' @keywords subclase
#' @export
#' @import
#'
#' @examples
#' cargar_subclase()

# Cargar subclase a partir de codiguera completa
cargar_subclase <- function(df){
  codiguera_ciiu() %>%
    dplyr::transmute(subclase, desc_subclase) %>%
    dplyr::distinct()
}
