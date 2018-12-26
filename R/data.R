#' @importFrom tibble tibble
NULL

#' Listado códigos CIIU del INE
#'
#' Análisis codiguera del INE.
#'
#' @format Un data-frame con once variables:
#' \describe{
#' \item{\code{seccion}}{seccion de actividad}
#' \item{\code{ciiu_4}}{código ciiu a 4 dígitos}
#' \item{\code{descripcion}}{descripción de \code{ciiu_4}}
#' \item{\code{ciiu}}{código ciiu a 5 dígitos}
#' \item{\code{division}}{division de actividad}
#' \item{\code{grupo}}{grupo de actividad}
#' \item{\code{descripcion_grupo}}{descripción de \code{grupo}}
#' \item{\code{clase}}{clase de actividad}
#' \item{\code{descripcion_clase}}{descripción de \code{clase}}
#' \item{\code{subclase}}{subclase de actividad}
#' \item{\code{descripcion_subclase}}{descripción de \code{subclase}}
#' }
#'
#' (\code{ciiu} está desagregada
#'   en los 925 códigos disponibles a 5 dígitos, y sus correspondientes código ciiu
#'   a 4 dígitos, clases, subclases, grupos y secciones, cada uno con su respectiva
#'   descripción).
#' @examples
#'   ciiu
"ciiu"


#' Secciones de actividad
#'
#' A partir de codiguera del INE.
#'
#' @format Un data-frame con dos variables: \code{seccion} y \code{desc_seccion}.
#' (\code{seccion} está desagregada las 21 secciones de actividad, cada una con su respectiva
#'   descripción)
#' @examples
#' seccion
"seccion"

#' Divisiones de actividad
#'
#' A partir de codiguera del INE.
#'
#' @format Un data-frame con dos variables: \code{division} y \code{desc_division}.
#' (\code{division} está desagregada las 88 divisiones de actividad, cada uno con su respectiva
#'   descripción)
#' @examples
#' division
"division"

#' Sección - Division
#'
#' A partir de codiguera del INE.
#'
#' @format Un data-frame con dos variables: \code{seccion} y \code{division}.
#' (\code{seccion} está desagregada las 21 secciones de actividad disponibles, y en cada caso
#' las divisiones que le corresponden)
#' @examples
#' seccion_division
"seccion_division"

#' Grupos de actividad
#'
#' A partir de codiguera del INE.
#'
#' @format Un data-frame con dos variables: \code{grupo} y \code{desc_grupo}.
#' (\code{grupo} está desagregada los 235 grupos de actividad, cada uno con su respectiva
#'   descripción)
#' @examples
#' grupo
"grupo"

#' Clases de actividad
#'
#' A partir de codiguera del INE.
#'
#' @format Un data-frame con dos variables: \code{clase} y \code{desc_clase}.
#' (\code{clase} está desagregada las 286 clases de actividad, cada una con su respectiva
#'   descripción)
#'
#' @examples
#' clase
"clase"

#' Subclases de actividad
#'
#' A partir de codiguera del INE.
#'
#' @format Un data-frame con dos variables: \code{subclase} y \code{desc_subclase}.
#' (\code{subclase} está desagregada las 286 subclases de actividad, cada una con su respectiva
#'   descripción)
#' @examples
#' subclase
"subclase"

