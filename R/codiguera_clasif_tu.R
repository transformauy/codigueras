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
              by = c("capitulo", "seccion", "descripcion.seccion"))  %>%
    mutate(clasif.tu = dplyr::case_when((is.na(desc.uyxxi) == TRUE & capitulo == "01") ~ "Los demás animales vivos",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "04") ~ "Los demás productos comestibles de origen animal",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "05") ~ "Los demás productos de origen animal",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "10" & ncm_4 %in% c("1002", "1004")) ~ descripcionNCM,
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "10" & ncm_4 %in% c("1007", "1008")) ~ "Los demás cereales",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "11") ~ "Los demás productos de molinería",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "12") ~ "Las demás semillas y frutos oleaginosos",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "13") ~ "Los demás jugos y extractos vegetales",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "14") ~ "Los demás productos de origen vegetal",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "15" & !ncm_4 %in% c("1502", "1505")) ~ "Margarina y aceites",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "16") ~ "Preparaciones de carne, pescado o de crustáceos, moluscos o demás invertebrados acuáticos",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "19") ~ "Los demás productos de pastelería",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "22") ~ "Las demás bebidas, líquidos alcohólicos y/o vinagre",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "23") ~ "Residuos y desperdicios de las industrias alimentarias",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "27") ~ "Combustibles minerales, aceites minerales y productos de su destilación",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "28") ~ "Productos químicos inorgánicos",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "33") ~ "Aceites esenciales y resinoides",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "35") ~ "Materias albuminoideas",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "36") ~ "Pólvora y explosivos",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "47") ~ "Pasta de madera o de las demás materias fibrosas celulósicas",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "49") ~ "Productos editoriales, de la prensa y de las demás industrias gráficas",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "53") ~ "Las demás fibras textiles vegetales",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "54") ~ "Filamentos sintéticos o artificiales",
                                        (is.na(desc.uyxxi) == TRUE & as.numeric(capitulo) %in% c(56:65) & !ncm_4 %in% c("5903", "6304")) ~ "Las demás telas impregnadas, recubiertas, revestidas o estratificadas",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "67") ~ "Plumas y plumón preparados y artículos de plumas o plumón",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "81") ~ "Los demás metales comunes",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "82") ~ "Herramientas y útiles de metal común",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "84") ~ "Reactores nucleares, calderas, máquinas, aparatos y artefactos mecánicos",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "85") ~ "Máquinas, aparatos y material eléctrico, y sus partes",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "86") ~ "Vehículos y material para vías férreas o similares, y sus partes",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "87") ~ "Vehículos automóviles, tractores, velocípedos y demás vehículos terrestres",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "90") ~ "Instrumentos y aparatos de óptica, fotografía o cinematografía, de medida, control o precisión",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "92") ~ "Instrumentos musicales",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "94") ~ "Muebles",
                                        (is.na(desc.uyxxi) == TRUE & capitulo == "95") ~ "Juguetes, juegos y artículos para recreo o deporte",
                                        (is.na(desc.uyxxi) == TRUE) ~ descripcion.capitulo,
                                        TRUE ~ desc.uyxxi)) %>%
    mutate(clasif.tu = case_when(ncm_4 == "4703" ~ "Celulosa",
                                 ncm_4 %in% c("2106", "3302") ~ "Concentrado de bebidas",
                                 clasif.tu == "Despojos y subproductos cárnicos (bovinos principalmente)" ~ "Despojos y subproductos cárnicos",
                                 TRUE ~ clasif.tu)) %>%
    transmute(seccion, capitulo, ncm_4, ncm_6, clasif.tu)
}
