<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Doctor Details</title>

<link rel="stylesheet" href="css/doctorInsert.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

</head>
<body>

<jsp:include page="header.jsp" />

    <div class="form-container">
        <form action="DoctorInsertServlet" method="post">
        
            <h1>Add New Doctor</h1>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="fname">First Name</label>
                    <input type="text" id="fname" name="fname" required>
                </div>
                <div class="form-group">
                    <label for="lname">Last Name</label>
                    <input type="text" id="lname" name="lname" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="id">Identity Number</label>
                    <input type="text" id="id" name="id" required>
                </div>
                <div class="form-group">
                    <label for="uname">Username</label>
                    <input type="text" id="uname" name="uname" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="psw">Password</label>
                    <input type="password" id="psw" name="psw" required>
                </div>
                <div class="form-group">
                    <label for="dob">Date of Birth</label>
                    <input type="date" id="dob" name="dob" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" required>
                        <option value="">-- Select Gender --</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="number">Phone Number</label>
                    <input type="tel" id="number" name="number" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="spe">Specialization</label>
                    <input type="text" id="spe" name="spe">
                </div>
                <div class="form-group">
                    <label for="qua">Qualification</label>
                    <input type="text" id="qua" name="qua">
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="exp">Experience Years</label>
                    <input type="number" id="exp" name="exp">
                </div>
                <div class="form-group">
                    <label for="availability">Availability</label>
                    <select id="availability" name="availability">
                        <option value="">-- Select Availability --</option>
                        <option value="Weekday">Weekday</option>
                        <option value="Weekend">Weekend</option>
                    </select>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="status">Status</label>
                    <select id="status" name="status">
                        <option value="">-- Select Status --</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="create">Created At</label>
                    <input type="date" id="create" name="create" readonly>
                </div>
            </div>
            
            <!-- Hidden field for updated_at -->
            <input type="hidden" id="update" name="update">
            
            <div class="form-actions">
                <button type="submit" class="submit-btn">Create Doctor</button>
            </div>
            
            <div class="home-link">
            	<a href="AdminPortral.jsp">← Back to Portral</a>
        	</div>
        </form> 
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const today = new Date();
            const todayFormatted = today.toISOString().split('T')[0];

            // Set created and updated dates
            document.getElementById('create').value = todayFormatted;
            document.getElementById('update').value = todayFormatted;

            // Restrict DOB to past dates only
            const dobField = document.getElementById('dob');
            dobField.setAttribute('max', todayFormatted);

            dobField.addEventListener('change', function () {
                const selectedDate = new Date(this.value);
                const today = new Date();
                today.setHours(0, 0, 0, 0);

                if (selectedDate > today) {
                    alert('Date of birth cannot be in the future');
                    this.value = '';
                }
            });

            // Phone number validation before form submit
            const form = document.querySelector('form');
            form.addEventListener('submit', function (event) {
                const phoneNumber = document.getElementById('number').value;

                if (!/^\d{10}$/.test(phoneNumber)) {
                    if (phoneNumber.length > 10) {
                        alert('Phone number cannot be more than 10 digits.');
                    } else {
                        alert('Phone number must be exactly 10 digits.');
                    }
                    event.preventDefault();
                }
            });
        });
    </script>
    
    <script>
          const mobileMenu = document.querySelector('.nav-menu');
          const menuToggle = document.createElement('div');
				menuToggle.classList.add('menu-toggle');
				menuToggle.innerHTML = '<i class="fas fa-bars"></i>';
				document.querySelector('.header').appendChild(menuToggle);
				
				menuToggle.addEventListener('click', () => {
				    mobileMenu.classList.toggle('active');
				});
				
				// Smooth Scroll
				document.querySelectorAll('a[href^="#"]').forEach(anchor => {
				    anchor.addEventListener('click', function (e) {
				        e.preventDefault();
				        document.querySelector(this.getAttribute('href')).scrollIntoView({
				            behavior: 'smooth'
				        });
				    });
				});
    </script>

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>
