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
#' clasif.uyxxi()
#' codiguera_clasif_tu()


# Librerías
library(readxl)
library(dplyr)
library(stringr)

# Helpers
file.path('data-raw', 'asigna.seccion.R') %>% source()
file.path('data-raw', 'capitulos.productos.R') %>% source()
file.path('data-raw', 'secciones.productos.R') %>% source()

## Codigueras productos
NCM <- file.path('data-raw', 'ncm.rds') %>%
  readRDS() %>%
  transmute(ncm_4 = as.character(codigo),
            descripcionNCM = descripcion) %>%
  mutate(ncm_4 = case_when(nchar(ncm_4)==3 ~ paste("0", ncm_4, sep = ""),
                           TRUE ~ ncm_4),
         capitulo = substring(ncm_4, 1, 2))

# import Codiguera de grupos según clasificación de Uruguay XXI
clasif.uyxxi <- function() {
  file.path('data-raw', 'Clasificación Uruguay XXI.xlsx') %>%
    read_xlsx %>%
    rename(ncm_4 = NCM4,
           ncm_6 = NCM6,
           desc.uyxxi = `Clasificación Uruxxi`) %>%
    filter(is.na(desc.uyxxi) != TRUE) %>%
    mutate(capitulo = str_sub(ncm_4, 1, 2))
}


# Genera df completo de productos - Clasificación TU (interna)
codiguera_clasif_tu <- function(){
  clasif.uyxxi() %>%
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
    transmute(seccion, capitulo, ncm_4, ncm_6, clasif.tu)
}
