package Pharmacist;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/PharmacistGetAllServlet")
public class PharmacistGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		List <Pharmacist> allPharmacist = PharmacistDBUtill.getALLPharmacist();
		request.setAttribute("allPharmacist", allPharmacist);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("pages/pharmacy/AllDrugDetails.jsp");
		dispatcher.forward(request, response);
	}

}
