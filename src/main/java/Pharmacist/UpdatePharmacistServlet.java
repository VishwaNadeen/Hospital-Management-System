package Pharmacist;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/UpdatePharmacistServlet")
public class UpdatePharmacistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String stock = request.getParameter("stock");
		String price = request.getParameter("price");
		String sname = request.getParameter("sname");
		String rdate = request.getParameter("rdate");
		String status = request.getParameter("status");
		String exp = request.getParameter("exp");
		String description = request.getParameter("description");
		
		boolean isTrue;
		
		isTrue = PharmacistDBUtill.UpdatePharmacist(id, name, type, stock, price, sname, rdate, status, exp, description);
		
		if (isTrue == true ) {
			
			List <Pharmacist> phaDetails = PharmacistDBUtill.getPharmacistDetails(id);
			request.setAttribute("phaDetails", phaDetails);
			
			jakarta.servlet.RequestDispatcher dis = request.getRequestDispatcher("PharmacistDetails.jsp");
			dis.forward(request, response);
		}
		else {
			
			List <Pharmacist> phaDetails = PharmacistDBUtill.getPharmacistDetails(id);
			request.setAttribute("phaDetails", phaDetails);
			
			
			jakarta.servlet.RequestDispatcher dis = request.getRequestDispatcher("unssuccess.jsp");
			dis.forward(request, response);
			
		}
	}

}
