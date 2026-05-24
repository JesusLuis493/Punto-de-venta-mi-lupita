# Notas_Tecnicas

## 📋 Tabla de Contenidos
- [Funcionamiento del login](#-Funcionamiento-del-login)
- [Funcionamiento de la conexion mysql](#-Funcionamiento-de-la-conexion-mysql)
- [Funcionamiento del conjunto de interfasez](#-Funcionamiento-del-conjunto-de-interfasez)
- [Funcionamiento de la interfaz grafica de ventas](#-Funcionamiento-de-la-interfaz-grafica-de-ventas)

## Funcionamiento del login
El login esta compuesto de manera completamente aparte de la base de datos, esto implica que tanto el usuario/s como la contraseña/s estan expuestas directamente en el codigo del login, ubicado en el documento de `FrmLogin.java`.
```java
    private void Boton_EntradaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Boton_EntradaActionPerformed
    // Verificasion de usuario por medio de sus datos
        FrmInterfazVentas ventas=new FrmInterfazVentas();
        if (TFUsuario.getText().equals("Tu Usuario")&&TFContraseña.getText().equals("Tu Contraseña"))
        {
    // Cambio de ventanas
        ventas.setVisible(true);
        this.dispose();
        }
        else
        {
            TFError.setText("Error al iniciar sesion");
        }
```
---

## Funcionamiento de la conexion mysql
Para realizar la conexion de la base de datos en mysql a la interfaz de java primero se agrego el conector java a mysql descargado directamente de la pagina oficial de mysql, posterior a eso se crea el archivo `conexion.java` exportando las librerias ``java.sql.Connection`` y ``java.sql.DriverManager;`` para hacer uso de los metodos de coneccion ya existente, mientras que dentro del metodo principal se crea el metodo de coneccion indicando la ruta y los datos para la coneccion.
```java
try {
Class.forName("com.mysql.cj.jdbc.Driver");
conectar=DriverManager.getConnection("jdbc:mysql://localhost/mybd","root","tu Contraseña");
} catch (Exception e) {
System.out.println(e.getMessage());
}
```
--- 

## Funcionamiento del conjunto de interfasez
Con el fin de poder manejar la base de datos de una manera menos tecnica para el usuario final se hace uso de dos metodos principales, `Public DefaultTable Mostar` y `private void ButtonGuardarActionPerformed(java.awt.event.ActionEvent evt)`.

### Metodo mostrar
El metodo `mostar` hace uso de 2 strings arrays los cuales guardan el nombre y la cantidad de las columnas, segudo de un `try catch` el cual utiliza la sentencia sql `select * from tu tabla` para visualizar los datos y un bucle while para ordenar los datos pedidos dentro de la tabla ya propuesta en la interfaz, apoyandose de los arrays anteriores.

**Ejemplo practico**
```java
    public DefaultTableModel mostrarVentas(){
        String[] nombreColumnas={"id_venta","Producto","Cantidad","Precio","Descuento"};   //nombre de las tablas a visualizar
        String[] registros=new String[4];                         //numero de tablas a visualizar
        DefaultTableModel modelo=new DefaultTableModel(null,nombreColumnas);
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            Conexion_BD conect=new Conexion_BD();
            Connection con=conect.conectar();
            ps = con.prepareStatement("select * from ventas");    //sentencia para solisitar los datos a visualizar
            rs=ps.executeQuery();
            while(rs.next()){
            //tablas a visualizar
            registros[0]=rs.getString("Id_venta");
            registros[1]=rs.getString("Producto");
            registros[2]=rs.getString("Cantidad");
            registros[3]=rs.getString("Precio");
            registros[4]=rs.getString("Descuento");
            modelo.addRow(registros);
            Table_Ventas.setModel(modelo);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al conectar");
        }return modelo;
    }
```

### Metodo guardar
EL funcionamiento de guardado radica en el uso de un `try catch`, donde antes se confirma la conexion a la base de datos, una ve confirmada, dentro del try se hace uso de la variable ps (PreparedStatement) para la sentencia sql `insert into alumnos(clave,nombre,domicilio,telefono,correo_electronico,genero) values(?,?,?,?,?,?)` (por poner un ejemplo), seguido de sets strings para poder ingresar los vaores de su preferencia la tabla.
**Ejemplo practico**
```java
Conexion_BD conect=new Conexion_BD();
        Connection con=conect.conectar();
        try {
            ps = con.prepareStatement("insert into Deudores(id_Ventas,Nombre,Monto_pendiente) values(?,?,?)");  //sentencai sql 
            ps.setString(1, TFNumVenta.getText());
            ps.setString(2, TFDeudor.getText());
            ps.setString(3, TFDeuda.getText());
            ps.executeUpdate();                     //guardar los valores ingresados
            JOptionPane.showMessageDialog(null, "Deudor registrado con exito");   //mensaje de exito
            limpiar();                  //limpiar los text field
            con.close();                //concluye la operacion
        } catch (Exception e) {         //se activa en caso de fallas
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());   //imprime exactamente donde fallo la operacion
            System.out.println(e.getMessage());
        }
```

### Metodo limpiar
Para poder agilizar el registro de productos, dentro del funcionamiento de los metodos para guardar se incluye un metodo limpiar, el cual lo que hace es que, una vez capturados los datos para la base de datos, remplaza todos los datos de los text field a un espacio vacio, visto graficamente como " ".
**Ejemplo practico**
```java
    public void limpiar(){
    Proudcto_nombre.setText(" ");
    Costo.setText(" ");
    Stock.setText(" ");
    Precio_venta.setText(" ");
    }
```

### metodo elimianr
Con el fin de poder realizar una manipulacion eficiente de la base de datos, elmetodo elimnar funciona en base a un apartado espesifico en el cual se usa el id del regitro para eliminar, el boton eliminar esta unicamente cordinado con este apartado, a diferencia del metodo guardar que esta cordinado con casi todo los elementos de la tabla.
mediante el uso de la sentencia `delete` en mysql, se busca el valor ingresado en el apartado de eliminar para ver si hay una coinsidencia, en caso de averla, se elimina el registro.
**Ejemplo practico**
```java
    Conexion_BD conect=new Conexion_BD();
        Connection con=conect.conectar();
        try {
            ps = con.prepareStatement("delete from Productos where id_Productos=?");        //introduce el registro a eliminar
            ps.setInt(1, Integer.parseInt(Id.getText()));                                   //busca el resgistro a eliminar
            ps.executeUpdate();
                JOptionPane.showMessageDialog(null, "Producto eliminado con exito");
                limpiar();      //limpia los text field
            con.close();        //cierra la operacion
        } catch (Exception e) {     //en caso de aver un fallo
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());   //imprime exactamente donde fallo
            System.out.println(e.getMessage());
        }
```
---

## Funcionamiento de la interfaz grafica de ventas
Esta seccion aborda de la mejor manera posible el funcionamiento del archivo [FrmInterfazVentas](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/blob/master/src/negocio_mi/lupita/FrmInterfazVentas.java), esto devido a que en este archivo se maneja un caso particular de funcionamiento.

### Contexto
Con el fin de abstraer un poco la interfaz con el fin de facilitar el uso del usuario final se opto por unificar en una misma interfaz las tablas de `Ventas` y `Detalles_ventas`, de tal manera que se pudieran llenar los datos relevantes para ambas tablas y en la parte inferior visualizar un reporte de ventas conformado por la informacion de ambas tablas.
**consultar el documento [Estado_actual.md](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/blob/master/docs/Estado_actual%20.md) en la fecha `21 de mayo del 2026` dentro del apartado de `login/interfaz` para mayor informacion.
