#' Codiguera NCM
#'
#' Función para cargar codiguera de productos NCM.
#' @title Codiguera NCM.
#' @description Función para cargar codiguera de productos NCM.    Nomenclatura Común Mercosur estructurada a diez dígitos y su correspondiente régimen arancelario.    Basada en el Sistema Armonizado de Designación y Codificación de Mercancías, actualizado con su V Enmienda, con entrada en vigencia el 1 de enero de 2012.
#' @keywords ncm
#' @export
#' @import readxl dplyr stringr tibble
#'
#' @examples
#' codiguera_ncm()
#' codiguera_ncm_wide()
#' codiguera_ncm_long()


library(readxl)
library(dplyr)
library(stringr)
library(tibble)

# Helpers
file.path('www', 'asigna.seccion.R') %>% source()
file.path('www', 'capitulos.productos.R') %>% source()
file.path('www', 'secciones.productos.R') %>% source()


# Codiguera completa (Sección, Capítulo, Partida, Subpartida) - archivo de la web en formato .xls que coincide con NCM adaptado a Uruguay.
ncm_base <- file.path('www', 'ncm_5.xls') %>%
  read_excel(skip = 2) %>%
  rename_at(1:2, ~c('NCM', 'descripcion')) %>%
  filter(is.na(descripcion) != TRUE) %>%
  mutate(codigo = str_replace_all(NCM, pattern = '\\.', '')) %>%
  mutate(n = nchar(codigo)) %>%
  mutate(variable =
           if_else(NCM %in% as.character(as.roman(1:21)), 'seccion',
           if_else(n == 2, 'capitulo',
           if_else(n == 4, 'ncm_4',
           if_else(n == 5, 'ncm_5',
           if_else(n == 6, 'ncm_6',
           if_else(n == 7, 'ncm_7', 'ncm_8')))))))


# Incorporo los datasets generados en una única codiguera
codiguera_ncm <- function(){

  ncm_base %>%
    filter(variable == 'ncm_8') %>%
    transmute(ncm_8 = codigo, desc.ncm_8 = descripcion) %>%
    mutate(ncm_7 = str_sub(ncm_8, 1, 7)) %>%

    left_join(ncm_base %>%
                filter(variable == 'ncm_7') %>%
                transmute(ncm_7 = codigo, desc.ncm_7 = descripcion),
              by = 'ncm_7') %>%
    mutate(ncm_6 = str_sub(ncm_7, 1, 6)) %>%

    left_join(ncm_base %>%
                filter(variable == 'ncm_6') %>%
                transmute(ncm_6 = codigo, desc.ncm_6 = descripcion),
              by = 'ncm_6') %>%
    mutate(ncm_5 = str_sub(ncm_6, 1, 5)) %>%

    left_join(ncm_base %>%
                filter(variable == 'ncm_5') %>%
                transmute(ncm_5 = codigo, desc.ncm_5 = descripcion),
              by = 'ncm_5') %>%
    mutate(ncm_4 = str_sub(ncm_5, 1, 4)) %>%

    left_join(ncm_base %>%
                filter(variable == 'ncm_4') %>%
                transmute(ncm_4 = codigo, desc.ncm_4 = descripcion),
              by = 'ncm_4') %>%
    mutate(capitulo = str_sub(ncm_4, 1, 2)) %>%

    left_join(ncm_base %>%
                filter(variable == 'capitulo') %>%
                transmute(capitulo = codigo, desc.cap = descripcion),
              by = 'capitulo') %>%
    asigna.seccion() %>%
    mutate(seccion = as.character(seccion)) %>%

    left_join(ncm_base %>%
                filter(variable == 'seccion') %>%
                transmute(seccion = codigo, desc.secc = descripcion),
              by = 'seccion') %>%
    transmute(seccion, desc.secc, capitulo, desc.cap, ncm_4, desc.ncm_4, ncm_5,
              desc.ncm_5, ncm_6, desc.ncm_6, ncm_7, desc.ncm_7, ncm_8, desc.ncm_8)
}


