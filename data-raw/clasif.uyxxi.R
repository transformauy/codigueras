
# import Codiguera de grupos según clasificación de Uruguay XXI

# clasif.uyxxi <- file.path('data-raw', 'Clasificación Uruguay XXI.xlsx') %>%                      # previa
#   read_xlsx %>%
#   rename(ncm_4 = NCM4,
#          ncm_6 = NCM6,
#          desc.uyxxi = `Clasificación Uruxxi`) %>%
#   filter(is.na(desc.uyxxi) != TRUE) %>%
#   mutate(capitulo = str_sub(ncm_4, 1, 2))
# # save(clasif.uyxxi, file = 'data/clasif.uyxxi.rda')
# devtools::use_data(clasif.uyxxi, overwrite = TRUE)


clasif.uyxxi <- file.path('data-raw', 'Clasificación Uruguay XXI 2019.xlsx') %>%
    read_xlsx %>%
    select(ncm_10 = NCM10,
           desc.uyxxi = `Clasificación uruxxi  Nombre 2019`) %>%
    filter(is.na(desc.uyxxi) != TRUE,
           desc.uyxxi != "(En blanco)") %>%
    mutate(ncm_10 = str_pad(ncm_10, 10, "right", "0"),                                             # Hay dos códigos de 9 dígitos que les falta el cero a la derecha
           ncm_6 = str_sub(ncm_10, 1, 6),
           ncm_4 = str_sub(ncm_10, 1, 4),
           capitulo = str_sub(ncm_4, 1, 2))
# save(clasif.uyxxi, file = 'data/clasif.uyxxi.rda')
devtools::use_data(clasif.uyxxi, overwrite = TRUE)
