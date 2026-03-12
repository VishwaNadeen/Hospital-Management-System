package Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;

@WebServlet("/UpdateOrderServlet")
@MultipartConfig
public class UpdateOrderServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String comments = request.getParameter("comments");

        byte[] imageBytes = null;
        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                imageBytes = inputStream.readAllBytes();
            }
        }

        Order order = new Order(id, title, name, age, gender, phone, email, address, imageBytes, comments);
        boolean success = OrderDBUtil.updateOrder(order);

        if (success) {
            response.sendRedirect("GetOrderServlet");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
