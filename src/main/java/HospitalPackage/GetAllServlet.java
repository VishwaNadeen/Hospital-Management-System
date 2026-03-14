package HospitalPackage;

import java.io.IOException;

import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/GetAllServlet")
public class GetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		List<PatientModel> allPatients = PatientCtrl.getAllPatient();//display details
		request.setAttribute("allPatients", allPatients);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("pages/patient/Display.jsp");//display page
		dispatcher.forward(request,response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doGet(request,response);
	
		List<PatientModel> list = PatientCtrl.getAllPatient();
		request.setAttribute("GetAllPatient", list);
		request.getRequestDispatcher("pages/patient/Display.jsp").forward(request, response);

		
	}

}
