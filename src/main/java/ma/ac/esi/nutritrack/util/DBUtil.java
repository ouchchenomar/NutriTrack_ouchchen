package ma.ac.esi.nutritrack.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBUtil {

    private static final String URL = "jdbc:mysql://localhost:3306/nutriwise";
    private static final String USER = "root";
    private static final String PASSWORD = "Gt-@&!19500";

    public static Connection getConnection() {
        try {
            
            
            return DriverManager.getConnection(URL, USER, PASSWORD);
      
           
       
        } catch (SQLException e) {
            System.err.println("Erreur lors de la connexion à la base de données !");
            e.printStackTrace();
        }
        return null;
    }

    
}