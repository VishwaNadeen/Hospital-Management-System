package HospitalPackage;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 HttpSession session = request.getSession();
        String id = request.getParameter("id");

        try {
            boolean isDeleted = PatientCtrl.deletedata(id);
            if (isDeleted) {
            	 session.setAttribute("success", "Appoinment Canceled!");
            		response.sendRedirect("pages/home/Home.jsp#alert-anchor"); ;
            } else {
            	 session.setAttribute("error", "Delete Failed!");
                response.sendRedirect("GetAllServlet");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/status/Wrong.jsp?msg=Error: " + e.getMessage());
        }
    }
}
