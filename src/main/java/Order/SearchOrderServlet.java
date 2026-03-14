package Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/SearchOrderServlet")
public class SearchOrderServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = OrderDBUtil.getOrderById(id);

        if (order != null) {
            request.setAttribute("order", order);
            request.getRequestDispatcher("pages/order/displayOrder.jsp").forward(request, response);
        } else {
            response.getWriter().println("Order not found.");
        }
    }
}
