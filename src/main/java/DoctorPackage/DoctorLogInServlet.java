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
            request.getRequestDispatcher("AdminPortral.jsp").forward(request, response);
            return;
        }

        try {
            List<Doctor> docDetails = DoctorDBUtil.validate(nic);
            
            if (docDetails == null || docDetails.isEmpty()) {
                // No doctor found with this NIC
                request.setAttribute("error", "No doctor found with NIC: " + nic);
                request.getRequestDispatcher("AdminPortral.jsp").forward(request, response);
            } else {
                // Doctor found, proceed to details page
                request.setAttribute("docDetails", docDetails);
                request.getRequestDispatcher("doctorDetails.jsp").forward(request, response);
            }
        } catch(Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while searching. Please try again.");
            request.getRequestDispatcher("AdminPortral.jsp").forward(request, response);
        }
    }
}