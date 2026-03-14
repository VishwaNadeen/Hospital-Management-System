package HospitalPackage;

import java.io.IOException;


import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 LocalDate today = LocalDate.now();
        HttpSession session = request.getSession();
        

        try {
            // [1. Parameter Retrieval]
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

            // [2. Validation]
            if (name == null || name.trim().isEmpty() ||
                gender == null || gender.trim().isEmpty() ||
                id == null || id.trim().isEmpty() ||
                age == null || age.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                phone == null || phone.trim().isEmpty() ||
                diseases == null || diseases.trim().isEmpty()) {
                
                throw new IllegalArgumentException("All required fields must be filled");
            }

            // [3. Phone Validation]
            if (!phone.matches("^0[0-9]{9}$")) { // Ensures starts with 0 + 9 digits
                session.setAttribute("error", "Phone must start with 0 and have 10 digits");
                response.sendRedirect("GetAllServlet");
                return; // Exit immediately
            }

            // [4. Email Validation]
            if (!email.matches("^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
                session.setAttribute("error", "Invalid email format");
                response.sendRedirect("GetAllServlet");
                return; // Exit immediately
            }
            if (selectedDate.isBefore(today)) {
                request.getSession().setAttribute("error", "Date cannot be in the past!");
                response.sendRedirect("your-form-page.jsp");
                return;
            }

            // [5. Update Data]
            boolean isUpdated = PatientCtrl.Updatedata(
                name, gender, id, age, date, email, phone, diseases, doctor
            );

            if (isUpdated) {
                session.setAttribute("success", "Appointment updated successfully!");
                List<PatientModel> allPatients = PatientCtrl.getById(id);
                request.setAttribute("allPatients", allPatients);
                // Forward to patient/Display.jsp to show ONLY the updated record
                RequestDispatcher dispatcher = request.getRequestDispatcher("pages/patient/Display.jsp");
                dispatcher.forward(request, response);
       
              
            } else {
                session.setAttribute("error", "Failed to update appointment");
                response.sendRedirect("pages/patient/Appointment.jsp#lookup");
            }
            // Single redirect point
            return;

        } catch(IllegalArgumentException e) {
            // [6. Handle Validation Errors]
            session.setAttribute("error", "Validation Error: " + e.getMessage());
            response.sendRedirect("GetAllServlet");
            return;
        } catch (Exception e) {
            // [7. Handle Unexpected Errors]
            session.setAttribute("error", "Server Error: " + e.getMessage());
            response.sendRedirect("GetAllServlet");
            return;
        }
    
    }
  
    
}