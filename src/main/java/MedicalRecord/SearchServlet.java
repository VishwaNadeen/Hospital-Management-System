package MedicalRecord;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nicID = request.getParameter("nicID");
        String source = request.getParameter("source");
        boolean isAdminEmbed = "adminEmbed".equals(source);
        
        try {
            List<Records> recDetails = RecordDButil.validate(nicID);
            
            if(recDetails == null || recDetails.isEmpty()) {
                response.sendRedirect((isAdminEmbed ? "AdminMedicalRecordPanel.jsp" : "SearchRecord.jsp") + "?error=No+record+found+for+the+given+ID");
                return;
            }
            
            request.setAttribute("recDetails", recDetails);
            RequestDispatcher dis = request.getRequestDispatcher("RecordDisplay.jsp");
            dis.forward(request, response);
            
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect((isAdminEmbed ? "AdminMedicalRecordPanel.jsp" : "SearchRecord.jsp") + "?error=An+error+occurred+while+searching");
        }
    }
}