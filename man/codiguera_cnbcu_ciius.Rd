\name{codiguera_cnbcu_ciiius}
\alias{codiguera_cnbcu_ciiius}
\title{
Codiguera CNBCU - CIIUS
}
\description{
Función para cargar codiguera de CNBCU - CIIU.
}
\usage{
codiguera_cnbcu_ciius(x)
}
\arguments{
  \item{x}{
}
}
\details{
Tabla de equivalencias entre códigos de actividad del BCU y Clasificación Industrial Internacional Uniforme Rev.3 y Rev.4.
}
\author{
Observatorio Productivo - Transforma Uruguay
}
\examples{
## The function is currently defined as
function (x)
{
ciiu\%>\%
    mutate(ciiu4 = str_sub(ciiu, 1, 4))\%>\%
    group_by(ciiu4)\%>\%
    dplyr::summarize()\%>\%
    left_join(ciiu4_ciiu3)\%>\%
    left_join(cnbcu_subclase)\%>\%
    select(-denominacion.cnbcu)\%>\%
    group_by(ciiu4)\%>\%
    dplyr::summarize(ciiu3 = first(ciiu3),
                     cnbcu = first(cnbcu))\%>\%        # ciiu4 no se repite
    filter(is.na(ciiu3) != TRUE)\%>\%
    filter(is.na(cnbcu) != TRUE)
  }
}

