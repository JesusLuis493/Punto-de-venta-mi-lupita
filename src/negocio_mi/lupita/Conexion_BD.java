/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package negocio_mi.lupita;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author jesus-luis
 */
public class Conexion_BD {
    Connection conectar = null;
    public Connection conectar(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conectar=DriverManager.getConnection("jdbc:mysql://localhost/ConexionJava","root","Luis1302.");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }return conectar;
    }
}
