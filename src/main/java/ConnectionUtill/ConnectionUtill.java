package ConnectionUtill;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtill {
    private static final String URL = "jdbc:mysql://localhost:3306/hospital";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    static {
        try {
            // MySQL Connector/J 8+ driver class
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getDBConnection() throws SQLException {
        // Return a fresh connection so callers can safely close it per request.
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
