
# import Codiguera de grupos según clasificación de Uruguay XXI

clasif.uyxxi <- file.path('data-raw', 'Clasificación Uruguay XXI.xlsx') %>%
    read_xlsx %>%
    rename(ncm_4 = NCM4,
           ncm_6 = NCM6,
           desc.uyxxi = `Clasificación Uruxxi`) %>%
    filter(is.na(desc.uyxxi) != TRUE) %>%
    mutate(capitulo = str_sub(ncm_4, 1, 2))
# save(clasif.uyxxi, file = 'data/clasif.uyxxi.rda')
devtools::use_data(clasif.uyxxi, overwrite = TRUE)
