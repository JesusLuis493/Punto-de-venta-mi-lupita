package com.MiLupita.PuntoDeVenta.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "Deudores")
public class Deudor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_Deudores")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_Ventas", nullable = false)
    private Venta venta;

    @Column(name = "Nombre", length = 45)
    private String nombre;

    @Column(name = "Monto_pendiente")
    private Float montoPendiente;

    // getters y setters
}