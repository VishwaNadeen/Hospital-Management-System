package Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/LoadOrderForUpdate")
public class LoadOrderForUpdate extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = OrderDBUtil.getOrderById(id);
        request.setAttribute("order", order);
        request.getRequestDispatcher("pages/pharmacy/updateOrder.jsp").forward(request, response);
    }
}
