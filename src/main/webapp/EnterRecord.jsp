<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Medical Record</title>
<link rel="stylesheet" href="cssrec/EnterRecord.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h1>New Medical Record</h1>
        
        <%
            // Get current date in yyyy-MM-dd format
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String currentDate = sdf.format(new Date());
        %>
        
        <form class="form-container" action="EnterRecordServlet" method="post">
            <!-- Hidden date field -->
            <input type="hidden" id="date" name="date" value="<%= currentDate %>">
            
            <div class="form-group">
                <label for="nicID">NIC Number</label>
                <input type="text" id="nicID" name="nicID" required placeholder="Enter patient's NIC number">
            </div>
            
            <div class="form-group">
                <label for="age">Age</label>
                <input type="number" id="age" name="age" required placeholder="Enter patient's age" min="0" max="120">
            </div>
            
            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="medicalHistory">Medical History</label>
                <textarea id="medicalHistory" name="medicalHistory" rows="3" placeholder="Enter patient's medical history"></textarea>
            </div>
            
            <div class="form-group">
                <label for="vitalSigns">Vital Signs</label>
                <input type="text" id="vitalSigns" name="vitalSigns" placeholder="e.g., BP 120/80, HR 72">
            </div>
            
            <div class="form-group">
                <label for="diagnosis">Diagnosis</label>
                <textarea id="diagnosis" name="diagnosis" rows="3" placeholder="Enter diagnosis details"></textarea>
            </div>
            
            <div class="form-group">
                <label for="treatmentPlan">Treatment Plan</label>
                <textarea id="treatmentPlan" name="treatmentPlan" rows="3" placeholder="Enter treatment plan"></textarea>
            </div>
            
            <div class="button-group">
                <button type="submit" class="btn-submit">Create Medical Record</button>
            </div>
      
         </form>
         
         
         <a href="SearchRecord.jsp" class="button-group">
                <button type="submit" class="btn-cancel">Cancel</button>
         </a>
    </div>
</body>
</html>

