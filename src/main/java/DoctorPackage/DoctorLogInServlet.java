package DoctorPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DoctorLogInServlet")
public class DoctorLogInServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nic = request.getParameter("nic");
        
        // Basic client-side validation (should also have this in your HTML form)
        if (nic == null || nic.trim().isEmpty()) {
            request.setAttribute("error", "NIC number cannot be empty");
            response.sendRedirect("pages/admin/AdminDashboard.jsp");
            return;
        }

        try {
            List<Doctor> docDetails = DoctorDBUtil.validate(nic);
            
            if (docDetails == null || docDetails.isEmpty()) {
                // No doctor found with this NIC
                request.setAttribute("error", "No doctor found with NIC: " + nic);
                response.sendRedirect("pages/admin/AdminDashboard.jsp");
            } else {
                // Doctor found, route to admin doctor portal list.
                response.sendRedirect("pages/admin/AdminDoctorPanel.jsp");
            }
        } catch(Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while searching. Please try again.");
            response.sendRedirect("pages/admin/AdminDashboard.jsp");
        }
    }
}