# Notas_Tecnicas

## Base de datos
- 19 de mayo del 2026
Durante la creacion de las interfasez para el usuario se encontro una fuerte incongruencia segun1 el plan de la base de datos, se propone la idea de refactorizar el esuqema de la base de datos y crear una vase de datos nueva, adaptada a las nesesidades del cliente.

### Propuesta de refactorizacion
- [ ] Tabla ventas
- Producto [varchar(45)]
- cantidad [int]
- Precio   [float]
- Descuento[float]

- [ ] Tabla Inventario
- Producto [varchar(45)]
- cantidad [int]
- Precio   [float]

- [ ] Tabla Deudores
- Nombre [varchar(45)]
- cantidad [int]

- [ ] Tabla reporte
- Producto [varchar(45)]
- cantidad [int]
- Precio   [float]

## Login/Interfaz
- 19 de mayo del 2026
Se llevo acabo una refactorizacion en el backend del login
**Descripcion:** Durante las labores de estructuracion de planteo conectar el login directamente a la base de datos para guardar ususarios y contraseñas, devido a complicasiones entre la concepsion de la base de datos y el la estructura en java se opto por guardar usuarios y contraseñas de manera local dentro del mismo login.

**Advertencia: Esta medida vuelve realmete inseguro el login al poder accesar a dichos datos mediante la carpeta de src, en caso de hacer fork tomaarlo en cuenta**
