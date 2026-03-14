package Pharmacist;

import jakarta.servlet.ServletException;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/DeletePharmacistServlet")
public class DeletePharmacistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		boolean isTrue;
		
		isTrue = PharmacistDBUtill.deletePharmacist(id);
		 
		if(isTrue == true ) {
			jakarta.servlet.RequestDispatcher dispatcher = (jakarta.servlet.RequestDispatcher) request.getRequestDispatcher("pages/pharmacy/PharmacistHome.jsp");
			dispatcher.forward(request, response);
		}
		else {
			List <Pharmacist>phaDetails = PharmacistDBUtill.getPharmacistDetails(id);
			request.setAttribute("phaDetails", phaDetails);
			
			jakarta.servlet.RequestDispatcher dispatcher = (jakarta.servlet.RequestDispatcher) request.getRequestDispatcher("pages/status/unsuccess.jsp");
			dispatcher.forward(request, response);
		}
	}

}
 