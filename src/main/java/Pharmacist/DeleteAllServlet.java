package Pharmacist;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteAllServlet")
public class DeleteAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		boolean isTrue;
		
		isTrue = PharmacistDBUtill.deleteAll(id);
		 
		if(isTrue == true ) {
			jakarta.servlet.RequestDispatcher dispatcher = (jakarta.servlet.RequestDispatcher) request.getRequestDispatcher("PharmacistGetAllServlet.jsp");
			dispatcher.forward(request, response);
		}
		else {
			List <Pharmacist>phaDetails = PharmacistDBUtill.getById(id);
			request.setAttribute("phaDetails", phaDetails);
			
			jakarta.servlet.RequestDispatcher dispatcher = (jakarta.servlet.RequestDispatcher) request.getRequestDispatcher("unsuccess.jsp");
			dispatcher.forward(request, response);
		}
	}

}
