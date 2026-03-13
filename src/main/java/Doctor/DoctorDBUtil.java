package Doctor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DoctorDBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/hospital?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    static {
        try {
            // Support both MySQL Connector/J 8+ and legacy 5.x driver names.
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Class.forName("com.mysql.jdbc.Driver");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static List<Doctor> getAllDoctors() {
        List<Doctor> doctorsList = new ArrayList<>();

        String query = "SELECT * FROM doctor";
        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

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
        } catch (Exception e) {
            e.printStackTrace();
        }

        return doctorsList;
    }
}
