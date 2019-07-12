library(tidyverse)
library(readxl)


df_paises <- read_excel("~/../vburguete/codigueras/data-raw/df_paises.xlsx")
iso3 <- read_excel("~/../vburguete/codigueras/data-raw/df_paises.xlsx", sheet = "iso")
excep <- read_excel("~/../vburguete/codigueras/data-raw/df_paises.xlsx", sheet = "excep")

patrones <- df_paises$patron
finales <- df_paises$final

tildes <- function(texto){
  chartr("ÀÈÌÒÙÂÊÎÔÛÄËÏÖÜÅÇ","AEIOUAEIOUAEIOUAC", texto)
}

##Esta es la función a subir en el paquete
#Revisar las referencias a los vectores patrones y finales

corrige_paises  <-  function(df, name = "pais") {
  #Crea un vector auxiliar con la columna del data frame a corregir
  aux1 <- df %>% select(pais = name) %>%
    distinct()

  #Pasa todo a mayúscula y quita acentuaciones, ademas crea join con casos particulares a corregir
  aux1 <- aux1 %>%
    mutate(intermedio = pais %>%
             toupper %>%
             tildes) %>%
    left_join(excep, by = c("intermedio" = "pais")) %>%
    mutate(final = case_when(is.na(final) == T ~ pais,
                             T ~ final)) %>%
    select(-intermedio)

  #Corrige el nombre de los países según patrones
  for (i in 1:length(patrones)) {
    aux1 <- aux1 %>%
      mutate(final = str_replace_all(final, patrones[[i]], finales[[i]]))
  }

  #Une el data frame auxiliar al data frame original. Se agrega una columna con los nombre corregidos y otra con el código ISO
  df <- left_join(df, aux1, by = "pais") %>%
    left_join(iso3, by = "final") %>%
    select(-pais) %>%
    rename(pais = final)
}
