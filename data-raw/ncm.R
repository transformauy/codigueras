
## Codigueras productos

NCM <- file.path('data-raw', 'ncm.rds') %>%
  readRDS() %>%
  transmute(ncm_4 = as.character(codigo),
            descripcionNCM = descripcion) %>%
  mutate(ncm_4 = case_when(nchar(ncm_4)==3 ~ paste("0", ncm_4, sep = ""),
                           TRUE ~ ncm_4),
         capitulo = substring(ncm_4, 1, 2))
# save(NCM, file = 'data/NCM.rda')
devtools::use_data(NCM, overwrite = TRUE)
