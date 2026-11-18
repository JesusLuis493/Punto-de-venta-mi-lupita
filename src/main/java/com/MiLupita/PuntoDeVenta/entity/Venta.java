package com.MiLupita.PuntoDeVenta.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "Ventas")
public class Venta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_Ventas")
    private Integer id;

    @Column(name = "Fecha")
    private LocalDateTime fecha;

    @Column(name = "Descuento")
    private Float descuento;

    @Column(name = "Total")
    private Float total;

    @Column(name = "Monto_resivido") // typo original de la BD, se respeta el nombre de columna
    private Float montoRecibido;

    // getters y setters
}