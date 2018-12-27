# codigueras

Paquete que incluye funciones de lectura de las distintas codigueras disponibles:

### - Codiguera CIIU
Codiguera de ramas de actividad Clasificación Industrial Internacional Uniforme Rev.4 (CIIU), según archivo de referencia del INE "Estructura CIIU4.pdf".
```
codiguera_ciiu()
```

### - Codiguera CIUO
Codiguera de ocupaciones, según archivo de referencia del INE "LISTADO NACIONAL DE DENOMINACIONES DE OCUPACIONES (CIUO).pdf"
```
codiguera_ciuo()
```

### - Codiguera NCM 
Codiguera de productos de Nomenclatura Común Mercosur, según archivo de referencia "NCM - anexo.pdf". Puede cargarse codiguera completa, o en los distintos formatos: wide/long.
```
codiguera_ncm()
codiguera_ncm_wide()
codiguera_ncm_long()
```

### - Codiguera clasif_tu: 
Codiguera interna grupos de productos Transforma Uruguay, según clasificación de Uruguay XXI y secciones de productos NCM.
```
codiguera_clasif_tu()
```


## Instalación
```
devtools::install_github('vburguete/codigueras')
library(codigueras)
```

## data-raw
Carpeta con funciones y archivos auxiliares para las codigueras.


## data
Carpeta con archivos .rda auxiliares para las codigueras, generados en data-raw.

## Objetos
Archivos disponibles en el paquete:
- clasif.uyxxi: codiguera de grupos de productos de Uruguay XXI
- ciiu: Codiguera CIIU INE
- capitulos.productos: Capítulos de productos
- secciones.productos: Secciones de productos
- seccion: Secciones de actividad
- division: Divisiones de actividad
- seccion_division: Secciones de actividad con sus correspondientes divisiones
- grupo: Grupos de actividad
- clase: Clases de actividad
- subclase: Subclases de actividad
- listado_ocupaciones: Listado NAcional de Denominaciones de Ocupaciones (INE)
- NCM: Listado de productos Nomenclatura Común Mercosur
- ncm_base: Codiguera completa NCM adaptado a Uruguay.
