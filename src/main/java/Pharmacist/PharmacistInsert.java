package Pharmacist;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/PharmacistInsert")
public class PharmacistInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String itemId = request.getParameter("id");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String qnty = request.getParameter("stock");
		String price = request.getParameter("price");
		String sname = request.getParameter("sname");
		String exp = request.getParameter("exp");
		String status = request.getParameter("status");
		String description = request.getParameter("description");

		// Set receive date to today's date
		LocalDate today = LocalDate.now();
		String rdate = today.toString();

		// Validate expire date > today
		LocalDate expDate = LocalDate.parse(exp);
		if (!expDate.isAfter(today)) {
			// Optionally, set error attribute and redirect to error page
			request.setAttribute("error", "Expire date must be a future date.");
			request.getRequestDispatcher("pages/admin/AdminPharmacistInsert.jsp").forward(request, response);
			return;
		}

		@SuppressWarnings("unused")
		boolean isTrue = PharmacistDBUtill.insertpharmacist(itemId, name, type, qnty, price, sname, rdate, exp, status, description);

		jakarta.servlet.RequestDispatcher dis = request.getRequestDispatcher("pages/admin/AdminPharmacistInsert.jsp");
		dis.forward(request, response);
	}
}
