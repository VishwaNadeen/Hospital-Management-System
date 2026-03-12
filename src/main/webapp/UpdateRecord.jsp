<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Medical Record</title>
<link rel="stylesheet" href="cssrec/UpdateRecord.css">
</head>
<body>
    <div class="container">
        <h1>Update Medical Record</h1>
        
        <%
        String nic = request.getParameter("nic");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String medicalHistory = request.getParameter("medicalHistory");
        String vitalSigns = request.getParameter("vitalSigns");
        String diagnosis = request.getParameter("diagnosis");
        String treatmentPlan = request.getParameter("treatmentPlan");
        String date = request.getParameter("date");
        %>
        
        <form class="form-container" action="RecordUpdateServlet" method="post">
            <div class="form-group">
                <label>NIC Number</label>
                <input type="text" name="nic" value="<%=nic%>" readonly>
            </div>
            
            <div class="form-group">
                <label>Age</label>
                <input type="number" name="age" value="<%=age%>" required min="0" max="120">
            </div>
            
            <div class="form-group">
                <label>Gender</label>
                <select name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male" <%= "Male".equals(gender) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(gender) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= "Other".equals(gender) ? "selected" : "" %>>Other</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Medical History</label>
                <textarea name="medicalHistory" rows="3" required><%=medicalHistory%></textarea>
            </div>
            
            <div class="form-group">
                <label>Vital Signs</label>
                <input type="text" name="vitalSigns" value="<%=vitalSigns%>" required>
            </div>
            
            <div class="form-group">
                <label>Diagnosis</label>
                <textarea name="diagnosis" rows="3" required><%=diagnosis%></textarea>
            </div>
            
            <div class="form-group">
                <label>Treatment Plan</label>
                <textarea name="treatmentPlan" rows="3" required><%=treatmentPlan%></textarea>
            </div>
            
            <div class="form-group">
                <label>Date</label>
                <input type="text" name="date" value="<%=date%>" readonly>
            </div>
            
            <div class="button-group">
                <button type="submit" class="btn-submit">Update Record</button>
                <a href="SearchRecord.jsp" class="btn-cancel">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>