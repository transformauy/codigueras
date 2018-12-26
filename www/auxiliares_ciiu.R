
# Cargar base del ciiu a 5 dígitos, codiguera adaptada a Uruguay por el INE
cargar_ciiu_INE <- function(df) {
  file.path('www', 'EnricoCiiu.xlsx') %>%
    read_excel(col_names = TRUE) %>% rename_all(tolower) %>%
    rename(seccion = sección, descripcion = descripción) %>%
    filter(descripcion != "Otras actividades del servicio de alimentación") %>%
    mutate(ciiu_4 = if_else(ciiu_4 == 1010, 10100,                                                 # Código incorrecto
                            if_else(ciiu_4 == 1919, 1619,                                          # Corrección confirmada por INE
                                    if_else(ciiu_4 == 7700, 77000,                                 # Falta cero, mal reportada
                                            if_else(ciiu_4 == 74300, 84300,                        # Código incorrecto
                                                    ciiu_4))))) %>%
    filter(seccion != "V", ciiu_4 != 68100) %>%
    add_row(seccion = c("B", "I", rep("L", 3)),
            ciiu_4 = c(07100, 56290, 68100, 68101, 68109),
            descripcion = c("Extracción de minerales de hierro",
                            "Otras actividades del servicio de alimentación",
                            "Actividades inmobiliarias con bienes propios o arrendados",
                            "Propiedad y explotación de bienes inmobiliarios propios no rurales",
                            "Otras actividades con bienes propios o arrendados")) %>%
    mutate(ciiu = str_pad(ciiu_4, 5, "left", "0"))
}


cargar_ciiu_INE_anexo <- function(df){
  file.path('www', 'EnricoCiiu.xlsx') %>%
    read_excel(col_names = TRUE) %>% rename_all(tolower) %>%
    rename(seccion = sección, descripcion = descripción) %>%
    filter(seccion == "V", as.numeric(ciiu_4) > 1900) %>%
    mutate(
      desc_seccion = "Anexo al manual de Clasificación Industrial Internacional Uniforme, (rev.4)",

      division = "01*",
      desc_division = "Anexo - Predios rurales",

      grupo = "019",
      desc_grupo = desc_division,

      clase = str_c(grupo, "0"),
      desc_clase = desc_grupo,

      subclase = str_pad(ciiu_4, 5, "left", "0"),
      desc_subclase = if_else(subclase %in% c("01901", "01902", "01905", "01908"),
                              str_c("Sin actividad económica", ' - ', descripcion),
                              str_c("Con actividad económica", ' - ', descripcion))) %>%
    select(-ciiu_4, -descripcion)
}

cargar_ciiu_division <- function(df){
  file.path('www', 'ciiu_rev4_division.csv') %>%
    read_csv(locale=locale(encoding="latin1")) %>%
    transmute(division = str_pad(division, 2, "left", "0"), desc_division)
}

cargar_ciiu_seccion <-  function(df){
  file.path('www', 'ciiu_rev4_division.csv') %>%
    read_csv(locale=locale(encoding="latin1")) %>%
    transmute(seccion, desc_seccion) %>%
    unique
}

cargar_seccion_division <- function(df){
  file.path('www', 'ciiu_rev4_division.csv') %>%
    read_csv(locale=locale(encoding="latin1")) %>%
    mutate(division = str_pad(division, 2, "left", "0")) %>%
    select(-industria_ad_hoc)
}

# Considerar el ciiu a 4 dígitos
codiguera_ciiu_4digitos <- function(df) {
  cargar_ciiu_INE() %>% transmute(ciiu = str_sub(ciiu, 1, 4), descripcion)
}

# Considerar el ciiu a 5 dígitos
codiguera_ciiu_5digitos <- function(df) {
  cargar_ciiu_INE() %>% transmute(ciiu, descripcion)
}


