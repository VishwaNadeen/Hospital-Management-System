package DoctorPackage;

import java.sql.Connection;
import java.sql.SQLException;

public class TestConnection {
	
	public static void main(String[] args) {
        try {
            // Test database connection
            Connection con = DBConnect.getConnection();
            System.out.println(" Connection Successful: " + con);
            con.close(); // Always close connection
            
        } catch (SQLException e) {
            System.err.println("Connection Failed:");
            e.printStackTrace();
        }
    }
}
