package DoctorPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DoctorDetailsServlet")
public class DetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idNo = request.getParameter("id_no");
        if (idNo == null || idNo.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/pages/doctor/doctorList.jsp");
            return;
        }

        List<Doctor> docDetails = DoctorDBUtil.getByID(idNo);
        if (docDetails == null || docDetails.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/pages/doctor/doctorList.jsp?error=Doctor+not+found");
            return;
        }
        request.setAttribute("docDetails", docDetails);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/doctor/doctorDetails.jsp");
        dispatcher.forward(request, response);
    }
}
