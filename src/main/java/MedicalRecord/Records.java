package MedicalRecord;

public class Records {
	 private String nic;
	 private String age;
	 private String gender;
	 private String medicalHistory;
	 private String vitalSigns;
	 private String diagnosis;
	 private String treatmentPlan;
	 private String date;
	 
	public Records(String nic, String age, String gender, String medicalHistory, String vitalSigns, String diagnosis,
			String treatmentPlan, String date) {
		
		this.nic = nic;
		this.age = age;
		this.gender = gender;
		this.medicalHistory = medicalHistory;
		this.vitalSigns = vitalSigns;
		this.diagnosis = diagnosis;
		this.treatmentPlan = treatmentPlan;
		this.date = date;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMedicalHistory() {
		return medicalHistory;
	}

	public void setMedicalHistory(String medicalHistory) {
		this.medicalHistory = medicalHistory;
	}

	public String getVitalSigns() {
		return vitalSigns;
	}

	public void setVitalSigns(String vitalSigns) {
		this.vitalSigns = vitalSigns;
	}

	public String getDiagnosis() {
		return diagnosis;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

	public String getTreatmentPlan() {
		return treatmentPlan;
	}

	public void setTreatmentPlan(String treatmentPlan) {
		this.treatmentPlan = treatmentPlan;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
