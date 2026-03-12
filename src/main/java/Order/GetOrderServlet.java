package Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/GetOrderServlet")
public class GetOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        try {
            int id = Integer.parseInt(idStr);
            Order order = OrderDBUtil.getOrderById(id);

            if (order != null) {
                request.setAttribute("order", order);
                request.getRequestDispatcher("displayOrder.jsp").forward(request, response);
            } else {
                response.getWriter().println("Order not found.");
            }
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error retrieving order.");
        }
    }
}
