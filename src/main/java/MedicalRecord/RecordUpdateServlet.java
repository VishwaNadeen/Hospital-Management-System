package MedicalRecord;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/RecordUpdateServlet")
public class RecordUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nic =request.getParameter("nic");
		String age =request.getParameter("age");
		String gender =request.getParameter("gender");
		String medicalHistory =request.getParameter("medicalHistory");
		String vitalSigns =request.getParameter("vitalSigns");
		String diagnosis =request.getParameter("diagnosis");
		String treatmentPlan =request.getParameter("treatmentPlan");
		String date =request.getParameter("date");
	
	boolean isTrue;
	
	isTrue = RecordDButil.updateRecord(nic, age, gender, medicalHistory, vitalSigns, diagnosis, treatmentPlan, date);
	
	if(isTrue==true) {
		
		List<Records> recDetails = RecordDButil.getRecordDetails(nic);
		request.setAttribute("recDetails", recDetails);
		
		jakarta.servlet.RequestDispatcher dis = request.getRequestDispatcher("RecordDisplay.jsp");
		dis.forward(request, response);
	}
	else {
		
		List<Records> recDetails = RecordDButil.getRecordDetails(nic);
		request.setAttribute("recDetails", recDetails);
		
		jakarta.servlet.RequestDispatcher dis = request.getRequestDispatcher("UpdateRecord.jsp");
		dis.forward(request, response);
	}
	
	}

}
