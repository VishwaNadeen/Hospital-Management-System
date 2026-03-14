package User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/pages/home/Login.jsp");
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contextPath = request.getContextPath();

		String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Check credentials
            if (UserDButil.validate(username, password)) {
                if ("vishwa".equals(username)) {
                    response.sendRedirect(contextPath + "/pages/admin/AdminDashboard.jsp");
                }
                
                else if ("kalana".equals(username)) {
                    response.sendRedirect(contextPath + "/pages/admin/AdminPharmacistPanel.jsp");
                } 
                
                else if ("lakshan".equals(username)) {
                    response.sendRedirect(contextPath + "/pages/home/Home.jsp");
                }
                
                else {
                    response.sendRedirect(contextPath + "/pages/home/Login.jsp?error=" + URLEncoder.encode("Unauthorized user", StandardCharsets.UTF_8));
                }
            } else {
                response.sendRedirect(contextPath + "/pages/home/Login.jsp?error=" + URLEncoder.encode("Invalid username or password", StandardCharsets.UTF_8));
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(contextPath + "/pages/home/Login.jsp?error=" + URLEncoder.encode("Login failed. Please try again.", StandardCharsets.UTF_8));
        }
	}

}
