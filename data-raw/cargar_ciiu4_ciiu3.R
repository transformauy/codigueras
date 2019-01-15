
# Librerías
library(dplyr)
library(readxl)
library(stringr)
library(janitor)


cargar_ciiu4_ciiu3 <- function(df){
  file.path('data-raw', 'Correspondencia_ciiu4_a_ciiu3_válida.xls') %>%
    read_excel(col_names = TRUE) %>%
    clean_names() %>%
    transmute(ciiu3 = str_pad(ciiu3ine, width = 4, side = "left", pad = "0"),
              ciiu4_5 = str_pad(ciiu_4, width = 5, side = "left", pad = "0"),
              ciiu4 = str_sub(ciiu4_5, 1, 4),
              descripcion) %>%
    filter(is.na(ciiu3) != TRUE)
}
# save(cargar_ciiu4_ciiu3, file = 'data/cargar_ciiu4_ciiu3.rda')
usethis::use_data(cargar_ciiu4_ciiu3, overwrite = TRUE)
