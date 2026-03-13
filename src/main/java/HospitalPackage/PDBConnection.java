package HospitalPackage;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class PDBConnection {
    // Updated connection parameters
    private static final String url = "jdbc:mysql://localhost:3306/hospital?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String user = "root";
    private static final String pass = "root";

    public static Connection getConnection() throws SQLException {
        try {
            // Load MySQL Driver (for JDBC 8.0+)
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found!", e);
        }
        return DriverManager.getConnection(url, user, pass);
    }
}
