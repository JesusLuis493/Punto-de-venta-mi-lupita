# Notas_Tecnicas

- **Funcionamiento del login**
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
--- 

- **Funcionamiento del conjunto de interfasez**
Con el fin de poder manejar la base de datos de una manera menos tecnica para el usuario final se hace uso de dos metodos principales, `Public DefaultTable Mostar` y `private void ButtonGuardarActionPerformed(java.awt.event.ActionEvent evt)`.

El metodo `mostar` hace uso de 2 strings arrays los cuales guardan el nombre y la cantidad de las columnas, segudo de un `try catch` el cual utiliza la sentencia sql `select * from tu tabla` para visualizar los datos y un bucle while para ordenar los datos pedidos dentro de la tabla ya propuesta en la interfaz, apoyandose de los arrays anteriores.

**Ejemplo practico**
```java
    public DefaultTableModel mostrarVentas(){
        String[] nombreColumnas={"id_venta","Producto","Cantidad","Precio","Descuento"};
        String[] registros=new String[4];
        DefaultTableModel modelo=new DefaultTableModel(null,nombreColumnas);
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            Conexion_BD conect=new Conexion_BD();
            Connection con=conect.conectar();
            ps = con.prepareStatement("select * from ventas");    //sentencia para solisitar los datos a visualizar
            rs=ps.executeQuery();
            while(rs.next()){
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

EL funcionamiento de guardado radica en el uso de un `try catch`, donde antes se confirma la conexion a la base de datos, una ve confirmada, dentro del try se hace uso de la variable ps (PreparedStatement) para la sentencia sql `insert into alumnos(clave,nombre,domicilio,telefono,correo_electronico,genero) values(?,?,?,?,?,?)` (por poner un ejemplo), seguido de sets strings para poder ingresar los vaores de su preferencia la tabla.
**Ejemplo practico**
```java
        Conexion conect=new Conexion();
        Connection con=conect.conectar();
        try {
            ps = con.prepareStatement("insert into alumnos(clave,nombre,domicilio,telefono,correo_electronico,genero) values(?,?,?,?,?,?)");
            ps.setString(1, TxtClave.getText());
            ps.setString(2, TxtNombre.getText());
            ps.setString(3, TxtDomicilio.getText());
            ps.setString(4, TxtTelefono.getText());
            ps.setString(5, TxtCorreo.getText());
            ps.setString(6, ComboGnenero.getSelectedItem().toString());
            int res = ps.executeUpdate();
            if (res>0) {
                JOptionPane.showMessageDialog(null, "Alumno guardado con exito");
                limpiar();
            } else {
                JOptionPane.showMessageDialog(null, "Alumno no guardado con exito");
            }
            con.close();
        }
```
