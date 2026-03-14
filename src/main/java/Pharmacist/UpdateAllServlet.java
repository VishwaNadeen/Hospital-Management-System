package Pharmacist;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/UpdateAllServlet")
public class UpdateAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String Itemid = request.getParameter("id");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String qnty = request.getParameter("stock");
		String price = request.getParameter("price");
		String sname = request.getParameter("sname");
		String rdate = request.getParameter("rdate");
		String exp = request.getParameter("exp");
		String status = request.getParameter("status");
		String description = request.getParameter("description");
		
		boolean isTrue;
		
		isTrue = PharmacistDBUtill.UpdateAll(Itemid, name, type, qnty, price, sname, rdate, exp, status, description);
		
		if(isTrue == true) {
			
			List <Pharmacist> phaDetails = PharmacistDBUtill.getById(Itemid);
			request.setAttribute("phaDetails", phaDetails);
			
			jakarta.servlet.RequestDispatcher dis = request.getRequestDispatcher("PharmacistGetAllServlet.jsp");
			dis.forward(request,response);
			
		} else {
			jakarta.servlet.RequestDispatcher dis2 = request.getRequestDispatcher("pages/status/unsuccess.jsp");
			dis2.forward(request,response);
		}
	}

}
