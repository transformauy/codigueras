
# IPI: Indice de Precios Implícitos por CNBCU
cnbcu.completo <-
  file.path('data-raw', 'cuadro_36a.xls') %>%
  read_excel(range = "A10:N97") %>%
  rename(cnbcu = X__1, desc.cnbcu = X__2,
         `2015` = `2015*`, `2016` = `2016*`) %>%
  gather(year, indice, -cnbcu, -desc.cnbcu) %>%
  mutate(cnbcu = str_replace(cnbcu, "\\(1\\)", "") %>% trimws) %>%
  separate(cnbcu, " y ", into = c("primero", "segundo"), extra = "drop") %>%
  gather(key = no.importa, value = cnbcu, primero, segundo) %>%
  select(-no.importa) %>%
  filter(!is.na(cnbcu))
# save(cnbcu.completo, file = 'data/cnbcu.completo.rda')
devtools::use_data(cnbcu.completo, overwrite = TRUE)

cnbcu.seccion <- cnbcu.completo %>%
  filter(str_length(cnbcu)==1) %>%
  rename(cnbcu.seccion=cnbcu,
         desc.cnbcu.seccion=desc.cnbcu,
         indice.seccion=indice)
# save(cnbcu.seccion, file = 'data/cnbcu.seccion.rda')
devtools::use_data(cnbcu.seccion, overwrite = TRUE)

cnbcu.subseccion <- cnbcu.completo %>%
  filter(str_length(cnbcu)>1) %>%
  rename(cnbcu.subseccion=cnbcu,
         desc.cnbcu.subseccion=desc.cnbcu,
         indice.subseccion=indice)
# save(cnbcu.subseccion, file = 'data/cnbcu.subseccion.rda')
devtools::use_data(cnbcu.subseccion, overwrite = TRUE)


# Tablas de equivalencias ciiu4-ciiu3-cnbcu
ciiu4_ciiu3 <-
  file.path('data-raw', 'ISIC4_ISIC31.txt') %>%
  read_csv %>%
  transmute(ciiu4 = ISIC4code, ciiu3 = ISIC31code) %>%
  group_by(ciiu4) %>%
  dplyr::summarize(ciiu3 = first(ciiu3))

faltan.ciiu4_ciiu3 <- tribble(
  ~ciiu4, ~ciiu3,
  "0811", "1410",
  "0812", "1410",
  "0813", "1410",
  "0819", "1410",
  "1011", "1511",
  "1012", "1511",
  "1013", "1511",
  "1019", "1511",
  "2430", "2710",
  "4630", "5122",
  "4659", "5159",
  "4949", "6010",
  "4631", "5122",
  "5511", "5510",
  "5512", "5510",
  "5513", "5511",
  "5519", "5510",
  "6100", "6110",
  "6210", "6202",
  "6620", "6621",
  "7411", "7410"
)

ciiu4_ciiu3 <- ciiu4_ciiu3 %>%
  bind_rows(faltan.ciiu4_ciiu3) %>%
  mutate(ciiu3=ifelse(ciiu3=="0501", "0500", ciiu3))
# save(ciiu4_ciiu3, file = 'data/ciiu4_ciiu3.rda')
devtools::use_data(ciiu4_ciiu3, overwrite = TRUE)


# Equivalencia cnbcu-ciiu3
cnbcu_ciiu <-
  file.path('data-raw', 'CNBCU_CIIUrev3.xls') %>%
  read_xls(range="A9:D186")
names(cnbcu_ciiu) <- c("categoria", "cnbcu", "denominacion.cnbcu", "ciiu3")
# save(cnbcu_ciiu, file = 'data/cnbcu_ciiu.rda')
devtools::use_data(cnbcu_ciiu, overwrite = TRUE)


## los que estan por subclase:
cnbcu_subclase <- cnbcu_ciiu %>%
  filter(categoria=="Subclase") %>%
  mutate(ciiu3=str_replace_all(ciiu3, "\\*", "")) %>%
  mutate(ciiu3=(strsplit(ciiu3, "\\+"))) %>%
  unnest(ciiu3) %>%
  mutate(ciiu3=trimws(ciiu3)) %>%
  select(-categoria)

## Agregar los que faltan:
faltan.cnbcu_subclase <- tribble(
  ~cnbcu, ~ciiu3,
  "G.TTT", "5151",
  "G.TTT", "5152",
  "G.TTT", "5159",
  "K.RRT", "7229",
  "K.RRT", "7221",
  "K.RRT", "7410",
  "J.TT" , "6621",
  "I.RR" , "6202"
)

cnbcu_subclase <- cnbcu_subclase %>%
  bind_rows(faltan.cnbcu_subclase)
# save(cnbcu_subclase, file = 'data/cnbcu_subclase.rda')
devtools::use_data(cnbcu_subclase, overwrite = TRUE)

