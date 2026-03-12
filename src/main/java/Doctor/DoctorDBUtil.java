package Doctor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import ConnectionUtill.ConnectionUtill;

public class DoctorDBUtil {
    public static List<Doctor> getAllDoctors() {
        List<Doctor> doctorsList = new ArrayList<>();

        try {
            Connection con = ConnectionUtill.getDBConnection();
            String query = "SELECT * FROM doctor";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setId(rs.getString("id"));
                doctor.setFirstName(rs.getString("first_name"));
                doctor.setLastName(rs.getString("last_name"));
                doctor.setDob(rs.getString("dob"));
                doctor.setGender(rs.getString("gender"));
                doctor.setSpecialization(rs.getString("specialization"));
                doctor.setQualification(rs.getString("qualification"));
                doctor.setExperienceYears(rs.getString("experience_years"));
                doctor.setAvailability(rs.getString("availability"));
                doctor.setStatus(rs.getString("status"));

                doctorsList.add(doctor);
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return doctorsList;
    }
}
