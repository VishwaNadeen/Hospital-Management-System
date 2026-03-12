<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Appointment - MediCare</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="home.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.css">

</head>
<body>

	<!-- Header Section -->
<jsp:include page="header.jsp" />

	<!-- Appointment Section -->
	<div class="container-fluid">
		<div class="appointment-container">
			<div class="form-header">
				<h2>Schedule Your Medical Visit</h2>
				<p class="mb-0">Fast, Secure, and Professional Healthcare
					Services</p>
			</div>

			<form id="patientForm" action="InsertServlet" method="post"
				class="form-section">
				<!-- Personal Information -->
				<div class="form-card p-4">
					<h5 class="mb-4" style="color: var(--primary-green);">
						<i class="bi bi-person-circle me-2"></i>Personal Information
					</h5>
					<div class="row g-4">
						<div class="col-md-8">
							<label class="form-label">Full Name</label> <input type="text"
								class="form-control" name="name" required>
						</div>
						<div class="col-md-4">
							<label class="form-label">Gender</label> <select
								class="form-select" name="gender" required>
								<option value="">Select Gender</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Other">Other</option>
							</select>
						</div>
						<div class="col-md-6">
							<label class="form-label">NIC Number</label> <input type="text"
								class="form-control" name="id">
						</div>
						<div class="col-md-3">
							<label class="form-label">Age</label> <input type="number"
								class="form-control" name="age" min="1" max="120" required>
						</div>
						<div class="col-md-5">
							<label class="form-label">Appointment Date</label>
							<div class="input-group">
								<input type="date" id="appointmentDate"
									min="<%= LocalDate.now() %>" class="form-control" name="date"
									required> <span class="input-group-text"> <i
									class="bi bi-calendar"></i>
								</span>
							</div>
						</div>
					</div>
				</div>

				<!-- Contact Information -->
				<div class="form-card p-4">
					<h5 class="mb-4" style="color: var(--primary-green);">
						<i class="bi bi-telephone me-2"></i>Contact Details
					</h5>
					<div class="row g-4">
						<div class="col-md-6">
							<label class="form-label">Email Address</label> <input
								type="email" class="form-control" name="email" required>
						</div>
						<div class="col-md-6">
							<label class="form-label">Phone Number</label> <input type="tel"
								class="form-control" name="phone" pattern="[0-9]{10}"
								placeholder="10-digit number" required>
						</div>
					</div>
				</div>

				<!-- Medical Information -->
				<div class="form-card p-4">
					<h5 class="mb-4" style="color: var(--primary-green);">
						<i class="bi bi-clipboard-pulse me-2"></i>Medical Information
					</h5>
					<div class="row g-4">
						<div class="col-12">
							<label class="form-label">Medical Conditions</label>
							<textarea class="form-control" name="diseases" rows="3" required></textarea>
						</div>
						<div class="col-md-6">
							<label class="form-label">Preferred Doctor</label> <select
								class="form-select" name="doctor">
								<option value="">Select Doctor</option>
								<option value="Dr. Smith">Dr. John Smith (Cardiology)</option>
								<option value="Dr. Johnson">Dr. Sarah Johnson
									(Neurology)</option>
								<option value="Dr. Lee">Dr. Michael Lee (Orthopedics)</option>
							</select>
						</div>
					</div>
				</div>

				<!-- Form Actions -->
				<div class="d-flex justify-content-end gap-3 mt-5">
					<button type="reset" class="btn btn-outline-secondary px-4">
						<i class="bi bi-arrow-counterclockwise me-2"></i>Clear
					</button>
					<button type="submit" class="btn btn-primary px-4">
						<i class="bi bi-send-check me-2"></i>Submit
					</button>
				</div>
			</form>
		</div>
	</div>
	
	<!-- FOOTER SECTION -->
	<jsp:include page="footer.jsp" />

	<!-- Validation Script -->
	<script>
         function validateDate() {
            const dateInput = document.getElementById('appointmentDate');
            const selectedDate = new Date(dateInput.value);
            const today = new Date();
            today.setHours(0, 0, 0, 0);

            if (selectedDate < today) {
                alert("Appointment date cannot be in the past!");
                dateInput.focus();
                return false;
            }
            return true;
        }

        // Auto-reset form on page load
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('patientForm').reset();
        });
        // Existing validation code remains the same
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

// Chatbot Interaction
const chatbot = document.querySelector('.chatbot-icon');
chatbot.addEventListener('click', () => {
    // Add chatbot modal logic
    alert('Welcome! How can I assist you today?');
});
    </script>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
	</script>
		
</body>
</html>