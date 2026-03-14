<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
<meta charset="UTF-8">
<title>Update Doctor Details</title>
<link rel="stylesheet" href="css/doctorUpdate.css">
</head>
<body>
    <jsp:include page="/components/header.jsp" />
    <div class="doctor-update-form">
        <h1 class="form-header">Update Doctor Details</h1>
        
        <%
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String id_no = request.getParameter("id_no");
            String user_name = request.getParameter("username");
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
            String operation = request.getParameter("operation"); // Hidden operation field
        %>

        <form action="AllDoctorsUpdateServlet" method="post" onsubmit="return validateForm()">
            <!-- Hidden operation fields -->
            <input type="hidden" name="operation" value="<%= operation != null ? operation : "update" %>">
            <input type="hidden" name="created_at" value="<%=created_at%>">
            <input type="hidden" id="updated_at" name="updated_at" value="<%=updated_at%>">
            
            <!-- Validation Fields -->
            <input type="hidden" id="is_valid" name="is_valid" value="true">
            <input type="hidden" id="validation_errors" name="validation_errors" value="">
            
            <div class="form-group">
                <label class="form-label">First Name</label>
                <input type="text" class="form-input" name="first_name" value="<%=first_name%>" required>
                <small class="error-message" id="first_name_error"></small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Last Name</label>
                <input type="text" class="form-input" name="last_name" value="<%=last_name%>" required>
                <small class="error-message" id="last_name_error"></small>
            </div>
            
            <div class="form-group">
                <label class="form-label">NIC Number</label>
                <input type="text" class="form-input readonly-input" name="id_no" value="<%=id_no%>" readonly>
            </div>
            
            <div class="form-group">
                <label class="form-label">User Name</label>
                <input type="text" class="form-input" name="user_name" value="<%=user_name%>" required>
                <small class="error-message" id="user_name_error"></small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Password</label>
                <input type="password" class="form-input" name="password" value="<%=password%>" required>
                <small class="error-message" id="password_error"></small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Date of Birth</label>
                <input type="date" class="form-input" name="dob" id="dob" value="<%=dob%>" required max="">
                <small class="error-message" id="dob_error">Date of birth cannot be in the future</small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Gender</label>
                <select class="form-input" name="gender" required>
                    <option value="">-- Select Gender --</option>
                    <option value="Male" <%= "Male".equals(gender) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(gender) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= "Other".equals(gender) ? "selected" : "" %>>Other</option>
                </select>
                <small class="error-message" id="gender_error"></small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Phone Number</label>
                <input type="tel" class="form-input" name="phone" value="<%=phone%>" required>
                <small class="error-message" id="phone_error"></small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Email</label>
                <input type="email" class="form-input" name="email" value="<%=email%>" required>
                <small class="error-message" id="email_error"></small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Address</label>
                <input type="text" class="form-input" name="address" value="<%=address%>" required>
                <small class="error-message" id="address_error"></small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Specialization</label>
                <input type="text" class="form-input" name="specialization" value="<%=specialization%>">
                <small class="error-message" id="specialization_error"></small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Qualification</label>
                <input type="text" class="form-input" name="qualification" value="<%=qualification%>">
                <small class="error-message" id="qualification_error"></small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Experience (Years)</label>
                <input type="number" class="form-input" name="experience_years" value="<%=experience_years%>" min="0">
                <small class="error-message" id="experience_error"></small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Availability</label>
                <select class="form-input" name="availability">
                    <option value="">-- Select Availability --</option>
                    <option value="Weekday" <%= "Weekday".equals(availability) ? "selected" : "" %>>Weekday</option>
                    <option value="Weekend" <%= "Weekend".equals(availability) ? "selected" : "" %>>Weekend</option>
                    <option value="Both" <%= "Both".equals(availability) ? "selected" : "" %>>Both</option>
                </select>
                <small class="error-message" id="availability_error"></small>
            </div>
            
            <div class="form-group">
                <label class="form-label">Status</label>
                <select class="form-input" name="status">
                    <option value="">-- Select Status --</option>
                    <option value="Available" <%= "Available".equals(status) ? "selected" : "" %>>Available</option>
                    <option value="Not Available" <%= "Not Available".equals(status) ? "selected" : "" %>>Not Available</option>
                </select>
                <small class="error-message" id="status_error"></small>
            </div>
            
            <div class="button-container">
                <input type="submit" class="update-btn" name="submit" value="Confirm Update">
                <button type="button" class="cancel-btn" onclick="window.location.href='pages/admin/AdminDoctorPanel.jsp'">Cancel</button>
            </div>
        </form>
    </div>

    <script>
        // Initialize max date for date of birth
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('dob').max = today;
            
            // Hide all error messages initially
            document.querySelectorAll('.error-message').forEach(el => {
                el.style.display = 'none';
            });
            
            // Set updated_at to current date if empty
            if(!document.getElementById('updated_at').value) {
                setUpdateDate();
            }
        });

        function validateForm() {
            let isValid = true;
            const today = new Date();
            
            // Clear previous errors
            document.querySelectorAll('.error-message').forEach(el => {
                el.style.display = 'none';
            });
            
            // Validate Date of Birth
            const dobInput = document.getElementById('dob');
            const dobError = document.getElementById('dob_error');
            if(dobInput.value) {
                const selectedDate = new Date(dobInput.value);
                selectedDate.setHours(0, 0, 0, 0);
                today.setHours(0, 0, 0, 0);
                
                if (selectedDate > today) {
                    dobError.style.display = 'block';
                    isValid = false;
                }
            }
            
            // Validate required fields
            document.querySelectorAll('[required]').forEach(input => {
                if(!input.value.trim()) {
                    const errorId = input.name + '_error';
                    const errorElement = document.getElementById(errorId);
                    if(errorElement) {
                        errorElement.textContent = 'This field is required';
                        errorElement.style.display = 'block';
                    }
                    isValid = false;
                }
            });
            
            // Validate email format
            const emailInput = document.querySelector('input[type="email"]');
            if(emailInput.value && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput.value)) {
                document.getElementById('email_error').textContent = 'Please enter a valid email address';
                document.getElementById('email_error').style.display = 'block';
                isValid = false;
            }
            
            // Validate phone number
            const phoneInput = document.querySelector('input[name="phone"]');
            if(phoneInput.value && !/^[0-9]{10,15}$/.test(phoneInput.value)) {
                document.getElementById('phone_error').textContent = 'Please enter a valid phone number';
                document.getElementById('phone_error').style.display = 'block';
                isValid = false;
            }
            
            // Set validation results in hidden fields
            document.getElementById('is_valid').value = isValid;
            document.getElementById('validation_errors').value = isValid ? '' : 'Form contains validation errors';
            
            if(isValid) {
                setUpdateDate();
            }
            
            return isValid;
        }
        
        function setUpdateDate() {
            const today = new Date();
            const dateString = today.toISOString().split('T')[0];
            document.getElementById('updated_at').value = dateString;
        }
        
    </script>
</body>
</html>