# Función para cargar codiguera completa: FORMATO WIDE
# -------------------------------------------------------------------------------------------------------------------------------------------------------------------
# seccion      desc.secc    capitulo      desc.cap    ncm_4    desc.ncm_4    ncm_5   desc.ncm_5     ncm_6    desc.ncm_6    ncm_7    desc.ncm_7    ncm_8    desc.ncm_8
# -------------------------------------------------------------------------------------------------------------------------------------------------------------------
#       I    Animales...          01   Animales...     0101           ...    01012          ...    010121           ...   0101210         ...  01012100           ...
#      II   Productos...          06    Plantas...     0601           ...    06011          ...    060110           ...   0601100         ...  06011000           ...
# -------------------------------------------------------------------------------------------------------------------------------------------------------------------

codiguera_ncm_wide <- function(){
  ncm_base %>%
    filter(variable == 'ncm_8') %>%                                                                # Empieza por mayor desagregación ncm a 8 dígitos
    transmute(ncm_8 = codigo, desc.ncm_8 = descripcion) %>%
    mutate(ncm_7 = str_sub(ncm_8, 1, 7)) %>%

    left_join(
      ncm_base %>%
        filter(variable == 'ncm_7') %>%                                                            # Agrega ncm a 7 dígitos
        transmute(ncm_7 = codigo, desc.ncm_7 = descripcion),
      by = 'ncm_7') %>%
    mutate(ncm_6 = str_sub(ncm_7, 1, 6)) %>%

    left_join(
      ncm_base %>%
        filter(variable == 'ncm_6') %>%                                                            # Agrega ncm a 6 dígitos
        transmute(ncm_6 = codigo, desc.ncm_6 = descripcion),
      by = 'ncm_6') %>%
    mutate(ncm_5 = str_sub(ncm_6, 1, 5)) %>%

    left_join(
      ncm_base %>%
        filter(variable == 'ncm_5') %>%                                                            # Agrega ncm a 5 dígitos
        transmute(ncm_5 = codigo, desc.ncm_5 = descripcion),
      by = 'ncm_5') %>%
    mutate(ncm_4 = str_sub(ncm_5, 1, 4)) %>%

    left_join(
      ncm_base %>%
        filter(variable == 'ncm_4') %>%                                                            # Agrega ncm a 4 dígitos
        transmute(ncm_4 = codigo, desc.ncm_4 = descripcion),
      by = 'ncm_4') %>%
    mutate(capitulo = str_sub(ncm_4, 1, 2)) %>%

    left_join(capitulos.productos %>%                                                              # Agrega capítulo según df "capitulos.productos"
                transmute(capitulo, desc.cap = descripcion.capitulo),
              by = "capitulo") %>%

    # left_join(
    #   ncm_base %>%                                                                               # Agrega capítulo de la codiguera ncm_base
    #     filter(variable == 'capitulo') %>%
    #     transmute(capitulo = codigo, desc.cap = descripcion),
    #   by = 'capitulo') %>%

    asigna.seccion() %>% mutate(seccion = as.character(seccion)) %>%                               # Agrega sección según df "secciones.productos"
    left_join(secciones.productos %>%
                mutate(seccion = as.character(seccion)) %>%
                rename(desc.secc = descripcion.seccion),
              by = "seccion") %>%

    # left_join(
    #   ncm_base %>%
    #     filter(variable == 'seccion') %>%                                                        # Agrega sección de la codiguera ncm_base
    #     transmute(seccion = codigo, desc.secc = descripcion),
    #   by = 'seccion') %>%

    transmute(seccion, desc.secc, capitulo, desc.cap, ncm_4, desc.ncm_4, ncm_5,                    # Ordena variables
              desc.ncm_5, ncm_6, desc.ncm_6, ncm_7, desc.ncm_7, ncm_8, desc.ncm_8) %>%

    mutate(desc.cap = str_replace_all(desc.cap, pattern = "- ", ""),                               # elimina guiones de las descripciones de las partidas de 4, 5, 6, 7 y 8 dígitos
           desc.ncm_4 = str_replace_all(desc.ncm_4, pattern = "-+", ""),
           desc.ncm_5 = str_replace_all(desc.ncm_5, pattern = "-+", ""),
           desc.ncm_6 = str_replace_all(desc.ncm_6, pattern = "-+", ""),
           desc.ncm_7 = str_replace_all(desc.ncm_7, pattern = "-+", ""),
           desc.ncm_8 = str_replace_all(desc.ncm_8, pattern = "-+", "")) %>%

    mutate(descripcion_completa = str_c(na.omit(desc.secc), ' - ',
                                        na.omit(desc.cap), ' - ',
                                        na.omit(desc.ncm_4), ' - ',
                                        na.omit(desc.ncm_5), ' - ',
                                        na.omit(desc.ncm_6), ' - ',
                                        na.omit(desc.ncm_7), ' - ',
                                        na.omit(desc.ncm_8), ' - ')) %>%

    mutate(
      #desc.ncm_6 = case_when(str_detect(desc.ncm_5, pattern = ".*:$") == TRUE ~
      #                         str_c(desc.ncm_5, ' ', desc.ncm_6),
      #                       TRUE ~ desc.ncm_6),

      desc.ncm_7 = case_when(str_detect(desc.ncm_6, pattern = ".*:$") == TRUE ~                    # a las descripciones que terminan con ":" le
                               str_c(desc.ncm_6, ' ', desc.ncm_7),                                 # agrega la descripción de la subpartida siguiente
                             TRUE ~ desc.ncm_7),

      desc.ncm_5 = str_replace_all(desc.ncm_5, pattern = ":$", "")) %>%

    mutate(desc.ncm_7 = case_when(is.na(desc.ncm_7) == TRUE ~ desc.ncm_8, TRUE ~ desc.ncm_7),      # Completa descripciones faltantes
           desc.ncm_6 = case_when(is.na(desc.ncm_6) == TRUE ~ desc.ncm_7, TRUE ~ desc.ncm_6),
           desc.ncm_5 = case_when(is.na(desc.ncm_5) == TRUE ~ desc.ncm_6, TRUE ~ desc.ncm_5),
           desc.ncm_4 = case_when(is.na(desc.ncm_4) == TRUE ~ desc.ncm_5, TRUE ~ desc.ncm_4)) %>%  #,
    # desc.cap = str_replace_all(desc.cap, ".*(?<=\\n).*", "")) %>%                                # elimina notas de la descripción de los capítulos (ncm_base)

    # mutate(patron = str_c("SECCIÓN ", seccion, "- "),                                            # depura descripción de secciones (ncm_base)
    #        desc.secc = str_replace_all(desc.secc, pattern = patron, "")) %>%

    # mutate(patron = str_c("CAPÍTULO ", as.numeric(capitulo)),                                    # depura descripción de los capítulos (ncm_base)
    #        desc.cap = str_replace_all(desc.cap, pattern = patron, "")) %>%

    mutate(patron = str_detect(desc.ncm_5, pattern = "^(D|d)e\\s.*"),                              # a las descripciones de las partidas de ncm a 5
           desc.ncm_5 = case_when(patron == TRUE ~ str_c(desc.ncm_4, ' ', desc.ncm_5),             # dígitos que empiezan con "De/de" le agrega la
                                  TRUE ~ desc.ncm_5)) %>%                                          # descripción de la partida anterior.

    select(-patron)
}



