package Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;

@WebServlet("/InsertOrderServlet")
@MultipartConfig
public class InsertOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Retrieve form fields
        String title = request.getParameter("title");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String comments = request.getParameter("comments");

        // Retrieve image as byte array
        byte[] imageBytes = null;
        Part filePart = request.getPart("image");

        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                imageBytes = inputStream.readAllBytes();
            }
        }

        // Create Order object
        Order order = new Order(0, title, name, age, gender, phone, email, address, imageBytes, comments);

        // Insert to database
        boolean isInserted = OrderDBUtil.insertOrder(order);

        // Redirect based on result
        if (isInserted) {
            response.sendRedirect("pages/order/orderInsert.jsp");
        } else {
            response.sendRedirect("pages/status/unsuccess.jsp");
        }
    }
}
