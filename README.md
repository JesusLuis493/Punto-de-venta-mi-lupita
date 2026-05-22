# Proyecto final: punto de venta funcinal
![Java](https://img.shields.io/badge/Java-17.0.18-ED8B00?style=flat&logo=openjdk&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8.0+-blue?style=flat&logo=mysql&logoColor=white)
![Apache NetBeans](https://img.shields.io/badge/NetBeans-Apache%20NetBeans-1B6AC6?style=flat&logo=apache-netbeans&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-E95420?style=flat&logo=ubuntu&logoColor=white)
![Git](https://img.shields.io/badge/Git-GitHub-181717?style=flat&logo=github&logoColor=white)
![CI/CD](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-2088FF?style=flat&logo=github-actions&logoColor=white)         
Punto de venta basico desarrollado desde 0, basado en las nesesidades reales de los negocios de la zona con el fin de facilitar
la gestion y administracion interga del negocio

## 📋 Tabla de Contenidos
- [Características](#-Características)
- [Tecnologías utilizadas](#-Tecnologías-utilizadas)
- [Estructura del proyecto](#-Estructura-del-proyecto)

## ⚙️ Características

- **Documentacion :** Cobertura de notas tecnicas, estado actual y arquitectura de este proyecto. [Consultar aqui](Docs)
- **Llenado y visualizacion :** se agrega un apartado para llevar acabo el llenado de las tablas, mientras qu en la parte inferior se encuentra una tabla la cual muestra los datos guardados de dicha tabla de la base de datos.
- **Registro de deudores :** Implementacion de un registro unico de deudores basado en numero de venta y montos a dever.
- **interfas user-friendly :** Se pretende mantener la interfas adaptada al cliente final para facilitar su uso.
- **Funcionalidad :** base de datos optimizada lo mas posible para no desperdiciar recursos, priorizando el enfoque KISS.
## 🧰 Tecnologías utilizadas

- **Lenguaje de Programación**: Java
- **Framework**: openjdk 17.0.18
- **Entorno de Desarrollo**: Apache NetBeans en Ubuntu Linux (base Debian)
- **Control de Versiones**: Git
- **CI/CD**: GitHub Actions (workflow básico para compilación y pruebas)
- **Base de datos**: Mysql

## 📋 Resumen: Stack Final

Código:         Java / openjdk 17.0.18                                  
Base de datos:  ASP.NET Core + Swagger                                                             
Tests:          suite_testing.sh                               
CI/CD:          GitHub Actions                                          

## 📂 Estructura del proyecto
```
Punto-de-venta-mi-lupita
├── docs/                      # Documentacion aserca del proyecto
│   ├── BD Diagrama.png
│   ├── Arquitectura.md
│   ├── Estado_actual.md
│   └── Notas_tecnicas.md
├── Imagenes/
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
