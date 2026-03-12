package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.*;

public class UserDButil {
    
    public static boolean validate(String username, String password) throws Exception {
        boolean status = false;

        // JDBC Connection
        String url = "jdbc:mysql://localhost:3306/hospital";
        String dbUser = "root";
        String dbPassword = "Nadeen1795"; // Update if needed

        Class.forName("com.mysql.jdbc.Driver");
        
        Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql = "SELECT * FROM user WHERE username=? AND password=?";
        
        PreparedStatement ps = conn.prepareStatement(sql);
        
        ps.setString(1, username);
        ps.setString(2, password);
        
        ResultSet rs = ps.executeQuery();
        status = rs.next(); // if record exists

        conn.close();
        return status;
    }
}
