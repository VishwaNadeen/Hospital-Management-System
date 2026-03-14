package DoctorPackage;

import ConnectionUtill.ConnectionUtill;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DoctorDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static List<Doctor> validate(String nic){
		
		ArrayList<Doctor> doc = new ArrayList<>();
		
		//validate
		try {
			con = ConnectionUtill.getDBConnection();
			stmt = con.createStatement();
			
			String sql ="select * from doctor where id_no='"+nic+"'";
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String id = rs.getString(4);
				String uname = rs.getString(5);
				String pass = rs.getString(6);
				String dob = rs.getString(7);
				String gender = rs.getString(8);
				String number = rs.getString(9);
				String email = rs.getString(10);
				String address = rs.getString(11);
				String spe = rs.getString(12);
				String qua = rs.getString(13);
				String exp = rs.getString(14);
				String availability = rs.getString(15);
				String status = rs.getString(16);
				String create = rs.getString(17);
				String update = rs.getString(18);
				
				Doctor d = new Doctor(fname, lname, id, uname, pass, dob, gender, number, email, address, 
						spe, qua, exp, availability, status, create, update);
				doc.add(d);
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return doc;
	}
	
	//insert
	
	public static boolean insertDoctor(String fname, String lname, String id, String uname, String pass, String dob, String gender, String number, String email, 
			String address, String spe, String qua, String exp, String availability, String status, String create, String update) {
		
		boolean isSuccess = false;
		
		try {
			con = ConnectionUtill.getDBConnection();
			stmt = con.createStatement();
			
			String sql = "insert into doctor values (0, '"+fname+"', '"+lname+"', '"+id+"', '"+uname+"', '"+pass+"', '"+dob+"', '"+gender+"', '"+number+"', '"+email+"'"
					+ ", '"+address+"', '"+spe+"', '"+qua+"', '"+exp+"', '"+availability+"', '"+status+"', '"+create+"', '"+update+"' )";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//update
	
	public static boolean updateDoctor(String first_name, String last_name, String id_no, String user_name, String password, String dob, String gender, String phone, String email, 
			String address, String specialization, String qualification, String experience_years, String availability, String status, String created_at, String updated_at) {
		
		try {
			
			con = ConnectionUtill.getDBConnection();
			stmt = con.createStatement();
			
			String sql = "update doctor set first_name='"+first_name+"', last_name='"+last_name+"', username='"+user_name+"', password='"+password+"', dob='"+dob+"', gender='"+gender+"', "
					+ "phone='"+phone+"', email='"+email+"', address='"+address+"', specialization='"+specialization+"', qualification='"+qualification+"', experience_years='"+experience_years+"', "
							+ "availability='"+availability+"', status='"+status+"', updated_at='"+updated_at+"' where id_no='"+id_no+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			
			else {
				isSuccess = false;
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	//Retrieve
	public static List<Doctor> getDoctorDetails(String id_no){
		
		ArrayList<Doctor> doc  = new ArrayList<>();
		
		try {
			
			con = ConnectionUtill.getDBConnection();
			stmt = con.createStatement();
			
			String sql = "select * from doctor where id_no ='"+id_no+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String id = rs.getString(4);
				String uname = rs.getString(5);
				String pass = rs.getString(6);
				String dob = rs.getString(7);
				String gender = rs.getString(8);
				String number = rs.getString(9);
				String email = rs.getString(10);
				String address = rs.getString(11);
				String spe = rs.getString(12);
				String qua = rs.getString(13);
				String exp = rs.getString(14);
				String availability = rs.getString(15);
				String status = rs.getString(16);
				String create = rs.getString(17);
				String update = rs.getString(18);
				
				Doctor d = new Doctor(fname, lname, id, uname, pass, dob, gender, number, email, address, 
						spe, qua, exp, availability, status, create, update);
				
				doc.add(d);
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return doc;
	}
	
	//delete
	public static boolean deleteDoctor(String id_no) {
		
		try{
			
			con = ConnectionUtill.getDBConnection();
			stmt = con.createStatement();
			
			String sql = "delete from doctor where id_no = '"+id_no+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			
			else{
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	//getAll
	public static List<Doctor> getAllDoctor(){
		
		ArrayList <Doctor> docs = new ArrayList<>();
		
		try {
			con = ConnectionUtill.getDBConnection();
			stmt = con.createStatement();
			
			String sql = "select * from doctor";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String id = rs.getString(4);
				String uname = rs.getString(5);
				String pass = rs.getString(6);
				String dob = rs.getString(7);
				String gender = rs.getString(8);
				String number = rs.getString(9);
				String email = rs.getString(10);
				String address = rs.getString(11);
				String spe = rs.getString(12);
				String qua = rs.getString(13);
				String exp = rs.getString(14);
				String availability = rs.getString(15);
				String status = rs.getString(16);
				String create = rs.getString(17);
				String update = rs.getString(18);
				
				Doctor d = new Doctor(fname, lname, id, uname, pass, dob, gender, number, email, address, 
						spe, qua, exp, availability, status, create, update);
				
				docs.add(d);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return docs;
	}
	
	//get by id display 
	public static List<Doctor> getByID (String nic){
		
		ArrayList <Doctor> doc = new ArrayList<>();
		
		try {
			con = ConnectionUtill.getDBConnection();
			stmt = con.createStatement();
			
			String sql = "select * from doctor where id_no = '"+nic+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String id = rs.getString(4);
				String uname = rs.getString(5);
				String pass = rs.getString(6);
				String dob = rs.getString(7);
				String gender = rs.getString(8);
				String number = rs.getString(9);
				String email = rs.getString(10);
				String address = rs.getString(11);
				String spe = rs.getString(12);
				String qua = rs.getString(13);
				String exp = rs.getString(14);
				String availability = rs.getString(15);
				String status = rs.getString(16);
				String create = rs.getString(17);
				String update = rs.getString(18);
				
				Doctor d = new Doctor(fname, lname, id, uname, pass, dob, gender, number, email, address, 
						spe, qua, exp, availability, status, create, update);
				
				doc.add(d);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return doc;
	}
	
	//Update all
	
	public static boolean allUpdatedata(String first_name, String last_name, String id_no, String user_name, String password, String dob, String gender, String phone, String email, 
			String address, String specialization, String qualification, String experience_years, String availability, String status, String created_at, String updated_at) {
		
		try {
			con = ConnectionUtill.getDBConnection();
			stmt = con.createStatement();
			
			String sql = "update doctor set first_name='"+first_name+"', last_name='"+last_name+"', username='"+user_name+"', password='"+password+"', dob='"+dob+"', gender='"+gender+"', "
					+ "phone='"+phone+"', email='"+email+"', address='"+address+"', specialization='"+specialization+"', qualification='"+qualification+"', experience_years='"+experience_years+"', "
					+ "availability='"+availability+"', status='"+status+"', updated_at='"+updated_at+"' where id_no='"+id_no+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	//delete all
	public static boolean allDeleteDoctor(String id_no) {
		
		try{
			
			con = ConnectionUtill.getDBConnection();
			stmt = con.createStatement();
			
			String sql = "delete from doctor where id_no = '"+id_no+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			
			else{
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
}

