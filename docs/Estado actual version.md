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
---

- **Funcionamiento de la conexion mysql**
Para realizar la conexion de la base de datos en mysql a la interfaz de java primero se agrego el conector java a mysql descargado directamente de la pagina oficial de mysql, posterior a eso se crea el archivo `conexion.java` exportando las librerias ``java.sql.Connection`` y ``java.sql.DriverManager;`` para hacer uso de los metodos de coneccion ya existente, mientras que dentro del metodo principal se crea el metodo de coneccion indicando la ruta y los datos para la coneccion.
```java
try {
Class.forName("com.mysql.cj.jdbc.Driver");
conectar=DriverManager.getConnection("jdbc:mysql://localhost/mybd","root","tu Contraseña");
} catch (Exception e) {
System.out.println(e.getMessage());
}
```

## Login/Interfaz
- 19 de mayo del 2026
Se llevo acabo una refactorizacion en el backend del login
**Descripcion:** Durante las labores de estructuracion de planteo conectar el login directamente a la base de datos para guardar ususarios y contraseñas, devido a complicasiones entre la concepsion de la base de datos y el la estructura en java se opto por guardar usuarios y contraseñas de manera local dentro del mismo login.

**Advertencia: Esta medida vuelve realmete inseguro el login al poder accesar a dichos datos mediante la carpeta de src, en caso de hacer fork tomaarlo en cuenta**
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
