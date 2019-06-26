
package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexaoDB {
    String servidor="localhost";
    String nomeBanco="DocManager";
    String login="root";
    String senha="1048576";
    
    public Connection conectar(){
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            return DriverManager.getConnection("jdbc:mysql://"+servidor+"/"+nomeBanco,login,senha);
        } catch (SQLException ex) {
           System.out.println("Erro de conexão com banco de dados! -->"+ex);
        }
        return null;
    }    
    
    public void inserirQuery(String query){
        System.out.println(query);
        try {
            PreparedStatement stmt;
            stmt = conectar().prepareStatement(query);
            stmt.execute();
            
        } catch (SQLException ex) {
 
            System.out.println("Erro de Script SQL na Insersão");
            
            Logger.getLogger(ConexaoDB.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }
    
    public ResultSet buscarQuery(String query){
        System.out.println(query);
        try {
            PreparedStatement stmt;
            stmt = conectar().prepareStatement(query);
            ResultSet rs;
            rs = stmt.executeQuery();

            return rs;
        } catch (SQLException ex) {
            System.out.println("Erro de Script SQL na Busca");
            Logger.getLogger(ConexaoDB.class.getName()).log(Level.SEVERE, null, ex);
        }  
        return null;
    }
}