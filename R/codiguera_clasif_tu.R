#' Codiguera Clasificación Transforma Uruguay
#'
#' Función para cargar codiguera de clasificación de grupo de productos Transforma Uruguay.
#' @title Codiguera Clasificación Transforma Uruguay
#' @description Función para cargar codiguera de clasificación de grupo de productos Transforma Uruguay.    A partir de codiguera de clasificación de productos de Uruguay XXI.
#' @keywords clasif_tu
#' @export
#' @import
#'
#' @examples
#' codiguera_clasif_tu()

# Genera df completo de productos - Clasificación TU (interna)
codiguera_clasif_tu <- function(){
  codiguera_ncm_wide() %>%
    dplyr::filter(is.na(seccion) != TRUE) %>%
    dplyr::left_join(clasif.uyxxi %>%
                       select(ncm_10, desc.uyxxi) %>%
                       unique(),
                     by = "ncm_10") %>%
    dplyr::mutate(clasif.tu = dplyr::case_when((is.na(desc.uyxxi) != "Ganado en pie" & capitulo == "01") ~ "Otros animales vivos",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "02") ~ "Otros despojos y subproductos cárnicos",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "03") ~ "Otros productos del mar",
                                               (str_sub(ncm_6, 1, 5) == "04071") ~ "Otros productos agropecuarios",
                                               (str_sub(ncm_6, 1, 5) == "04072" | ncm_4 == "0408" | ncm_4 == "0410") ~ "Otros alimentos",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 == "0407") ~ "Otros productos agropecuarios",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 %in% c("0401", "0402", "0403", "0404",  "0405", "0406")) ~ "Productos lácteos",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "05") ~ "Otros productos de origen animal",
                                               (capitulo == "07" & desc.ncm_10 == "Para siembra") ~ "Otros productos agropecuarios",
                                               (is.na(desc.uyxxi) == TRUE & capitulo %in% c("07", "17", "18", "19", "21")) ~ "Otros alimentos",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 == "0805") ~ "Frutas cítricas",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "08") ~ "Frutos y frutas no cítricas",
                                               (is.na(desc.uyxxi) == TRUE & capitulo %in% c("09", "37", "38", "45", "46", "50", "52", "55", "68", "69", "70", "72",
                                                                                            "73", "74", "75", "76", "78", "80", "83", "88", "89", "91", "93", "97")) ~ desc.cap,
                                               (is.na(desc.uyxxi) == TRUE & (capitulo %in% c("06", "11", "12", "13", "14"))) ~ "Otros productos agropecuarios",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "10") ~ "Otros cereales",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 == "1502") ~ "Despojos y subproductos cárnicos (bovinos principalmente)",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 == "1501") ~ "Otros productos agropecuarios",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "15" & !ncm_4 %in% c("1502", "1505")) ~ "Margarina y aceites",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 %in% c("1604", "1605")) ~ "Pescados y productos del mar",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "20") ~ "Preparaciones de frutas, hortalizas y fruto",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 == "2204") ~ "Vino",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "22" & ncm_4 != "2204") ~ "Otros alime ntos",
                                               (is.na(desc.uyxxi) == TRUE & capitulo %in% c("25", "26", "27")) ~ "Otros productos minerales",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "28") ~ "Otros productos químicos inorgánicos",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "29") ~ "Otros productos químicos orgánicos",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "30") ~ "Otros productos farmacéuticos",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "31") ~ "Sustancias químicas para el agro",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "32") ~ "Pinturas, barnices y demás",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "33") ~ "Aceites esenciales y resinoides",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "34") ~ "Artículos de limpieza",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "35") ~ "Materias albuminoideas",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "36") ~ "Pólvora, explosivos y demás materias inflamables",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "37") ~ "Artículos de limpieza",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "39") ~ "Otros productos de plástico",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "40") ~ "Otros productos de caucho",
                                               (is.na(desc.uyxxi) == TRUE & capitulo %in% c("41", "42")) ~ "Otros productos de cuero",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "43") ~ "Otros productos de peletería",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "44") ~ "Otros productos de madera",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 == "4703") ~ "Celulosa",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "47" & ncm_4 != "4703") ~ "Las demás pastas de madera o de materias fibrosas celulósicas",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "48") ~ "Otras manufacturas de pasta de celulosa, de papel o cartón",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "49") ~ "Productos editoriales, de prensa y demás industrias gráficas",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "53") ~ "Otras fibras textiles vegetales",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "54") ~ "Filamentos sintéticos o artificiales",
                                               (is.na(desc.uyxxi) == TRUE & capitulo %in% c("56", "60", "66", "67")) ~ "Otros artículos textiles",
                                               (is.na(desc.uyxxi) == TRUE & capitulo %in% c("57", "58", "61", "62", "64", "65")) ~ "Vestimenta, calzados y otros textiles",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 %in% c("5901", "5904", "5905")) ~ "Otros artículos textiles",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 == "7101") ~ "Perlas naturales o cultivadas",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 == "7102") ~ "Diamantes",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 %in% c("7104", "7105")) ~ "Otras piedras preciosas o semipreciosas",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 %in% c("7106", "7107", "7109", "7110", "7111", "7112")) ~ "Otros metales preciosas y chapados de metal precioso",
                                               (is.na(desc.uyxxi) == TRUE & ncm_4 %in% c("7113", "7114", "7115", "7116", "7117", "7118")) ~ "Joyería y demás manufacturas de piedras o metales preciosos",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "81") ~ "Los demás metales comunes",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "82") ~ "Herramientas y útiles de metal común",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "84") ~ "Reactores nucleares, calderas, máquinas, aparatos y artefactos mecánicos",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "85") ~ "Máquinas, aparatos y material eléctrico",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "86") ~ "Vehículos y material para vías férreas o similares",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "87") ~ "Otros vehículos terrestres",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "90") ~ "Otros instrumentos y aparatos",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "92") ~ "Instrumentos musicales",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "94") ~ "Muebles",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "95") ~ "Juguetes, juegos y artículos para recreo o deporte",
                                               (is.na(desc.uyxxi) == TRUE & capitulo == "96") ~ "Otras manufacturas diversas",
                                               TRUE ~ desc.uyxxi)) %>%
    dplyr::mutate(clasif.tu = case_when(ncm_4 %in% c("2106", "3302") ~ "Concentrado de bebidas",
                                        clasif.tu == "Despojos y subproductos cárnicos (bovinos principalmente)" ~ "Despojos y subproductos cárnicos",
                                        TRUE ~ clasif.tu)) %>%
    dplyr::transmute(seccion, capitulo, ncm_4, ncm_6, ncm_10, clasif.tu)
}
