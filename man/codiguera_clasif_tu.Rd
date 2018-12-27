\name{codiguera_clasif_tu}
\alias{codiguera_clasif_tu}

\title{
Codiguera Clasificación Transforma Uruguay
}
\description{
Función para cargar codiguera de clasificación de grupos de productos Transforma Uruguay.
}
\usage{
codiguera_clasif_tu()
}
\details{
Función para cargar codiguera de clasificación de grupos de productos Transforma Uruguay.    A partir de codiguera de clasificación de productos de Uruguay XXI y secciones de acuerdo a "NCM - anexo.pdf".
}
\author{
Observatorio Productivo - Transforma Uruguay
}

\examples{

## The function is currently defined as
function ()
{
   clasif.uyxxi() \%>\%
    full_join(NCM \%>\%
                asigna.seccion() \%>\%
                left_join(secciones.productos,
                          by = "seccion"),
              by = c("ncm_4", "capitulo")) \%>\%
    left_join(capitulos.productos \%>\%
                asigna.seccion() \%>\%
                left_join(secciones.productos,
                          by = "seccion"),
              by = c("capitulo", "seccion", "descripcion.seccion")) \%>\%
    asigna.clasif_tu() \%>\%
    transmute(seccion, capitulo, ncm_4, ncm_6, clasif.tu)
}
}
