package User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Check credentials
            if (UserDButil.validate(username, password)) {
                if ("vishwa".equals(username)) {
                    response.sendRedirect("AdminPortral.jsp");
                }
                
                else if ("kalana".equals(username)) {
                    response.sendRedirect("PharmacistHome.jsp");
                } 
                
                else if ("lakshan".equals(username)) {
                    response.sendRedirect("SearchRecord.jsp");
                }
                
                else {
                    response.getWriter().println("Unauthorized user");
                }
            } else {
                response.getWriter().println("Invalid credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
	}

}
