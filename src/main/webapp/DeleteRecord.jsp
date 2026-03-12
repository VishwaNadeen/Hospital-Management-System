<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Medical Record</title>
<link rel="stylesheet" href="cssrec/DeleteRecord.css">
</head>
<body>
    <div class="container">
        <h1>Record Deletion Confirmation</h1>
        
        <div class="warning-message">
            Warning: This action cannot be undone. Please confirm you want to permanently delete this record.
        </div>
        
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
        
        <form class="form-container" action="DeleteRecordServlet" method="post">
            <div class="form-group">
                <label>NIC Number</label>
                <input type="text" name="nic" value="<%=nic%>" readonly>
            </div>
            
            <div class="form-group">
                <label>Age</label>
                <input type="text" name="age" value="<%=age%>" readonly>
            </div>
            
            <div class="form-group">
                <label>Gender</label>
                <input type="text" name="gender" value="<%=gender%>" readonly>
            </div>
            
            <div class="form-group">
                <label>Medical History</label>
                <input type="text" name="medicalHistory" value="<%=medicalHistory%>" readonly>
            </div>
            
            <div class="form-group">
                <label>Vital Signs</label>
                <input type="text" name="vitalSigns" value="<%=vitalSigns%>" readonly>
            </div>
            
            <div class="form-group">
                <label>Diagnosis</label>
                <input type="text" name="diagnosis" value="<%=diagnosis%>" readonly>
            </div>
            
            <div class="form-group">
                <label>Treatment Plan</label>
                <input type="text" name="treatmentPlan" value="<%=treatmentPlan%>" readonly>
            </div>
            
            <div class="form-group">
                <label>Date</label>
                <input type="text" name="date" value="<%=date%>" readonly>
            </div>
            
            <div class="button-group">
                <button type="submit" class="btn-delete">Confirm Delete</button>
                <a href="SearchRecord.jsp" class="btn-cancel">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>