# Arquitectura de punto de venta

## Vision general
Crear un punto de venta adaptado 100% a las nesesidades del usuario final, cumpliendo con los siguientes criterios.
-  [ ] Buena docuemntacion
-  [ ] Producto final facil de usar
-  [ ] Aplicar los conceptos vistos en la materia de 'Introduccion a bases de datos'
-  [ ] Aplicar los conceptos vistos en la materia de 'Topicos avanzados de programacion'

---

## Estructura de carpetas
'''
└── README.md                           # Incerte aqui estructura
'''

---

## Capas de arquitectura
### Capa de negocios (core)
**Ubicasion:** Incerte aqui la ubicasion.
**Responsabilidad:** Llevar acabo las conexiones entre la base de datos y la interfaz grafica de usuario (capa CLI).
**Componentes**

**Conexion.java**
**Proposito:** Ser el puente entre la base de datos y la interfaz por medio del conector java a sql.

**Configuracion basica de interfaz**
**Proposito:** Esta configuracion base establese lo nesesario para saltar entre pestañas dentro del punto de venta y prosesar solisitudes a la base de datos. (visualizacion, eliminacion, agregar).

---

### Capa de presentacion
**Ubicasion:** Incerte aqui la ubicasion.
**Responsabilidad:** Poder realizar de manera sensilla la manipulacion a la base de datos mediante elementos graficos.
**Componentes**

**Login.java**
**Proposito:** Brindar un acceso seguro al cliente a la base de datos para su uso. (Revisar la seccion de base de datos en el documento de notas tecnicas).

**FrmInterfazVentas.java**
**Proposito:** Proposrcionar facilidad para visualizar y actualizar la tabla de ventas desde un entorno grafico simple e intuitivo.

**FrmInterfazProductos.java**
**Proposito:** Proposrcionar facilidad para visualizar y actualizar la tabla de inventario desde un entorno grafico simple e intuitivo.

**FrmInterfazReportes.java**
**Proposito:** Proposrcionar facilidad para visualizar y actualizar la tabla de Reporte desde un entorno grafico simple e intuitivo.

**FrmInterfazDeudores.java**
**Proposito:** Proposrcionar facilidad para visualizar y actualizar la tabla de Deudores desde un entorno grafico simple e intuitivo.

--- 

### Capa de base de datos
**Ubicasion:** Incerte aqui la ubicasion.
**Responsabilidad:** Guarda y permitir manipular los datos referentes al negocio de manera segura.
**Componentes**

**base de datos**
**Proposito:** mantener seguros los datos incertados dentro de esta y permitir su manipulacion mediante la interfaz grafica.
