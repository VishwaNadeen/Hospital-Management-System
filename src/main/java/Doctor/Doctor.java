package Doctor;

public class Doctor {
    private String id;
    private String first_name;
    private String last_name;
    private String dob;
    private String gender;
    private String specialization;
    private String qualification;
    private String experience_years;
    private String availability;
    private String status;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getFirstName() { return first_name; }
    public void setFirstName(String firstName) { this.first_name = firstName; }

    public String getLastName() { return last_name; }
    public void setLastName(String lastName) { this.last_name = lastName; }

    public String getDob() { return dob; }
    public void setDob(String dob) { this.dob = dob; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }

    public String getQualification() { return qualification; }
    public void setQualification(String qualification) { this.qualification = qualification; }

    public String getExperienceYears() { return experience_years; }
    public void setExperienceYears(String experience_years) { this.experience_years = experience_years; }

    public String getAvailability() { return availability; }
    public void setAvailability(String availability) { this.availability = availability; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