# Función para cargar codiguera completa: FORMATO LONG
# -------------------------------------
# variable    codigo    descripcion
# -------------------------------------
#  seccion         I    Animales...
# capitulo        01    Animales...
# -------------------------------------

codiguera_ncm_long <- function(){
  codiguera_ncm_wide() %>%
    transmute(variable = "seccion", codigo = seccion, descripcion = desc.secc, by = capitulo) %>%
    unique %>%

    rbind(codiguera_ncm_wide() %>%
            transmute(variable = "capitulo", codigo = capitulo, descripcion = desc.cap, by = ncm_4) %>%
            unique) %>%

    rbind(codiguera_ncm_wide() %>%
            transmute(variable = "ncm_4", codigo = ncm_4, descripcion = desc.ncm_4, by = ncm_5) %>%
            unique) %>%

    rbind(codiguera_ncm_wide() %>%
            transmute(variable = "ncm_5", codigo = ncm_5, descripcion = desc.ncm_5, by = ncm_6) %>%
            unique) %>%

    rbind(codiguera_ncm_wide() %>%
            transmute(variable = "ncm_6", codigo = ncm_6, descripcion = desc.ncm_6, by = ncm_7) %>%
            unique) %>%

    rbind(codiguera_ncm_wide() %>%
            transmute(variable = "ncm_7", codigo = ncm_7, descripcion = desc.ncm_7, by = ncm_8) %>%
            unique) %>%

    rbind(codiguera_ncm_wide() %>%
            transmute(variable = "ncm_8", codigo = ncm_8, descripcion = desc.ncm_8, by = NA) %>%
            unique)
}
