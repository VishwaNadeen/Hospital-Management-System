package Pharmacist;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/PharmacistServlet")
public class PharmacistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String item_id= request.getParameter("item_id");
	
		try {
		List<Pharmacist> phaDetails = PharmacistDBUtill.validate(item_id);
		request.setAttribute("phaDetails",phaDetails);
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		jakarta.servlet.RequestDispatcher dis = request.getRequestDispatcher("pages/admin/PharmacistDetails.jsp");
		dis.forward(request,response);
		
		
	}

}
