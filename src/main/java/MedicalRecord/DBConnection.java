package MedicalRecord;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static String url ="jdbc:mysql://localhost:3306/hospital";
	private static String user="root";
	private static String password="Nadeen1795";
	
	public static Connection con;
	
	public static Connection getConnection() {
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		
		con = DriverManager.getConnection(url, user, password);
		}
		catch(Exception e) {
			System.out.println("Database Connetion is not Success ");
		}
		
		return con;
		
	}
}
