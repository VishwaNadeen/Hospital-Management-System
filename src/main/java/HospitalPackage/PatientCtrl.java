package HospitalPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PatientCtrl {
	public static List<PatientModel> validate(String id){
		ArrayList<PatientModel> patient = new ArrayList<>();
		
		//create database connection
		String url = "jdbc:mysql://localhost:3306/hospital?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
	   String user = "root";
	   String pass = "81576463";
	   
	   //validate
	   
	   try {
		   
		  Class.forName("com.mysql.cj.jdbc.Driver");
		  Connection con= DriverManager.getConnection(url, user, pass);
		  Statement stmt= con.createStatement();
		  
		  String sql= "select * from appoinment where id ='"+id+"'";
		  ResultSet rs = stmt.executeQuery(sql);
		  
		  if(rs.next()) {
			  String name = rs.getString("1");
              String gender = rs.getString("2");
              String pid = rs.getString("3");
              String age=rs.getString("4");
              String date = rs.getString("5");
              String email = rs.getString("6");
              String phone = rs.getString("7");
              String diseases = rs.getString("8");
              String doctor = rs.getString("9");
              
              PatientModel p= new PatientModel(name,gender,pid,age,date,email,phone,diseases,doctor);
              patient.add(p);
             
		  }
		  
	   }
	   catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	   return patient;
	}

	

    // Insert data method (correct)
    public static boolean insertdata( String name,String gender,String id,String age,String date, String email, String phone,String diseases,String doctor) {
        System.out.println("[DEBUG] Attempting to insert: " + id + ", " + name);
        
        try (Connection con = PDBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                 "INSERT INTO appoinment (name,gender,id,age,date,email,phone,diseases,doctor) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
            
            pstmt.setString(1, name);
            pstmt.setString(2, gender);
            pstmt.setString(3, id);
            pstmt.setString(4, age);
            pstmt.setString(5, date);
            pstmt.setString(6, email);
            pstmt.setString(7, phone);
            pstmt.setString(8, diseases);
            pstmt.setString(9, doctor);

            int rows = pstmt.executeUpdate();
            System.out.println("[DEBUG] Rows affected: " + rows);
            return rows > 0;

        } catch (SQLException e) {
            System.err.println("[SQL ERROR] Code: " + e.getErrorCode() + ", State: " + e.getSQLState());
            e.printStackTrace();
            return false;
        }
    }

    

    //  getById method
    public static List<PatientModel> getById(String id) { // Renamed parameter to avoid conflict
       ArrayList<PatientModel> patient = new ArrayList<>();
        
        // Use try-with-resources for auto-closing
        try (Connection con = PDBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement("SELECT * FROM appoinment WHERE id = ?")) { // Fixed SQL syntax
            
            pstmt.setString(1, id); // Use placeholder to prevent SQL injection
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    // Extract data from ResultSet
                    String name = rs.getString("name");
                    String gender = rs.getString("gender");
                    String pid = rs.getString("id");
                    String age=rs.getString("age");
                    String date = rs.getString("date");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String diseases = rs.getString("diseases");
                    String doctor = rs.getString("doctor");
                    
                    // Create PatientModel and add to list
                    patient.add(new PatientModel(name,gender,pid,age,date,email,phone,diseases,doctor));
                }
            }
            
        } catch (SQLException e) { // Catch specific exception
            System.err.println("[SQL ERROR] " + e.getMessage());
            e.printStackTrace();
        }
        
        return patient;
    }
    //Get all data
    public static List<PatientModel>getAllPatient(){
    	  ArrayList<PatientModel> patients = new ArrayList<>();
    	  try (Connection con = PDBConnection.getConnection();
    	             PreparedStatement pstmt = con.prepareStatement("SELECT * FROM appoinment ")) { // Fixed SQL syntax
    	            
    	            //pstmt.setString(1, targetId); // Use placeholder to prevent SQL injection
    	            
    	            try (ResultSet rs = pstmt.executeQuery()) {
    	                while (rs.next()) {
    	                    // Extract data from ResultSet
    	                	 String name = rs.getString("1");
    	                     String gender = rs.getString("2");
    	                     String id = rs.getString("3");
    	                     String age=rs.getString("4");
    	                     String date = rs.getString("5");
    	                     String email = rs.getString("6");
    	                     String phone = rs.getString("7");
    	                     String diseases = rs.getString("8");
    	                     String doctor = rs.getString("9");
    	                    
    	                    
    	                    // Create PatientModel and add to list
    	                    patients.add(new PatientModel(name,gender,id,age,date,email,phone,diseases,doctor));
    	                }
    	            }
    	            
    	        } catch (SQLException e) { // Catch specific exception
    	            System.out.println("[SQL ERROR] " + e.getMessage());
    	            e.printStackTrace();
    	        }
    	        
    	        return patients;
    }
    //Update data
    public static boolean Updatedata( String name,String gender,String id,String age,String date, String email, String phone,String diseases,String doctor) {
        try (Connection con = PDBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                 "UPDATE appoinment SET name=?, gender=?, age=?,date=?,email=?,phone=?,diseases=?,doctor=? WHERE id=?")) {
            //parameter order
        	pstmt.setString(1, name);
            pstmt.setString(2, gender);
            pstmt.setString(3, age);
            pstmt.setString(4, date);
            pstmt.setString(5, email);
            pstmt.setString(6, phone);
            pstmt.setString(7, diseases);
            pstmt.setString(8, doctor);
            pstmt.setString(9, id);

            return pstmt.executeUpdate() > 0;
            
            
        }
        catch (SQLException e) {
            System.err.println("Update Error: " + e.getMessage());
            return false;
        }
      }
        public static List<PatientModel> getById1(String id) {
            List<PatientModel> patients = new ArrayList<>();

            try(Connection con = PDBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM appoinment WHERE id = ?")){
              
               
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                   
                	String name = rs.getString("1");
                    String gender = rs.getString("gender");
                    String pid = rs.getString("id");
                    String age=rs.getString("age");
                    String date = rs.getString("date");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String diseases = rs.getString("diseases");
                    String doctor = rs.getString("doctor");
                    
                    patients.add(new PatientModel(name,gender,pid,age,date,email,phone,diseases,doctor));
                   
                }
                

            } catch (Exception e) {
                e.printStackTrace();
            }

            return patients;
        
      
    
    }
    //Delete data
    
    public static boolean deletedata(String id) { // Remove unused parameters
        try (Connection con = PDBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(
                 "DELETE FROM appoinment WHERE id=?")) { // Use placeholder
            
            pstmt.setString(1, id); // Safely bind the `id` parameter

            return pstmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.err.println("Delete Error: " + e.getMessage()); // Correct error message
            return false;
        }
    }
 }
