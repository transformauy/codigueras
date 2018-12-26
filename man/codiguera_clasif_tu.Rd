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
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
