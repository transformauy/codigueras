# codigueras

Paquete que incluye funciones de lectura de las distintas codigueras disponibles:

### - Codiguera CIIU
Codiguera de ramas de actividad según Clasificación Industrial Internacional Uniforme Rev.4 (CIIU), en base al archivo de referencia del INE "Estructura CIIU4.pdf".
```
codiguera_ciiu()
```

### - Codiguera CIUO
Codiguera de ocupaciones, según archivo de referencia del INE "LISTADO NACIONAL DE DENOMINACIONES DE OCUPACIONES (CIUO).pdf"
```
codiguera_ciuo()
```

### - Codiguera NCM 
Codiguera de productos según Nomenclatura Común Mercosur, en base al archivo de referencia "NCM - anexo.pdf". Puede cargarse codiguera completa, o en los distintos formatos: wide/long.
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

### - Codiguera CNBCU-CIIUS: 
Codiguera, que incluye equivalencias entre códigos de actividad del BCU y Clasificación Industrial Internacional Uniforme Rev.3 y Rev.4. 
```
codiguera_cnbcu_ciius()
```


## Instalación
```
devtools::install_github('transformauy/codigueras')
library(codigueras)
```

## data-raw
Carpeta con funciones y archivos auxiliares para las codigueras.


## data
Carpeta con archivos .rda auxiliares para las codigueras, generados en data-raw.

## Objetos
Archivos disponibles en el paquete:
- clasif.uyxxi: Codiguera de grupos de productos de Uruguay XXI.
- ciiu: Codiguera CIIU INE.
- capitulos.productos: Capítulos de productos.
- secciones.productos: Secciones de productos.
- seccion: Secciones de actividad.
- division: Divisiones de actividad.
- seccion_division: Secciones de actividad con sus correspondientes divisiones.
- grupo: Grupos de actividad.
- clase: Clases de actividad.
- subclase: Subclases de actividad.
- listado_ocupaciones: Listado Nacional de Denominaciones de Ocupaciones (INE).
- NCM: Listado de productos Nomenclatura Común Mercosur.
- ncm_base: Codiguera completa NCM adaptada a Uruguay.
- ciiu4_ciiu3: Equivalencia entre Clasificación Industrial Internacional Uniforme Rev.3 y Rev.4.
- cnbcu_subclase: Codiguera completa BCU con descripción y equivalencia ciiu3.
- cnbcu_ciiu: Codiguera completa BCU con descripción y equivalencia ciiu3.
- cnbcu.seccion: Codiguera completa BCU desagregada por sección, con descripción.
- cnbcu.subseccion: Codiguera completa BCU desagregada por subsección, con descripción.
- cnbcu.completo: Codiguera completa BCU desagregada por código de actividad (cnbcu), con descripción.
