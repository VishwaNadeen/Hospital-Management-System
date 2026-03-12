package Order;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static String url = "jdbc:mysql://localhost:3306/hospital";
    private static String user = "root";
    private static String pass = "Nadeen1795";

    public static Connection getConnection() throws Exception {
    	
        Class.forName("com.mysql.jdbc.Driver");
        
        return DriverManager.getConnection(url, user, pass);
    }
}
