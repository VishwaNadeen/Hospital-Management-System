/*package HospitalPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		
		
/*	try {
		List<PatientModel> Details = PatientCtrl.validate(id);
		request.setAttribute("Details", Details);

	}catch(Exception e) {
		e.printStackTrace();
	}
		
		RequestDispatcher dispatcher =request.getRequestDispatcher("");
		dispatcher.forward(request, response);
		
	}
		List<PatientModel> Details = PatientCtrl.getById(id);

        if (Details.isEmpty()) {
            request.setAttribute("error", "No appointment found for NIC: " + id);
            RequestDispatcher rd = request.getRequestDispatcher("SearchId.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("patientDetails", Details);
            RequestDispatcher rd = request.getRequestDispatcher("Display.jsp");
            rd.forward(request, response);
        }
    }

}*/

package HospitalPackage;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet2")
public class SearchServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String id = request.getParameter("id"); // Get the ID from form input
        
        // Fetch patient data using the ID
        List<PatientModel> patients = PatientCtrl.getById(id);
        
        if (patients != null && !patients.isEmpty()) {
            request.setAttribute("allPatients", patients);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Display.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("error", "No appointment found with ID: " + id);
            RequestDispatcher dispatcher = request.getRequestDispatcher("SearchId.jsp");
            dispatcher.forward(request, response);
        }
    }
}
