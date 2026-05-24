# Configuración de Base de Datos

## Requisitos
- MySQL 8.0 o superior

## Instalación

### Opción 1: Desde terminal
```bash
mysql -u root -p < schema.sql
```

### Opción 2: Desde MySQL Workbench
1. Abre MySQL Workbench
2. File → Open SQL Script
3. Selecciona `schema.sql`
4. Ejecuta (Ctrl + Shift + Enter)

## Estructura
- **Productos**: Inventario y precios
- **Ventas**: Registro de transacciones
- **Deudores**: Clientes con deuda pendiente
- **Usuarios**: Credenciales de acceso

## Conexión desde Java
Ver `src/negocio_mi_lupita/Conexion.java`
