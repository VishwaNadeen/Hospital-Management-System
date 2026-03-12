package Pharmacist;

public class Pharmacist {
	
	private String item_id; 
	private String item_name; 
	private String item_type;  
	private String quantity_in_stock;
	private String unit_price; 
	private String supplier_name; 
	private String date_received;
	private String status; 
	private String exp_date ;
	private String description;
	
	public Pharmacist(String item_id, String item_name, String item_type, String quantity_in_stock, String unit_price,
			String supplier_name, String date_received, String status, String exp_date, String description) {
		
		this.item_id = item_id;
		this.item_name = item_name;
		this.item_type = item_type;
		this.quantity_in_stock = quantity_in_stock;
		this.unit_price = unit_price;
		this.supplier_name = supplier_name;
		this.date_received = date_received;
		this.status = status;
		this.exp_date = exp_date;
		this.description = description;
	}
	public String getItem_id() {
		return item_id;
	}
	
	public String getItem_name() {
		return item_name;
	}
	
	public String getItem_type() {
		return item_type;
	}
	
	public String getQuantity_in_stock() {
		return quantity_in_stock;
	}
	
	public String getUnit_price() {
		return unit_price;
	}
	
	public String getSupplier_name() {
		return supplier_name;
	}
	
	public String getDate_received() {
		return date_received;
	}
	
	public String getStatus() {
		return status;
	}
	
	public String getExp_date() {
		return exp_date;
	}
	public String getDescription() {
		return description;
	}
	
	


}
