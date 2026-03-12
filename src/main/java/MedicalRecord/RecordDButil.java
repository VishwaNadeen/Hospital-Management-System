package MedicalRecord;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RecordDButil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	//validate
	 public static List<Records> validate ( String nicID){
		
		ArrayList<Records> rec = new ArrayList<>();
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql="select * from records where nic='"+nicID+"'";
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				String id = rs.getString(2);
				String age = rs.getString(3);
				String gender = rs.getString(4);
				String medicalHistory = rs.getString(5);
				String vitalSigns = rs.getString(6);
				String diagnosis = rs.getString(7);
				String treatmentPlan = rs.getString(8);
				String date = rs.getString(9);
				
				Records R = new Records(id,age,gender,medicalHistory,vitalSigns,diagnosis,treatmentPlan,date);
				rec.add(R);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return rec;
		
	} 
		//insert Part
	public static boolean insertRecordDetails(String nic, String age,String gender,String medicalHistory,String vitalSigns,
			String diagnosis,String treatmentPlan, String date) {
		
		boolean isSuccess= false;
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql ="insert into records values (0,'"+nic+"' ,'"+age+"','"+gender+"','"+medicalHistory+"','"+vitalSigns+"',"
					+ "'"+diagnosis+"','"+treatmentPlan+"', '"+date+"')";
			
			int rs =stmt.executeUpdate(sql);
			
			if(rs>0) {
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
	
	//Update part
	public static boolean updateRecord(String nic, String age,String gender,String medicalHistory,String vitalSigns,
			String diagnosis,String treatmentPlan, String date){
		
		boolean isSuccess= false;
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "update records set age='"+age+"', gender='"+gender+"', medicalHistory='"+medicalHistory+"', vitalSigns='"+vitalSigns+"',diagnosis='"+diagnosis+"', "
					+ "treatmentPlan='"+treatmentPlan+"', date='"+date+"' where nic='"+nic+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess =false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	//Retrieve 
	public static List<Records> getRecordDetails(String nic){
		
		ArrayList<Records> rec = new ArrayList<>();
		
		try {
			
			con = DBConnection.getConnection() ;
			stmt = con.createStatement();
			
			String spl = "select * from records where nic='"+nic+"'";
			
			rs = stmt.executeQuery(spl);
			
			while(rs.next()) {
				
				String id = rs.getString(2);
				String age = rs.getString(3);
				String gender = rs.getString(4);
				String medicalHistory = rs.getString(5);
				String vitalSigns = rs.getString(6);
				String diagnosis = rs.getString(7);
				String treatmentPlan = rs.getString(8);
				String date = rs.getString(9);
				
				Records r = new Records(id, age, gender, medicalHistory, vitalSigns, diagnosis, treatmentPlan, date);
				
				rec.add(r);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return rec;
	}
	
	//Delete
	public static boolean deleteRecord(String nic) {
		
		boolean isSuccess = false;
		
		try {
			
			con = DBConnection.getConnection() ;
			stmt = con.createStatement();
			
			String sql = "delete from records where nic ='"+nic+"'";
			
			int r =stmt.executeUpdate(sql);
			
			if(r > 0) {
				isSuccess = true;
			}
			else {
				isSuccess=false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
}