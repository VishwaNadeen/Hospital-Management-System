package DoctorPackage;

public class Doctor {
	private String first_name;
	private String last_name;
	private String id_no;
	private String username;
	private String password;
	private String dob;
	private String gender;
	private String phone;
	private String email;
	private String address;
	private String specialization;
	private String qualification;
	private String experience_years;
	private String availability;
	private String status;
	private String created_at;
	private String updated_at;
	
	public Doctor(String first_name, String last_name, String id_no, String username, String password, String dob,
			String gender, String phone, String email, String address, String specialization, String qualification,
			String experience_years, String availability, String status, String created_at, String updated_at) {
		
		this.first_name = first_name;
		this.last_name = last_name;
		this.id_no = id_no;
		this.username = username;
		this.password = password;
		this.dob = dob;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.specialization = specialization;
		this.qualification = qualification;
		this.experience_years = experience_years;
		this.availability = availability;
		this.status = status;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getId_no() {
		return id_no;
	}

	public void setId_no(String id_no) {
		this.id_no = id_no;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getExperience_years() {
		return experience_years;
	}

	public void setExperience_years(String experience_years) {
		this.experience_years = experience_years;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
	
	
}
