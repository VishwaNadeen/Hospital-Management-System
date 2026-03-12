package Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;

@WebServlet("/imageServlet")
public class ImageServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        try {
            int id = Integer.parseInt(idStr);

            Connection con = DBConnection.getConnection();
            String sql = "SELECT image FROM `order` WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                byte[] imageBytes = rs.getBytes("image");
                if (imageBytes != null) {
                    response.setContentType("image/jpeg");
                    OutputStream os = response.getOutputStream();
                    os.write(imageBytes);
                    os.flush();
                    os.close();
                }
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
