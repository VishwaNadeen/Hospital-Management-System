package DoctorPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DoctorUpdateServlet")
public class DoctorUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String id_no = request.getParameter("id_no");
		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String specialization = request.getParameter("specialization");
		String qualification = request.getParameter("qualification");
		String experience_years = request.getParameter("experience_years");
		String availability = request.getParameter("availability");
		String status = request.getParameter("status");
		String created_at = request.getParameter("created_at");
		String updated_at = request.getParameter("updated_at");
		
		boolean isTrue;
		
		isTrue = DoctorDBUtil.updateDoctor(first_name, last_name, id_no, user_name, password, dob, gender, phone, email, address, 
				specialization, qualification, experience_years, availability, status, created_at, updated_at);
		
		if(isTrue == true) {
			
			List<Doctor> docDetails = DoctorDBUtil.getDoctorDetails(id_no);
			request.setAttribute("docDetails", docDetails);
			
			jakarta.servlet.RequestDispatcher dis = request.getRequestDispatcher("pages/doctor/doctorDetails.jsp");
			dis.forward(request, response);
		}
		else {
			
			List<Doctor> docDetails = DoctorDBUtil.getDoctorDetails(id_no);
			request.setAttribute("docDetails", docDetails);
			
			jakarta.servlet.RequestDispatcher dis = request.getRequestDispatcher("pages/doctor/doctorDetails.jsp");
			dis.forward(request, response);
		}
		
	}

}
