
# Librerías
library(dplyr)
library(readxl)
library(stringr)
library(janitor)


ciiu4_ciiu3 <- file.path('data-raw', 'Correspondencia_ciiu4_a_ciiu3_válida.xls') %>%
  read_excel(col_names = TRUE) %>%
  clean_names() %>%
  transmute(ciiu3 = str_pad(ciiu3ine, width = 4, side = "left", pad = "0"),
            ciiu4_5 = str_pad(ciiu_4, width = 5, side = "left", pad = "0"),
            ciiu4 = str_sub(ciiu4_5, 1, 4),
            descripcion) %>%
  filter(is.na(ciiu3) != TRUE)
# save(ciiu4_ciiu3, file = 'data/ciiu4_ciiu3.rda')
usethis::use_data(ciiu4_ciiu3, overwrite = TRUE)


# Para validar este listado, se genera planilla con el pdf TABLA DE CORRESPONDENCIA CIIU REV.4 ADAPTADA A URUGUAY CON CIIU REV.3
# https://www.pdftoexcel.com/

# listado_INE_ciiu4_ciiu3 <- file.path('data-raw', 'CORRESPONDENCIA CIUU4 A CIUU3.xlsx') %>%
#   read_excel(col_names = TRUE) %>%
#   clean_names() %>%
#   mutate(ciiu_4 = str_replace_all(ciiu_4, ",", ""),
#          ciiu_3 = str_pad(ciiu_3, 4, "left", "0")) %>%
#   filter(is.na(ciiu_3) != TRUE)
#
# valida <- ciiu4_ciiu3 %>%
#   transmute(ciiu_3 = ciiu3) %>%
#   anti_join(listado_INE_ciiu4_ciiu3 %>%
#               select(ciiu_3))

