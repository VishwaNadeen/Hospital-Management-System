package MedicalRecord;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EnterRecordServlet")
public class EnterRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nic = request.getParameter("nicID");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String medicalHistory = request.getParameter("medicalHistory");
		String vitalSigns = request.getParameter("vitalSigns");
		String diagnosis = request.getParameter("diagnosis");
		String treatmentPlan = request.getParameter("treatmentPlan");
		String date = request.getParameter("date");
		
		boolean isTrue;
		
		isTrue = RecordDButil.insertRecordDetails(nic, age, gender, medicalHistory, vitalSigns, diagnosis, treatmentPlan, date);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("SearchRecord.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis2 =request.getRequestDispatcher("SearchRecord.jsp");
			dis2.forward(request, response);
		}
		
	}

}