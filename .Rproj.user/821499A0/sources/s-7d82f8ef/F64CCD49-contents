\name{codiguera_ciiu}
\alias{codiguera_ciiu}
\title{
Codiguera CIIU
%%  ~~function to do ... ~~
}
\description{
Función para cargar codiguera de CIIU Rev. 4.
}
\usage{
codiguera_ciiu(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
}
\details{
Función para cargar codiguera de CIIU Rev. 4.    Clasificación Industrial Internacional Uniforme.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Observatorio Productivo - Transforma Uruguay
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

## The function is currently defined as
function (x)
{
seccion \%>\%

    left_join(seccion_division, by = "seccion") \%>\%

    left_join(division, by = "division") \%>\%

    left_join(grupo \%>\% mutate(division = str_sub(grupo, 1, 2)), by = "division") \%>\%

    left_join(clase \%>\% mutate(grupo = str_sub(clase, 1, 3)), by = "grupo") \%>\%
    mutate(clase = case_when(is.na(clase) == TRUE ~ str_c(grupo, 0), TRUE ~ clase),
           desc_clase = case_when(is.na(desc_clase) == TRUE ~ desc_grupo, TRUE ~ desc_clase)) \%>\%

    left_join(subclase \%>\% mutate(clase = str_sub(subclase, 1, 4),
                                  grupo = str_sub(subclase, 1, 3)),
              by = c("clase", "grupo")) \%>\%
    mutate(subclase = case_when(is.na(subclase) == TRUE ~ str_c(clase, 0), TRUE ~ subclase),
           desc_subclase = case_when(is.na(desc_subclase) == TRUE ~ desc_clase, TRUE ~ desc_subclase)) \%>\%
    mutate(desc_clase = if_else(clase == "4631", "Comercio al por mayor de alimentos, bebidas y tabaco.",
                                desc_clase)) \%>\%

    union_all(cargar_ciiu_INE_anexo()) \%>\%
    unique
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
