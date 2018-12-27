\name{codiguera_ciuo}
\alias{codiguera_ciuo}
\title{
Codiguera CIUO
}
\description{
Función para cargar codiguera de CIUO.
}
\usage{
codiguera_ciuo()
}
\author{
Observatorio Productivo - Transforma Uruguay
}
\examples{

## The function is currently defined as
function ()
{
    path \%>\%
        read_excel(skip = 1, col_names = TRUE) \%>\% rename_at(1:4,
        ~c("denominacion_ocupaciones", "cnuo_95", "descripcion",
            "ciuo")) \%>\% transmute(ciuo, descripcion) \%>\% mutate(descripcion = case_when(ciuo ==
        "1412" ~ "Gerentes de restaurantes", ciuo == "1431" ~
        "Gerentes de centros deportivos, de esparcimiento y culturales",
        TRUE ~ descripcion)) \%>\% unique
  }
}
