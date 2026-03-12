package HospitalPackage;

public class PatientModel {
	private String name;
	private String gender;
	private String id;
	private String age;
	private String date;
	private String email;
	private String phone;
	private String diseases;
	private String doctor;
	
	public PatientModel(String name, String gender, String id, String age, String date, String email, String phone,String diseases, String doctor) {
	
		this.name = name;
		this.gender = gender;
		this.id = id;
		this.age = age;
		this.date = date;
		this.email = email;
		this.phone = phone;
		this.diseases = diseases;
		this.doctor = doctor;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
	    this.email = email;
	
     }

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDiseases() {
		return diseases;
	}

	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}

	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}

	



	

}
