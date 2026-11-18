package com.MiLupita.PuntoDeVenta.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "Productos")
public class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_Productos")
    private Integer id;

    @Column(name = "Nombre", length = 45)
    private String nombre;

    @Column(name = "Costo")
    private Float costo;

    @Column(name = "Stock")
    private Integer stock;

    @Column(name = "Precio_venta")
    private Float precioVenta;

    // getters y setters
}