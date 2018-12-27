#' @importFrom tibble tibble
NULL


#' Codiguera Uruguay XXI
#'
#' Codiguera de grupos de productos de Uruguay XXI.
#'
#' @format Un data-frame con cuatro variables:
#' \describe{
#' \item{\code{ncm_4}}{Código de producto a 4 dígitos}
#' \item{\code{ncm_6}}{Código de producto a 6 dígitos}
#' \item{\code{desc.uyxxi}}{Nombre del grupo de Uruguay XXI}
#' \item{\code{capitulo}}{Capítulo del producto}
#' }
#'
#' (\code{clasif.uyxxi} está desagregada
#'   en 3289 productos a 6 dígitos, cada uno con su respectiva
#'   grupo de clasificación de Uruguay XXI).
#' @examples
#'   clasif.uyxxi
"clasif.uyxxi"



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


#' Capítulos de productos
#'
#' A partir de codiguera de NCM.
#'
#' @format Un data-frame con dos variables: \code{capitulo} y \code{descripcion_capitulo}.
#' (\code{capitulos.productos} está desagregada en las 99 capítulos de productos, cada uno con su respectiva
#'   descripción)
#' @examples
#' capitulos.productos
"capitulos.productos"


#' Secciones de productos
#'
#' A partir de codiguera de NCM.
#'
#' @format Un data-frame con dos variables: \code{seccion} y \code{descripcion_seccion}.
#' (\code{secciones.productos} está desagregada en las 21 secciones de productos, cada una con su respectiva
#'   descripción)
#' @examples
#' secciones.productos
"secciones.productos"


#' Secciones de actividad
#'
#' A partir de codiguera del INE.
#'
#' @format Un data-frame con dos variables: \code{seccion} y \code{desc_seccion}.
#' (\code{seccion} está desagregada en las 21 secciones de actividad, cada una con su respectiva
#'   descripción)
#' @examples
#' seccion
"seccion"

#' Divisiones de actividad
#'
#' A partir de codiguera del INE.
#'
#' @format Un data-frame con dos variables: \code{division} y \code{desc_division}.
#' (\code{division} está desagregada en las 88 divisiones de actividad, cada uno con su respectiva
#'   descripción)
#' @examples
#' division
"division"

#' Sección - Division
#'
#' A partir de codiguera del INE.
#'
#' @format Un data-frame con dos variables: \code{seccion} y \code{division}.
#' (\code{seccion} está desagregada en las 21 secciones de actividad disponibles, y en cada caso
#' las divisiones que le corresponden)
#' @examples
#' seccion_division
"seccion_division"

#' Grupos de actividad
#'
#' A partir de codiguera del INE.
#'
#' @format Un data-frame con dos variables: \code{grupo} y \code{desc_grupo}.
#' (\code{grupo} está desagregada en los 235 grupos de actividad, cada uno con su respectiva
#'   descripción)
#' @examples
#' grupo
"grupo"

#' Clases de actividad
#'
#' A partir de codiguera del INE.
#'
#' @format Un data-frame con dos variables: \code{clase} y \code{desc_clase}.
#' (\code{clase} está desagregada en las 286 clases de actividad, cada una con su respectiva
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
#' (\code{subclase} está desagregada en las 286 subclases de actividad, cada una con su respectiva
#'   descripción)
#' @examples
#' subclase
"subclase"


#' Listado de Ocupaciones
#'
#' Listado Nacional de Denominaciones de Ocupaciones (INE).
#'
#' @format Un data-frame con cuatro variables: \code{`Listado Nacional de Denominaciones de Ocupaciones`},
#' \code{`Código CNUO 95`}, \code{`Descripción de los Grupos Primarios de la CIUO 08`} y \code{`Código CIUO 08`}.
#' (\code{listado_ocupaciones} está desagregada en 3509 ocupaciones, cada una con su respectiva
#'   descripción)
#' @examples
#' listado_ocupaciones
"listado_ocupaciones"



#' NCM
#'
#' Listado de productos Nomenclatura Común Mercosur
#'
#' @format Un data-frame con tres variables: \code{ncm_4}, \code{descripcionNCM} y \code{capitulo}.
#' (\code{NCM} está desagregada en 1226 códigos de productos a 4 dígitos, cada uno con su respectiva
#'   descripción)
#' @examples
#' NCM
"NCM"



#' ncm_base
#'
#' Codiguera completa NCM adaptada a Uruguay
#'
#' @format Un data-frame con cinco variables: \code{NCM}, \code{descripcion}, \code{codigo},
#' \code{n} y \code{variable}.
#' (\code{ncm_base} está desagregada en 14542 códigos de productos a 10 dígitos, cada uno con su respectiva
#'   descripción)
#' @examples
#' ncm_base
"ncm_base"


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
