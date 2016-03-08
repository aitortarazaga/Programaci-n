/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;


public class GenericoBD {
    private static Connection con;
    
    public static Connection abrirConexion(){
        con=null;
        try{
            Class.forName("oracle.jdbc.OracleDriver");
            
            String username="daw01";
            String passw="daw01";
            String url="jdbc:oracle:thin:@srvOracle:1521:orcl";
            
            con=DriverManager.getConnection(url, url, passw);
        }
        catch(ClassNotFoundException ex){
            JOptionPane.showMessageDialog(null, ex,"Error en la conexión a la BD" + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            con=null;
        }
        catch(SQLException ex){
            JOptionPane.showMessageDialog(null,ex,"Error en la conexión a la BD" + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            con=null;
        }
        return con;
    }
    
    public static Connection getConexion(){
        return con;
    }
    
    public static Connection cerrarConexion(){
        try{
            con.close();
        }
        catch(SQLException e){
            JOptionPane.showMessageDialog(null, e,"Error, " + e.getMessage(), JOptionPane.ERROR_MESSAGE);
            return con=null;
        }
        return con;
    }
}