# Análisis codiguera del INE
ciiu <- cargar_ciiu_INE() %>%

  arrange(ciiu) %>%

  mutate(division = ifelse(str_detect(ciiu, '000$') == TRUE, str_sub(ciiu, 1, 2), NA),             #  división detectada

         grupo = ifelse((is.na(division) == TRUE & str_detect(ciiu, '00$') == TRUE),               #  grupo detectado
                        str_sub(ciiu, 1, 3), NA),
         descripcion_grupo = ifelse(is.na(grupo) != TRUE, descripcion, NA),
         grupo = if_else(is.na(grupo) == TRUE, str_c(division, "0"), grupo),

         clase = ifelse((is.na(division) == TRUE & is.na(grupo) == TRUE &
                           str_detect(ciiu, '0$') == TRUE), str_sub(ciiu, 1, 4), NA),              #  clase detectada
         descripcion_clase = ifelse(is.na(clase) != TRUE, descripcion, NA),

         subclase = ifelse((is.na(division) == TRUE & is.na(grupo) == TRUE &                       #  subclase detectada
                              is.na(clase) == TRUE), ciiu, NA),
         descripcion_subclase = ifelse(is.na(subclase) != TRUE, descripcion, NA)) %>%

  mutate(clase = if_else((is.na(subclase) != TRUE & is.na(clase) == TRUE),
                         str_sub(subclase, 1, 4), clase),
         grupo = if_else((is.na(clase) != TRUE & is.na(grupo) == TRUE),
                         str_sub(clase, 1, 3), grupo),
         division = if_else((is.na(grupo) != TRUE & is.na(division) == TRUE),
                            str_sub(grupo, 1, 2), division)) %>%

  mutate(subclase = if_else(clase == "4631", "46310", subclase),
         descripcion_subclase = if_else(clase == "4631",
                                        "Comercio al por mayor de aves y sus productos",
                                        descripcion_subclase))

#### Componentes de la codiguera completa
seccion <- cargar_ciiu_seccion()                                                                   #  21 secciones, falta unicamente la sección V

division <- cargar_ciiu_division()                                                                 #  88 divisiones, está completa.

seccion_division <- cargar_seccion_division() %>% select(seccion, division) %>% unique

grupo <- ciiu %>% select(division, grupo, descripcion_grupo) %>%
  add_row(division = c("01", "03", "07", "10"),
          grupo = c("011", "032", "071", "101"),
          descripcion_grupo = c("Cultivo de productos no perennes",                                #  agrega grupos faltantes
                                "Acuicultura",                                                     #  según archivo "CIIU-Rev-4_Notas-explicativas.pdf"
                                "Extracción de minerales de hierro",
                                "Procesamiento y conservación de carne")) %>%
  left_join(division %>% filter(division %in% c("11", "12", "17", "21", "31", "36",                #  asigna descripcion de la división a los grupos que corresponde
                                                "37", "39", "41", "61", "62", "75",                #  según archivo "CIIU-Rev-4_Notas-explicativas.pdf"
                                                "90", "91", "92", "96", "97", "99")),
            by = "division") %>%
  mutate(desc_grupo = ifelse(is.na(descripcion_grupo) == TRUE,
                             desc_division, descripcion_grupo)) %>%
  select(grupo, desc_grupo) %>%
  filter(is.na(desc_grupo) != TRUE) %>%
  unique %>%
  arrange(grupo)

clase <- ciiu %>% select(grupo, clase, descripcion_clase, subclase) %>%
  left_join(grupo %>%
              filter(grupo %in% c("120", "210", "360", "370", "390", "410", "461",                 #  asigna descripcion de la grupos a las clases que corresponde
                                  "462", "463", "750", "900", "920", "970", "990")),               #  según archivo "CIIU-Rev-4_Notas-explicativas.pdf"
            by = "grupo") %>%
  mutate(clase = if_else(is.na(desc_grupo) != TRUE, str_c(grupo, "0"), clase)) %>%
  mutate(desc_clase = ifelse(is.na(descripcion_clase) == TRUE,
                             desc_grupo, descripcion_clase)) %>%
  select(clase, desc_clase) %>%
  mutate(clase =                                                                                   # 46310 corresponde a la décima clase del grupo 463
           if_else(desc_clase == "Comercio al por mayor de aves y sus productos",
                   "4631", clase)) %>%
  filter(is.na(desc_clase) != TRUE) %>% unique %>% arrange(clase)



subclase <- ciiu %>% select(clase, subclase, descripcion_subclase) %>%
  left_join(clase %>%
              filter(clase %in% c("1200", "2100", "3600", "3700", "3900",                          #  asigna descripcion de la clase a las subclases que corresponde
                                  "4100", "7500", "9000", "9900")),                                #  según archivo "CIIU-Rev-4_Notas-explicativas.pdf"
            by = "clase") %>%
  mutate(subclase =
           if_else(is.na(desc_clase) != TRUE, str_c(clase, "0"), subclase)) %>%
  mutate(desc_subclase =
           ifelse(is.na(descripcion_subclase) == TRUE, desc_clase, descripcion_subclase)) %>%
  select(subclase, desc_subclase) %>%
  filter(is.na(desc_subclase) != TRUE) %>%
  unique %>%
  arrange(subclase)
