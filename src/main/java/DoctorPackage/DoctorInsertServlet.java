package DoctorPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/DoctorInsertServlet")
public class DoctorInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoctorInsertServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String source = request.getParameter("source");
        boolean isAdminEmbed = "adminEmbed".equals(source);

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String id = request.getParameter("id");
        String uname = request.getParameter("uname");
        String pass = request.getParameter("psw");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String number = request.getParameter("number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String spe = request.getParameter("spe");
        String qua = request.getParameter("qua");
        String exp = request.getParameter("exp");
        String availability = request.getParameter("availability");
        String status = request.getParameter("status");

        // Validate phone number (must be exactly 10 digits)
        if (number == null || number.length() != 10 || !number.matches("\\d{10}")) {
            // If the number is either null or has invalid length or non-digit characters
            if (number != null && number.length() > 10) {
                request.setAttribute("errorMessage", "Phone number cannot be more than 10 digits.");
            } else {
                request.setAttribute("errorMessage", "Phone number must be exactly 10 digits.");
            }
            request.getRequestDispatcher(isAdminEmbed ? "AdminDoctorAdd.jsp" : "doctorInsert.jsp").forward(request, response);
            return;
        }

        // Validate date of birth (valid date format)
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        @SuppressWarnings("unused")
		Date dateOfBirth = null;
        try {
            dateOfBirth = dateFormat.parse(dob);
        } catch (ParseException e) {
            request.setAttribute("errorMessage", "Invalid date format for Date of Birth. Use yyyy-MM-dd.");
            request.getRequestDispatcher(isAdminEmbed ? "AdminDoctorAdd.jsp" : "doctorInsert.jsp").forward(request, response);
            return;
        }

        // Auto-set create and update dates to current date if not provided
        String create = request.getParameter("create");
        String update = request.getParameter("update");
        if (create == null || create.isEmpty()) {
            create = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        }
        if (update == null || update.isEmpty()) {
            update = create; // Set the same as create date initially
        }

        // Insert data into database
        boolean isTrue = DoctorDBUtil.insertDoctor(fname, lname, id, uname, pass, dob, gender, number, email, address, spe, qua, exp, availability, status, create, update);

        if (isTrue) {
            if (isAdminEmbed) {
                response.sendRedirect("AdminDoctorPanel.jsp");
            } else {
                response.sendRedirect("AdminDashboard.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Unable to add doctor. Please check the details and try again.");
            jakarta.servlet.RequestDispatcher dis2 = request.getRequestDispatcher(isAdminEmbed ? "AdminDoctorAdd.jsp" : "doctorInsert.jsp");
            dis2.forward(request, response);
        }
    }
}
