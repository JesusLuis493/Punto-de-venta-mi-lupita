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
├── .github/
│   └── ant.yml      # Workflow
├── Base de datos/       
│   ├── DiagramaER_BD_0.2.png      
│   ├── PuntoDeVenta.mwr      
│   └── PuntoDeVenta.sql      
├── Imagenes/                   # Imagenes de las interfases
├── Scripts/                    
│   └── tests/                  # Unit tests y Suite de testing
│       ├── Unit_test.sh
│       └── Suite_testing.sh
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
**Ubicasion:** `src/negocio_mi/lupita/`
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
**Ubicasion:** `src/negocio_mi/lupita/`

**Responsabilidad:** Realizar de manera sencilla la manipulacion a la base de datos mediante elementos graficos.

**Componentes:**

### **Login.java**
- Validacion de usuario y contraseña mediante if/else
- Uso de Swing para el diseño
(Revisar la seccion de base de datos en el documento de notas tecnicas).

### **Conjunto de FrmInterfaz.java**
- FrmInterfazVentas.java
- FrmInterfazProductos.java
- FrmInterfazDeudores.java

**Caracteristicas:**
- Frontend enfocado al usuario final
- Creacion y modificasion de registros
- Visualizacion de contenido mediente tablas
- No interactua directamente con la BD
--- 

### 3️⃣Capa de BD
**Ubicasion:** `Base de datos/` 

**Responsabilidad:** Asegurar la replicabilidad de la BD

**Componentes**
###**BD**
- Diagreama E-R
[nueva propuesta de base de datos](https://github.com/JesusLuis493/Punto-de-venta-mi-lupita/blob/master/Imagenes/DiagramaER_BD_0.2.png)         
- PuntoDeVenta.mwb
- PuntoDeVenta.sql

**Caracteristicas**
- Puerto 3306

--- 

### 4️⃣Capa de tests
 
 **Ubicasion:** `Scripts/tests/`
 
 **Responsabilidad:** Verificar la funcionalidad de las consultas a la base de datos
 
 **Componentes:**
 ###**Unit_Tests.sh**
 - Cobertura del 75% para la BD
 - Validacion de CRUD basico 
 
 ###**Suite_Testing.sh**
 - Contador de tests validados
 
 **Caracteristicas**
  - Tets unitarios para cada tabla
 - Comprobaciones de funcionalidad
 - Simulacion de fallas
 - Logs
---

## 👨‍💻 Autor
Jesús Luis | 4to Semestre - Ingeniería en Sistemas

## 📝 Licencia
MIT License - Ver [LICENSE](LICENSE)
