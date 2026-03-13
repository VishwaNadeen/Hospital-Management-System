<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Doctor Details</title>
<link rel="stylesheet" href="css/doctorUpdate.css">
</head>
<body>
    <jsp:include page="header.jsp" />

	<%
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
	%>
	
    <form class="doctor-update-form" action="DoctorUpdateServlet" method="post" onsubmit="return validateForm()">
        <h1 class="form-header">Update Doctor Details</h1>
        
        <input type="hidden" name="created_at" value="<%=created_at%>">
        <input type="hidden" id="updated_at" name="updated_at" value="">
        
        <div class="form-group">
            <label class="form-label">First Name</label>
            <input type="text" class="form-input" name="first_name" value="<%=first_name%>">
        </div>
        
        <div class="form-group">
            <label class="form-label">Last Name</label>
            <input type="text" class="form-input" name="last_name" value="<%=last_name%>">
        </div>
        
        <div class="form-group">
            <label class="form-label">NIC Number</label>
            <input type="text" class="form-input readonly-input" name="id_no" value="<%=id_no%>" readonly>
        </div>
        
        <div class="form-group">
            <label class="form-label">User Name</label>
            <input type="text" class="form-input" name="user_name" value="<%=user_name%>">
        </div>
        
        <div class="form-group">
            <label class="form-label">Password</label>
            <input type="password" class="form-input" name="password" value="<%=password%>">
        </div>
        
        <div class="form-group">
            <label class="form-label">Date of Birth</label>
            <input type="date" class="form-input" name="dob" id="dob" value="<%=dob%>" required max="">
            <small id="dobError" class="error-message">Date of birth cannot be in the future</small>
        </div>
        
        <div class="form-group">
            <label class="form-label">Gender</label>
            <select class="form-input" id="gender" name="gender">
                <option value="">-- Select Gender --</option>
                <option value="Male" <%= "Male".equals(gender) ? "selected" : "" %>>Male</option>
                <option value="Female" <%= "Female".equals(gender) ? "selected" : "" %>>Female</option>
                <option value="Other" <%= "Other".equals(gender) ? "selected" : "" %>>Other</option>
            </select>
        </div>
        
        <div class="form-group">
            <label class="form-label">Phone Number</label>
            <input type="text" class="form-input" name="phone" value="<%=phone%>">
        </div>
        
        <div class="form-group">
            <label class="form-label">Email</label>
            <input type="email" class="form-input" name="email" value="<%=email%>">
        </div>
        
        <div class="form-group">
            <label class="form-label">Address</label>
            <input type="text" class="form-input" name="address" value="<%=address%>">
        </div>
        
        <div class="form-group">
            <label class="form-label">Specialization</label>
            <input type="text" class="form-input" name="specialization" value="<%=specialization%>">
        </div>
        
        <div class="form-group">
            <label class="form-label">Qualification</label>
            <input type="text" class="form-input" name="qualification" value="<%=qualification%>">
        </div>
        
        <div class="form-group">
            <label class="form-label">Experience (Years)</label>
            <input type="number" class="form-input" name="experience_years" value="<%=experience_years%>">
        </div>
        
        <div class="form-group">
            <label class="form-label">Availability</label>
            <select class="form-input" id="availability" name="availability">
                <option value="">-- Select Availability --</option>
                <option value="Weekday" <%= "Weekday".equals(availability) ? "selected" : "" %>>Weekday</option>
                <option value="Weekend" <%= "Weekend".equals(availability) ? "selected" : "" %>>Weekend</option>
                <option value="Both" <%= "Both".equals(availability) ? "selected" : "" %>>Both</option>
            </select>
        </div>
        
        <div class="form-group">
            <label class="form-label">Status</label>
            <select class="form-input" id="status" name="status">
                <option value="">-- Select Status --</option>
                <option value="Available" <%= "Available".equals(status) ? "selected" : "" %>>Available</option>
                <option value="Not Available" <%= "Not Available".equals(status) ? "selected" : "" %>>Not Available</option>
            </select>
        </div>
        
        <div class="button-container">
            <input type="submit" class="update-btn" name="submit" value="Confirm Update">
            
        </div>
    </form>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('dob').max = today;
        document.getElementById('dobError').style.display = 'none';
    });

    function validateForm() {
        const dobInput = document.getElementById('dob');
        const dobError = document.getElementById('dobError');
        const selectedDate = new Date(dobInput.value);
        const today = new Date();
        
        today.setHours(0, 0, 0, 0);
        selectedDate.setHours(0, 0, 0, 0);
        
        if (selectedDate > today) {
            dobError.style.display = 'block';
            dobInput.focus();
            return false;
        }
        
        setUpdateDate();
        return true;
    }
    
    function setUpdateDate() {
        const today = new Date();
        const dateString = today.toISOString().split('T')[0];
        document.getElementById('updated_at').value = dateString;
    }
    
    </script>
</body>
</html>

