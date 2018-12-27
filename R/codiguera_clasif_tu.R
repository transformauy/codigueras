#' Codiguera Clasificación Transforma Uruguay
#'
#' Función para cargar codiguera de clasificación de grupo de productos Transforma Uruguay.
#' @title Codiguera Clasificación Transforma Uruguay
#' @description Función para cargar codiguera de clasificación de grupo de productos Transforma Uruguay.    A partir de codiguera de clasificación de productos de Uruguay XXI.
#' @keywords clasif_tu
#' @export
#' @import readxl dplyr stringr
#'
#' @examples
#' codiguera_clasif_tu()


# Librerías
library(readxl)
library(dplyr)
library(stringr)


# Genera df completo de productos - Clasificación TU (interna)
codiguera_clasif_tu <- function(){
  clasif.uyxxi %>%
    full_join(NCM %>%
                asigna.seccion() %>%
                left_join(secciones.productos,
                          by = "seccion"),
              by = c("ncm_4", "capitulo")) %>%
    left_join(capitulos.productos %>%
                asigna.seccion() %>%
                left_join(secciones.productos,
                          by = "seccion"),
              by = c("capitulo", "seccion", "descripcion.seccion")) %>%
    asigna.clasif_tu() %>%
    mutate(clasif.tu = case_when(ncm_4 == "4703" ~ "Celulosa",
                                 ncm_4 %in% c("2106", "3302") ~ "Concentrado de bebidas",
                                 clasif.tu == "Despojos y subproductos cárnicos (bovinos principalmente)" ~ "Despojos y subproductos cárnicos",
                                 TRUE ~ clasif.tu)) %>%
    transmute(seccion, capitulo, ncm_4, ncm_6, clasif.tu)
}
