package Pharmacist;

import java.sql.Connection;
import java.sql.DriverManager;

public class DCBConnect {
	
	private static String url = "jdbc:mysql://localhost:3306/hospital";
	private static String userName = "root";
	private static String password = "Nadeen1795";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, userName, password);
	}
		catch(Exception e) {
			System.out.println("Database Connection is Not Successful!");
		}
		return con;
  }
}