package Pharmacist;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PharmacistDBUtill {
	
		private static Boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
	
		public static List<Pharmacist> validate(String item_id){
			
			ArrayList<Pharmacist> pha = new ArrayList<>();
			
			
			try {
				
				con = DCBConnect.getConnection();
				stmt = con.createStatement();
			
				String sql = "select * from Pharmacist where item_id = '"+item_id+"'"; 
				rs = stmt.executeQuery(sql);
				if(rs.next() ) {
					
					String itemId = rs.getString(2);
					String item_name = rs.getString(3);
					String item_type  = rs.getString(4);
					String quantity_in_stock = rs.getString(5);
					String unit_price = rs.getString(6);
					String supplier_name = rs.getString(7);
					String date_received = rs.getString(8);
					String status = rs.getString(9);
					String exp_date = rs.getString(10);
					String description = rs.getString(11);
					
					Pharmacist p = new Pharmacist(itemId, item_name, item_type, quantity_in_stock, unit_price, supplier_name, 
							date_received, status, exp_date, description);
					pha.add(p);
				}
			}
			catch (Exception e){
				e.printStackTrace();
			}
			return pha;
			
		}
		
		//Insert
		
		public static boolean insertpharmacist(String Itemid,String name, String type, String qnty, String price, String sname, String rdate, 
				String exp, String status,  String description) {
			
			boolean isSuccess = false;
			
			try {
				
				con = DCBConnect.getConnection(); 
				stmt = con.createStatement(); 
				
				String sql = "insert into pharmacist values(0, '"+Itemid+"','"+name+"','"+type+"','"+qnty+"','"+price+"','"+sname+"',"
						+ "'"+rdate+"','"+exp+"','"+status+"','"+description+"')";
				
				int rs = stmt.executeUpdate(sql);
				
				if(rs > 0) {
					isSuccess = true;
				} else {
					isSuccess =false;
				}
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			return isSuccess;
			
			}
		
		//update
		public static boolean UpdatePharmacist(String id, String name, String type, String stock, String price,
				String sname, String rdate, String status, String exp, String description) {
		
		try {
				con = DCBConnect.getConnection();
				stmt = con.createStatement();
				
				String sql = "update pharmacist set item_name = '"+name+"',item_type = '"+type+"',quantity_in_stock = '"+stock+"',"
						+ "unit_price = '"+price+"',supplier_name = '"+sname+"',date_received = '"+rdate+"',status ='"+status+"',"
						+ "exp_date = '"+exp+"',description = '"+description+"'"
						+ "where item_id = '"+id+"'";
				
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
		
		//Re
		public static List<Pharmacist>getPharmacistDetails(String id){
			
			ArrayList<Pharmacist> pha = new ArrayList<>();
			
			try {
				
				con = DCBConnect.getConnection();
				stmt = con.createStatement();
				
				String sql = "select * from pharmacist where item_id = '"+id+"'";
				rs = stmt.executeQuery(sql);
				
				
				while (rs.next()) {
					String Id = rs.getString(2);
					String name = rs.getString(3);
					String type = rs.getString(4);
					String stock = rs.getString(5);
					String price = rs.getString(6);
					String sname = rs.getString(7);
					String rdate = rs.getString(8);
					String exp = rs.getString(9);
					String status = rs.getString(10);
					String description = rs.getString(11);
					
					Pharmacist p = new Pharmacist(Id,name,type,stock,price,sname,rdate,exp,status,description);
					pha.add(p);
					
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return pha;
			
		}

		//Delete
    public static boolean deletePharmacist(String id) {
	
    	isSuccess = false;
	try {
		con = DCBConnect.getConnection();
		stmt = con.createStatement();
		
		String sql = "delete from pharmacist where item_id ='"+id+"'";
		int r = stmt.executeUpdate(sql);
		
		if(r > 0) {
			isSuccess = true;
			
		}
		else {
			isSuccess = false;
		}
	
	}
			catch (Exception e)	{
			e.printStackTrace();
			}
	
	return isSuccess;
	}
    
    //GetById
    public static List<Pharmacist> getById(String id){
		 
		 ArrayList<Pharmacist> phas = new ArrayList<>();
		 
			try {
				
				con = DCBConnect.getConnection();
				stmt = con.createStatement();
				
				String sql = "select * from pharmacist where item_id '"+id+"'";
				
				rs = stmt.executeQuery(sql);
				
				
				while (rs.next()) {
					String item_id = rs.getString(2);
					String name = rs.getString(3);
					String type = rs.getString(4);
					String stock = rs.getString(5);
					String price = rs.getString(6);
					String sname = rs.getString(7);
					String rdate = rs.getString(8);
					String exp = rs.getString(9);
					String status = rs.getString(10);
					String description = rs.getString(11);
					
					Pharmacist p = new Pharmacist(item_id,name,type,stock,price,sname,rdate,exp,status,description);
					
					phas.add(p);
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return phas;
		
	 }

	//GetAll Data
		 public static List<Pharmacist> getALLPharmacist(){
			 
			 ArrayList<Pharmacist> phas = new ArrayList<>();
			 

				try {
					
					con = DCBConnect.getConnection();
					stmt = con.createStatement();
					
					String sql = "select * from pharmacist";
					
					rs = stmt.executeQuery(sql);
					
					
					while (rs.next()) {
						String item_id = rs.getString(2);
						String name = rs.getString(3);
						String type = rs.getString(4);
						String stock = rs.getString(5);
						String price = rs.getString(6);
						String sname = rs.getString(7);
						String rdate = rs.getString(8);
						String exp = rs.getString(9);
						String status = rs.getString(10);
						String description = rs.getString(11);
						
						Pharmacist p = new Pharmacist(item_id,name,type,stock,price,sname,rdate,exp,status,description);
						phas.add(p);
						
					}
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				
				return phas;
		 }
		 
		 //updateAll
		 public static boolean UpdateAll(String id, String name, String type, String stock, String price,
					String sname, String rdate, String status, String exp, String description) {
			
			try {
					con = DCBConnect.getConnection();
					stmt = con.createStatement();
					
					String sql = "update pharmacist set item_name = '"+name+"',item_type = '"+type+"',quantity_in_stock = '"+stock+"',"
							+ "unit_price = '"+price+"',supplier_name = '"+sname+"',date_received = '"+rdate+"',status ='"+status+"',"
							+ "exp_date = '"+exp+"',description = '"+description+"'"
							+ "where item_id = '"+id+"'";
					
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
		 
		    public static boolean deleteAll(String id) {
		    	
		    	isSuccess = false;
		    	
			try {
				
				con = DCBConnect.getConnection();
				stmt = con.createStatement();
				
				String sql = "delete from pharmacist where item_id ='"+id+"'";
				
				int r = stmt.executeUpdate(sql);
				
				if(r > 0) {
					isSuccess = true;
					
				}
				else {
					isSuccess = false;
				}
			
			}
					catch (Exception e)	{
					e.printStackTrace();
					}
			
			return isSuccess;
			}	 
		 
}
