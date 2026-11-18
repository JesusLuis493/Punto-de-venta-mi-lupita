package com.MiLupita.PuntoDeVenta.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "Detalles_venta")
public class DetalleVenta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_Detalles")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_Ventas", nullable = false)
    private Venta venta;

    @ManyToOne
    @JoinColumn(name = "id_Productos", nullable = false)
    private Producto producto;

    @Column(name = "Cantidad")
    private Integer cantidad;

    @Column(name = "Precio_unitario")
    private Float precioUnitario;

    @Column(name = "Subtotal")
    private Float subtotal;

    // getters y setters
}