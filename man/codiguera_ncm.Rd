\name{codiguera_ncm}
\alias{codiguera_ncm}
\title{
Codiguera NCM
}
\description{
Codiguera de productos según Nomenclatura Común Mercosur. En formato wide, cada observación corresponde a un producto según código ncm a 8 dígitos, con su correspondiente descripción y desagregado por cada subgrupo previo (a 7, 6, 5 y 4 dígitos respectivamente). La codiguera en formato long, puede filtrarse por variable (seccion, capitulo, ncm_4, ncm_5, ncm_6, ncm_7 y ncm_8) para obtener la codiguera según la desagregación deseada.
}
\usage{
codiguera_ncm()
codiguera_ncm_wide()
codiguera_ncm_long()
}

\author{
Observatorio Productivo - Transforma Uruguay
}
\examples{

## The function is currently defined as
function ()
{
ncm_base \%>\%
    filter(variable == 'ncm_8') \%>\%
    transmute(ncm_8 = codigo, desc.ncm_8 = descripcion) \%>\%
    mutate(ncm_7 = str_sub(ncm_8, 1, 7)) \%>\%

    left_join(ncm_base \%>\%
                filter(variable == 'ncm_7') \%>\%
                transmute(ncm_7 = codigo, desc.ncm_7 = descripcion),
              by = 'ncm_7') \%>\%
    mutate(ncm_6 = str_sub(ncm_7, 1, 6)) \%>\%

    left_join(ncm_base \%>\%
                filter(variable == 'ncm_6') \%>\%
                transmute(ncm_6 = codigo, desc.ncm_6 = descripcion),
              by = 'ncm_6') \%>\%
    mutate(ncm_5 = str_sub(ncm_6, 1, 5)) \%>\%

    left_join(ncm_base \%>\%
                filter(variable == 'ncm_5') \%>\%
                transmute(ncm_5 = codigo, desc.ncm_5 = descripcion),
              by = 'ncm_5') \%>\%
    mutate(ncm_4 = str_sub(ncm_5, 1, 4)) \%>\%

    left_join(ncm_base \%>\%
                filter(variable == 'ncm_4') \%>\%
                transmute(ncm_4 = codigo, desc.ncm_4 = descripcion),
              by = 'ncm_4') \%>\%
    mutate(capitulo = str_sub(ncm_4, 1, 2)) \%>\%

    left_join(ncm_base \%>\%
                filter(variable == 'capitulo') \%>\%
                transmute(capitulo = codigo, desc.cap = descripcion),
              by = 'capitulo') \%>\%
    asigna.seccion() \%>\%
    mutate(seccion = as.character(seccion)) \%>\%

    left_join(ncm_base \%>\%
                filter(variable == 'seccion') \%>\%
                transmute(seccion = codigo, desc.secc = descripcion),
              by = 'seccion') \%>\%
    transmute(seccion, desc.secc, capitulo, desc.cap, ncm_4, desc.ncm_4, ncm_5,
              desc.ncm_5, ncm_6, desc.ncm_6, ncm_7, desc.ncm_7, ncm_8, desc.ncm_8)
  }
}
