# Arquitectura de punto de venta

## Vision general
Crear un punto de venta adaptado 100% a las nesesidades del usuario final, cumpliendo con los siguientes criterios.
-  [ ] Buena docuemntacion
-  [ ] Producto final facil de usar
-  [ ] Aplicar los conceptos vistos en la materia de 'Introduccion a bases de datos'
-  [ ] Aplicar los conceptos vistos en la materia de 'Topicos avanzados de programacion'

---

## Estructura de carpetas
```
Punto-de-venta-mi-lupita
├── Base de datos/
│   ├── PuntoDeVenta.mwr      # Diagrama ER de la base de datos
│   └── PuntoDeVenta.sql      # Script de la base de datos
├── Imagenes/                   # Imagenes de las interfases
├── docs/                      # Documentacion aserca del proyecto
│   ├── BD Diagrama.png
│   ├── Arquitectura.md
│   ├── Estado_actual.md
│   └── Notas_tecnicas.md
├── nbprojects/
│   ├── private/
│   ├── build-impl.xml
│   ├── genfiles.properties
│   ├── prpject.properties
│   └── project.xml
├── src/
│   ├── iamgenes/              # Imagenes utilizadas para el login
│   └── negocio_mi/lupita/     # Archivos funcionales
│       ├── Conexion.java
│       ├── FrmInterfazVentas.java
│       ├── FrmInterfazProductos.java
│       ├── FrmInterfazDeudores.java
│       └── FrmLogin.java
├── .gitignore
├── LICENSE
├── README.md
├── build.xml
└── manifest.mf
```

---

## Capas de arquitectura
### 1️⃣Capa de negocios (core)
**Ubicasion:** src/
**Responsabilidad:** Llevar acabo las conexiones entre la base de datos y la interfaz grafica de usuario (capa CLI).
**Componentes**

**Conexion.java**
```java
public class Conexion_BD {
    Connection conectar = null;
    public Connection conectar(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conectar=DriverManager.getConnection("jdbc:mysql://localhost/mybd","root","******");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }return conectar;
    }
}
```
**Proposito:** Ser el puente entre la base de datos y la interfaz por medio del conector java a sql.

**Configuracion basica de interfaz**
```java
    private void jMenu1MouseClicked(java.awt.event.MouseEvent evt) {                                    
        FrmInterfazVentas ventas = new FrmInterfazVentas();
        ventas.setVisible(true);
        this.dispose();
    }                                   

    private void jMenu2MouseClicked(java.awt.event.MouseEvent evt) {                                    
        FrmInterfazProductos productos = new FrmInterfazProductos();
        productos.setVisible(true);
        this.dispose();
    }                                   

    private void jMenu6MouseClicked(java.awt.event.MouseEvent evt) {                                    
        FrmInterfazDeudores deudores = new FrmInterfazDeudores();
        deudores.setVisible(true);
        this.dispose();
    }                                   

    private void jMenu5MouseClicked(java.awt.event.MouseEvent evt) {                                    
        FrmInterfazReporte reporte = new FrmInterfazReporte();
        reporte.setVisible(true);
        this.dispose();
    } 
```
**Proposito:** Esta configuracion base establese lo nesesario para saltar entre pestañas dentro del punto de venta y prosesar solisitudes a la base de datos. (visualizacion, eliminacion, agregar).

---

### 2️⃣Capa de presentacion
**Ubicasion:** src/
**Responsabilidad:** Poder realizar de manera sensilla la manipulacion a la base de datos mediante elementos graficos.
**Componentes**

**Login.java**
**Proposito:** Brindar un acceso seguro al cliente a la base de datos para su uso. (Revisar la seccion de base de datos en el documento de notas tecnicas).

**FrmInterfazVentas.java**
![Imagen de la nueva interfaz](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/blob/master/Imagenes/Interfaz%20de%20usuario%20_ventas.png)
**Proposito:** Proposrcionar facilidad para visualizar y actualizar la tabla de ventas desde un entorno grafico simple e intuitivo.

**FrmInterfazProductos.java**
**Proposito:** Proposrcionar facilidad para visualizar y actualizar la tabla de inventario desde un entorno grafico simple e intuitivo.

**FrmInterfazReportes.java**
**Proposito:** Proposrcionar facilidad para visualizar y actualizar la tabla de Reporte desde un entorno grafico simple e intuitivo.

**FrmInterfazDeudores.java**
**Proposito:** Proposrcionar facilidad para visualizar y actualizar la tabla de Deudores desde un entorno grafico simple e intuitivo.

--- 

### 3️⃣Capa de base de datos
**Ubicasion:** Incerte aqui la ubicasion.
**Responsabilidad:** Guarda y permitir manipular los datos referentes al negocio de manera segura.
**Componentes**

**base de datos**
[nueva propuesta de base de datos](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/blob/master/Imagenes/DiagramaER_BD_0.2.png)         
**Proposito:** mantener seguros los datos incertados dentro de esta y permitir su manipulacion mediante la interfaz grafica.
--- 

## 👨‍💻 Autor
Jesús Luis | 4to Semestre - Ingeniería en Sistemas

## 📝 Licencia
MIT License - Ver [LICENSE](LICENSE)
