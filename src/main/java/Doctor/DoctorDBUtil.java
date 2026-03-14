package Doctor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

            // Handle minor schema differences across environments (e.g., id vs id_no).
            Set<String> availableColumns = new HashSet<>();
            ResultSetMetaData metaData = rs.getMetaData();
            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                availableColumns.add(metaData.getColumnLabel(i).toLowerCase());
            }

            while (rs.next()) {
                Doctor doctor = new Doctor();
                doctor.setId(getColumnValue(rs, availableColumns, "id", "id_no"));
                doctor.setFirstName(getColumnValue(rs, availableColumns, "first_name"));
                doctor.setLastName(getColumnValue(rs, availableColumns, "last_name"));
                doctor.setDob(getColumnValue(rs, availableColumns, "dob"));
                doctor.setGender(getColumnValue(rs, availableColumns, "gender"));
                doctor.setSpecialization(getColumnValue(rs, availableColumns, "specialization"));
                doctor.setQualification(getColumnValue(rs, availableColumns, "qualification"));
                doctor.setExperienceYears(getColumnValue(rs, availableColumns, "experience_years"));
                doctor.setAvailability(getColumnValue(rs, availableColumns, "availability"));
                doctor.setStatus(getColumnValue(rs, availableColumns, "status"));

                doctorsList.add(doctor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return doctorsList;
    }

    private static String getColumnValue(ResultSet rs, Set<String> availableColumns, String... candidates)
            throws SQLException {
        for (String candidate : candidates) {
            if (availableColumns.contains(candidate.toLowerCase())) {
                return rs.getString(candidate);
            }
        }
        return null;
    }
}
