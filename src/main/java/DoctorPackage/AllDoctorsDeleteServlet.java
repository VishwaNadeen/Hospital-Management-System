package DoctorPackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/AllDoctorsDeleteServlet")
public class AllDoctorsDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id_no = request.getParameter("id_no");
		
		boolean isTrue;
		
		isTrue = DoctorDBUtil.allDeleteDoctor(id_no);
		
		if (isTrue == true) {
			//If delete success, navigate to this page
			RequestDispatcher dispatcher = request.getRequestDispatcher("AllDoctorsServlet");
			dispatcher.forward(request, response);
		}
		else {
			List<Doctor> docdetails = DoctorDBUtil.getByID(id_no);
			request.setAttribute("docCetails", docdetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("unsuccess.jsp");
			dispatcher.forward(request, response);
		}
	}

}
