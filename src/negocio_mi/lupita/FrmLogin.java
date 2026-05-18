/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package negocio_mi.lupita;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

public class FrmLogin extends javax.swing.JFrame {
    
    public static final String URL = "jdbc:mysql://localhost/usuarios";
    public static final String UserName = "root";
    public static final String Password = "Luis1302.";
    PreparedStatement ps;
    ResultSet rs;
    
    public static Connection getConnection(){
    Connection con=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=(Connection)DriverManager.getConnection(URL,UserName,Password);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }return con;
    }
    
    private static final java.util.logging.Logger logger = java.util.logging.Logger.getLogger(FrmLogin.class.getName());

    /**
     * Creates new form FrmLogin
     */
    public FrmLogin() {
        initComponents();
        this.setLocationRelativeTo(null);
        this.setFocusable(true);
    }

    public void validadAdmin(){
    int resultado =0;
    Connection con = getConnection();
        try {
            String ususario=TFNombre.getText();
            String password= String.valueOf(TFContraseña.getPassword());
            String sql = "select * from admins where usuario='"+ususario+"' and password'"+password+"'";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
            
            if (rs.next()) {
                resultado=1;
                if (resultado==1) {
                    FrmInterfazVentas form = new FrmInterfazVentas();
                    form.setVisible(true);
                    this.dispose();
                }
            } else {
                JOptionPane.showMessageDialog(null, "Error de autenticasion de usuario/contraseña");
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al conectar a la base de datos");
        }
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        imagen = new javax.swing.JLabel();
        BotonEntrada = new javax.swing.JButton();
        TFNombre = new javax.swing.JTextField();
        TFContraseña = new javax.swing.JPasswordField();
        Backgound = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        imagen.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/user_icon_120x120.png"))); // NOI18N
        getContentPane().add(imagen, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 50, -1, -1));

        BotonEntrada.setText("Entar");
        getContentPane().add(BotonEntrada, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 350, 160, 50));

        TFNombre.setBackground(new java.awt.Color(204, 204, 255));
        TFNombre.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TFNombreKeyPressed(evt);
            }
        });
        getContentPane().add(TFNombre, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 210, 270, 50));

        TFContraseña.setBackground(new java.awt.Color(204, 204, 255));
        getContentPane().add(TFContraseña, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 280, 270, 50));

        Backgound.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/simple-background-wallpaper-preview.jpg"))); // NOI18N
        getContentPane().add(Backgound, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 6, 730, 460));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void BotonAccesoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BotonAccesoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_BotonAccesoActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ReflectiveOperationException | javax.swing.UnsupportedLookAndFeelException ex) {
            logger.log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(() -> new FrmLogin().setVisible(true));
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Backgound;
    private javax.swing.JButton BotonEntrada;
    private javax.swing.JPasswordField TFContraseña;
    private javax.swing.JTextField TFNombre;
    private javax.swing.JLabel imagen;
    // End of variables declaration//GEN-END:variables
}
