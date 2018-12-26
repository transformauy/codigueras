
# Función para asignar sección de acuerdo a "NCM - anexo.pdf"
asigna.seccion <- function(df){
  df %>%
    mutate(seccion =
             if_else(as.numeric(capitulo) %in% 1:5, as.roman(1),
                     if_else(as.numeric(capitulo) %in% 6:14, as.roman(2),
                     if_else(as.numeric(capitulo) == 15, as.roman(3),
                     if_else(as.numeric(capitulo) %in% 16:24, as.roman(4),
                     if_else(as.numeric(capitulo) %in% 25:27, as.roman(5),
                     if_else(as.numeric(capitulo) %in% 28:38, as.roman(6),
                     if_else(as.numeric(capitulo) %in% 39:40, as.roman(7),
                     if_else(as.numeric(capitulo) %in% 41:43, as.roman(8),
                     if_else(as.numeric(capitulo) %in% 44:46, as.roman(9),
                     if_else(as.numeric(capitulo) %in% 47:49, as.roman(10),
                     if_else(as.numeric(capitulo) %in% 50:63, as.roman(11),
                     if_else(as.numeric(capitulo) %in% 64:67, as.roman(12),
                     if_else(as.numeric(capitulo) %in% 68:70, as.roman(13),
                     if_else(as.numeric(capitulo) == 71, as.roman(14),
                     if_else(as.numeric(capitulo) %in% 72:83, as.roman(15),
                     if_else(as.numeric(capitulo) %in% 84:85, as.roman(16),
                     if_else(as.numeric(capitulo) %in% 86:89, as.roman(17),
                     if_else(as.numeric(capitulo) %in% 90:92, as.roman(18),
                     if_else(as.numeric(capitulo) == 93, as.roman(19),
                     if_else(as.numeric(capitulo) %in% 94:96, as.roman(20),
                     as.roman(21))
                     ))))))))))))))))))))
}

