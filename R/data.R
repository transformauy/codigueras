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



#' cnbcu_subclase
#'
#' Codiguera completa BCU con descripción y equivalencia ciiu3.
#'
#' @format Un data-frame con tres variables: \code{cnbcu}, \code{denominacion.bcu} y \code{ciiu3}.
#' (\code{cnbcu_subclase} está desagregada en 301 códigos de cnbcu, cada uno con su respectiva
#'   descripción y equivalencia de Clasificación Industrial Uniforme Rev.3.)
#' @examples
#' cnbcu_subclase
"cnbcu_subclase"



#' cnbcu_ciiu
#'
#' Codiguera completa BCU con descripción y equivalencia ciiu3.
#'
#' @format Un data-frame con cuatro variables: \code{CATEGORIA}, \code{`CODIGO CNBCU`}, \code{`DENOMINACION CNBCU`}
#' y \code{`CODIGO CIIU Rev.3`}.
#' (\code{cnbcu_ciiu} está desagregada en 177 códigos de actividad del BCU, cada uno con su respectiva descripción y
#'   correspondencia CIIU Rev.3)
#' @examples
#' cnbcu_ciiu
"cnbcu_ciiu"


#' cnbcu.seccion
#'
#' Codiguera completa BCU desagregada por sección, con descripción.
#'
#' @format Un data-frame con cuatro variables: \code{desc.cnbcu.seccion}, \code{year}, \code{indice.seccion}
#' y \code{cnbcu.seccion}.
#' (\code{cnbcu.seccion} está desagregada en 16 códigos de secciones de actividad del BCU, cada uno con su respectiva descripción para
#' 12 años de estudio)
#' @examples
#' cnbcu.seccion
"cnbcu.seccion"


#' cnbcu.subseccion
#'
#' Codiguera completa BCU desagregada por subsección, con descripción.
#'
#' @format Un data-frame con cuatro variables: \code{desc.cnbcu.subseccion}, \code{year}, \code{indice.subseccion}
#' y \code{cnbcu.subseccion}.
#' (\code{cnbcu.subseccion} está desagregada en 852 códigos de subsecciones de actividad del BCU, cada uno con su respectiva descripción y
#'   correspondencia CIIU Rev.3)
#' @examples
#' cnbcu.subseccion
"cnbcu.subseccion"


#' cnbcu.completo
#'
#' Codiguera completa BCU desagregada por código de actividad (cnbcu), con descripción.
#'
#' @format Un data-frame con cuatro variables: \code{desc.cnbcu}, \code{year}, \code{indice} y \code{cnbcu}.
#' (\code{cnbcu.completo} está desagregada en 1044 códigos de actividad del BCU, cada uno con su respectiva descripción)
#' @examples
#' cnbcu.completo
"cnbcu.completo"



#' ciiu4_ciiu3
#'
#' Codiguera de correspondencia de CIIU Rev. 4 a CIIU Rev. 3.
#'
#' @format Un data-frame con cuatro variables: \code{ciiu3}, \code{ciiu4_5}, \code{ciiu4} y \code{descripcion}.
#' (\code{ciiu4_5} está desagregada en 787 códigos de subclase de actividad, cada uno con su respectiva descripción y
#'     correspondencia con \code{ciiu4} y \code{ciiu3})
#' @examples
#' ciiu4_ciiu3
"ciiu4_ciiu3"

