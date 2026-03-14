package HospitalPackage;

import java.io.IOException;
import java.time.LocalDate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    
        LocalDate today = LocalDate.now();

        HttpSession session = request.getSession();
        System.out.println("[DEBUG] Received POST request");

        try {
            // [1. Parameter Retrieval and Validation]
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String id = request.getParameter("id");
            String age = request.getParameter("age");
            String date = request.getParameter("date");
        	LocalDate selectedDate = LocalDate.parse(date);
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String diseases = request.getParameter("diseases");
            String doctor = request.getParameter("doctor");

            // [2. Input Validation]
            if (id == null || id.trim().isEmpty()) {
                throw new IllegalArgumentException("ID cannot be empty");
            }
            if (name == null || name.trim().isEmpty() ||
                gender == null || gender.trim().isEmpty() ||
                age == null || age.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                phone == null || phone.trim().isEmpty() ||
                diseases == null || diseases.trim().isEmpty()) {
                throw new IllegalArgumentException("All required fields must be filled");
            }
            if (phone.length() != 10 || !phone.matches("^0[0-9]{9}$")) {
                throw new IllegalArgumentException("Invalid phone number format");
                
            }
            if (!email.matches("^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
                throw new IllegalArgumentException("Invalid email format");
            }
            if (selectedDate.isBefore(today)) {
                request.getSession().setAttribute("error", "Date cannot be in the past!");
                response.sendRedirect("your-form-page.jsp");
                return;
            }
            

            // [3. Database Insertion]
            boolean success = PatientCtrl.insertdata(
                name, gender, id, age, date, email, phone, diseases, doctor
            );

            if (success) {
            	session.setAttribute("success", "Appointment booked successfully!");
            	response.sendRedirect("pages/home/Home.jsp");  //  //stop scroll
            } else {
                session.setAttribute("error", "Database insertion failed");
                response.sendRedirect("pages/status/Wrong.jsp");
            }
            return; // Exit after redirect

        } catch (IllegalArgumentException e) {
            // [4. Handle Validation Errors]
            session.setAttribute("error", e.getMessage());
            response.sendRedirect("pages/status/Wrong.jsp");
            return; // Exit after redirect
        } catch (Exception e) {
            // [5. Handle Unexpected Errors]
            session.setAttribute("error", "Server error: " + e.getMessage());
            response.sendRedirect("pages/status/Wrong.jsp");
            return; // Exit after redirect
        }

        // [6. Removed redundant redirect here]
    }
    
}