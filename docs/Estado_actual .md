# Estado actual
**version :** beta.
**fecha :** 19 de mayo del 2026.
Este documento redacta el estado actual del pryecto `Punto de venta mi lupita`, detallando las funciones implemetadas, cobertura de errores y el estado actual de la documentacion tecnica.

## 📋 Tabla de Contenidos
- [Base de datos](#-Base-de-datos)
- [Login/Interfaz](#-Login/Interfaz)
- [Documentacion relacionada](#-Documentacion-relacionada)
--- 

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
--- 

- 21 de mayo del 2026
Se agregaron secciones de llenado para las diferentes inrfazes del punto de venta, `ventas`, `inventario`, `deudores`, esto con el fin de mantener las tablas de las interfazes **unicamnente para visualizar informacion**, dichas interfazes ya estan dotadas con votones para eliminar y guardar los registros sin nesesidad de tocar el backend dorectamente.
Adicionalmente se elimino la interfaz de reportes, devido a que su funcion era solo visualizar las ventas realizadas, de manera que se muestren los datos claves de la venta, se opto por eliminar el archivo de interfaz e integrarlo dentro de la interfaz de ventas, esto con el fin de optimizar proseso de gestion.
![Imagen de la nueva interfaz](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/blob/master/Imagenes/Interfaz%20de%20usuario%20_ventas.png)

- **Advertencia: aun no se a trabajado en las solisitudes de la interfaz a la base de datos para visualizar los datos deseados**
- **Advertencia: aun no se a trabajado en las conexiones a la nueva base de datos**
--- 

- 23 de mayo del 2026
Se realizo una correccion importante para el correcto funcinamiento del boton de eliminar dentro de las interfases de usuario, se llevo acabo la adicion de un `text field` el cual estara encargado de pedir el id del registro que se desea eliminar.
Dentro del codigo del boton de eliminar se corrigio la sentencia dentro del try catch para cordinar el input del text field con los campos de la base de datos.
```java
        try {
            ps = con.prepareStatement("delete from Productos where id_Deudores=?");
            ps.setInt(1, Integer.parseInt(Id.getText()));
            int res = ps.executeUpdate();
```
--- 

- 24 de mayo del 2026
**Ubicasion :** Interfaz de usuario ventas
Se sustitulle el `try` dentro de el metodo de guardado de `FrmInterfazVentas` devido a omision de las instrucciones con `ps1`, ejecutando solo la sentencai sql inicial y por consecuente llando solo la tabla de ventas.
**Codigo original***
```java
ps = con.prepareStatement("insert into Ventas(Fecha,Descuento,Monto_resivido) values(?,?,?)");
            ps.setString(1, TFFecha_venta.getText());
            ps.setString(2, TFDescuento.getText());
            ps.setString(3, TFMontoResivido.getText());
            
            //se ignora completamente la segunda instruccion de ps1
ps1 = con.prepareStatement("insert into Detalles_venta(id_Productos,Cantidad,Precio_uitario,Subtotal) values(?,?,?,?)");
            ps1.setString(1, TFProducto.getText());
            ps1.setString(2, TFCantidad.getText());
            ps1.setString(3, TFPrecioProducto.getText());
            ps1.setString(4, TFSubtotal.getText());
```
**cambio de sentencia**
```java
//Codigo hidrido base ia
            Conexion_BD conect = new Conexion_BD();
            Connection con = conect.conectar();

            // Inicia transacción
            con.setAutoCommit(false);

            // 1INSERT en Ventas
            ps = con.prepareStatement(
                "INSERT INTO Ventas(Fecha, Descuento, Monto_resivido) VALUES(?, ?, ?)",
                Statement.RETURN_GENERATED_KEYS  // ← Obtiene el ID generado
            );
            ps.setString(1, TFFecha_venta.getText());
            ps.setDouble(2, Double.parseDouble(TFDescuento.getText()));
            ps.setDouble(3, Double.parseDouble(TFMontoResivido.getText()));
            ps.executeUpdate();

            // 2️Obtener el ID de la venta insertada
            rs = ps.getGeneratedKeys();
            int idVenta = 0;
            if (rs.next()) {
                idVenta = rs.getInt(1);
            }

            // 3️INSERT en Detalles_venta CON el ID de venta
            ps1 = con.prepareStatement(
                "INSERT INTO Detalles_venta(id_Venta, id_Productos, Cantidad, Precio_unitario, Subtotal) VALUES(?, ?, ?, ?, ?)"
            );
            ps1.setInt(1, idVenta);  // ← ID de la venta recién insertada
            ps1.setInt(2, Integer.parseInt(TFProducto.getText()));
            ps1.setInt(3, Integer.parseInt(TFCantidad.getText()));
            ps1.setDouble(4, Double.parseDouble(TFPrecioProducto.getText()));
            ps1.setDouble(5, Double.parseDouble(TFSubtotal.getText()));
            ps1.executeUpdate();

            // 4️Confirma todo
            con.commit();
            JOptionPane.showMessageDialog(null, "Venta registrada correctamente");

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
            System.out.println(e.getMessage());
        }
```
**Advertencia: este cambio no asegura aun el correcto funcionamiento de la interfaz, aun se sigue testeando la funcionalidad para que cuadre con la base de datos**

--- 

## Documentacion relacionada

Actualmente se cuenta con los archivos de:
- [Notas_Tecnicas](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/blob/master/docs/Notas_Tecnicas.md) Explica el funcionamiento de codigo
- [Arquitectura.md](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/blob/master/docs/Arquitectura.md): muestra la composision del proyecto de menra general
- [Estado_actual.md](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/blob/master/docs/Estado_actual%20.md): este documento, redacta errores y observaciones
- [Imagenes](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/tree/master/Imagenes): Contiene material grafico como el diseño de las interfazes y los diagrams de la base de datos)
