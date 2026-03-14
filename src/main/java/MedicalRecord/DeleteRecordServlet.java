package MedicalRecord;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteRecordServlet")
public class DeleteRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nic = request.getParameter("nic");
		
		boolean isTrue= RecordDButil.deleteRecord(nic); 
		
		if(isTrue==true) {
			
			jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("pages/record/SearchRecord.jsp");
			dispatcher.forward(request, response);
		}
		else {
			List<Records> recDetails = RecordDButil.getRecordDetails(nic);
			request.setAttribute("recDetails", recDetails);
		
			jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("pages/record/RecordDisplay.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
