#' Cargar grupo
#'
#' Función para cargar grupo de actividad de CIIU Rev. 4.
#' @title Subclase de actividad
#' @description Función para cargar grupo de actividad de CIIU Rev. 4    Clasificación Industrial Internacional Uniforme.
#' @keywords grupo
#' @export
#' @import
#'
#' @examples
#' cargar_grupo()


# Cargar grupo a partir de codiguera completa
cargar_grupo <- function(df){
  codiguera_ciiu() %>%
    dplyr::transmute(grupo, desc_grupo) %>%
    dplyr::distinct()
}
