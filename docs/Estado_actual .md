# Estado actual
**version:** beta 
**fecha** 19 de mayo del 2026

Este documento redacta el estado actual del pryecto `Punto de venta mi lupita`, detallando las funciones implemetadas, cobertura de errores y el estado actual de la documentacion tecnica.
--- 

### Logica

## Base de datos
- 19 de mayo del 2026
Durante la creacion de las interfasez para el usuario se encontro una fuerte incongruencia segun1 el plan de la base de datos, se propone la idea de refactorizar el esuqema de la base de datos y crear una vase de datos nueva, adaptada a las nesesidades del cliente.

### Propuesta de refactorizacion
- [ ] Tabla ventas
```
- Producto [varchar(45)]
- cantidad [int]
- Precio   [float]
- Descuento[float]
```
- [ ] Tabla Inventario
```
- Producto [varchar(45)]
- cantidad [int]
- Precio   [float]
```
- [ ] Tabla Deudores
```
- Nombre [varchar(45)]
- cantidad [int]
```
- [ ] Tabla reporte
```
- Producto [varchar(45)]
- cantidad [int]
- Precio   [float]
```

- 21 de mayo del 2026
Se rechazo la propuesta anterior de BD devido a una redundancia entre tablas y la falta de claves primarias y foraneas, en su lugar se creo una [nueva propuesta de base de datos](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/blob/master/Imagenes/DiagramaER_BD_0.2.png), la cual consta de 4 tablas en lugar de las 6 originales, [Consultar diagrama anterior](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/blob/master/Imagenes/DiagramaER_BD_0.1.png)
Devido a la refactorizacion de la base de datos, se devio modificar las interfazes para hacer que el nuevo esquema funcionara, el resultado desemboco en la adicion de una sona para incertar datos.
--- 

## Login/Interfaz
- 19 de mayo del 2026
Se llevo acabo una refactorizacion en el backend del login
**Descripcion:** Durante las labores de estructuracion de planteo conectar el login directamente a la base de datos para guardar ususarios y contraseñas, devido a complicasiones entre la concepsion de la base de datos y el la estructura en java se opto por guardar usuarios y contraseñas de manera local dentro del mismo login.

**Advertencia: Esta medida vuelve realmete inseguro el login al poder accesar a dichos datos mediante la carpeta de src, en caso de hacer fork tomaarlo en cuenta**

- 21 de mayo del 2026
Se agregaron secciones de llenado para las diferentes inrfazes del punto de venta, `ventas`, `inventario`, `deudores`, esto con el fin de mantener las tablas de las interfazes **unicamnente para visualizar informacion**, dichas interfazes ya estan dotadas con votones para eliminar y guardar los registros sin nesesidad de tocar el backend dorectamente.
Adicionalmente se elimino la interfaz de reportes, devido a que su funcion era solo visualizar las ventas realizadas, de manera que se muestren los datos claves de la venta, se opto por eliminar el archivo de interfaz e integrarlo dentro de la interfaz de ventas, esto con el fin de optimizar proseso de gestion.
![Imagen de la nueva interfaz](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/blob/master/Imagenes/Interfaz%20de%20usuario%20_ventas.png)

**Advertencia: aun no se a trabajado en las solisitudes de la interfaz a la base de datos para visualizar los datos deseados**
**Advertencia: aun no se a trabajado en las conexiones a la nueva base de datos**
--- 

### Errores

La version `beta` presenta un error de capa 8 (error humano) devido a que la base de datos propuesta inicialmente no posee las caracteristicas nesesaria para encajar con los para metros que propone la interfaz de usuario en java, se propone una nueva distirbucion para la base de datos.
A grandes rasgos la propuesta original es un tanto mas compleja para el usuario final de lo que deveria de ser, la nueva propuesta abstrae las funciones de la base utilizando el enfoque KISS.
--- 

### Documentacion

Actualmente se cuenta con los archivos de:
- `Notas Tecnicas.md` (Explica el funcionamiento de codigo)
- `Arquitectura de punto de venta.md` (muestra la composision del proyecto a mayor escala)
- `Estado actual.md` (este documento, redacta errores y observaciones)
- `imagenes` (Contiene material grafico como el diseño de las interfazes y los diagrams de la base de datos)
