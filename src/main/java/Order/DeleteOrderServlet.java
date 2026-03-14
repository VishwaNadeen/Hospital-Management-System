package Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        boolean isDeleted = OrderDBUtil.deleteOrderById(id);
        
        if (isDeleted) {
            response.sendRedirect("pages/home/Home.jsp");  // Redirect to confirmation page
        } else {
            response.sendRedirect("pages/status/unsuccess.jsp");  // Redirect to error page
        }
    }
}
