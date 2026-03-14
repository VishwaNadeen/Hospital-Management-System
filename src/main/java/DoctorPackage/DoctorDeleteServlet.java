package DoctorPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DoctorDeleteServlet")
public class DoctorDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id_no = request.getParameter("id_no");
		
		boolean isTrue;
		
		isTrue = DoctorDBUtil.deleteDoctor(id_no);
		
		if (isTrue == true) {
			response.sendRedirect("pages/admin/AdminDoctorPanel.jsp");
		}
		else {
			List<Doctor> docdetails = DoctorDBUtil.getDoctorDetails(id_no);
			request.setAttribute("docCetails", docdetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("pages/status/unsuccess.jsp");
			dispatcher.forward(request, response);
		}
	}

}
