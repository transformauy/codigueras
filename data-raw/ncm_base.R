

# Codiguera completa (Sección, Capítulo, Partida, Subpartida) - archivo de la web en formato .xls que coincide con NCM adaptado a Uruguay.

# ncm_base <- file.path('data-raw', 'ncm_5.xls') %>%
#   read_excel(skip = 2) %>%
ncm_base <- file.path('data-raw', 'ncm_aec-10-2018_vi-enmienda_ene2019.xlsx') %>%
  read_excel(skip = 11) %>%
  rename_at(1:2, ~c('NCM', 'descripcion')) %>%
  select(1:2) %>%
  filter(is.na(descripcion) != TRUE) %>%
  mutate(codigo = str_replace_all(NCM, pattern = '\\.', '')) %>%
  mutate(n = nchar(codigo)) %>%
  mutate(variable =
           if_else(NCM %in% as.character(as.roman(1:21)), 'seccion',
                   if_else(n == 2, 'capitulo',
                           if_else(n == 4, 'ncm_4',
                                   if_else(n == 5, 'ncm_5',
                                           if_else(n == 6, 'ncm_6',
                                                   if_else(n == 7, 'ncm_7',
                                                           if_else(n == 8, 'ncm_8',
                                                                   if_else(n == 9, 'ncm_9',
                                                                           'ncm_10')))))))))
# save(ncm_base, file = 'data/ncm_base.rda')
devtools::use_data(ncm_base, overwrite = TRUE)
