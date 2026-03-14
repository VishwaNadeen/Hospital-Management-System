<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
<meta charset="UTF-8">
<title>Appointments Portal - MediCare</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="css/home.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.css?v=<%= System.currentTimeMillis() %>">

</head>
<body class="appointment-page">

	<!-- Header Section -->
<jsp:include page="/components/header.jsp" />

	<section class="portal-hero">
		<div class="portal-hero-content">
			<p class="hero-chip">Front Desk Workspace</p>
			<h1>Appointments Hub</h1>
			<p>Register new visits and retrieve patient appointments quickly from a single operational dashboard.</p>
			<div class="hero-actions">
				<a href="#book" class="hero-link">Create Booking</a>
				<a href="#lookup" class="hero-link">Lookup Appointment</a>
			</div>
		</div>
	</section>

	<main class="portal-main">
		<section class="quick-stats" aria-label="Portal highlights">
			<div class="stat-card">
				<i class="bi bi-stopwatch"></i>
				<div>
					<h3>Fast Intake</h3>
					<p>Register a new patient visit in under a minute.</p>
				</div>
			</div>
			<div class="stat-card">
				<i class="bi bi-shield-check"></i>
				<div>
					<h3>Validated Details</h3>
					<p>Date, email, and phone checks reduce entry errors.</p>
				</div>
			</div>
			<div class="stat-card">
				<i class="bi bi-search-heart"></i>
				<div>
					<h3>Instant Lookup</h3>
					<p>Search by NIC to review the current appointment record.</p>
				</div>
			</div>
		</section>

		<div class="portal-grid">
			<section class="portal-panel booking-panel" id="book">
				<div class="panel-head">
					<h2><i class="bi bi-calendar2-plus"></i> Book Appointment</h2>
					<p>Capture patient, contact, and visit details for scheduling.</p>
				</div>

				<form id="patientForm" action="InsertServlet" method="post" class="appointment-form" onsubmit="return validateDate()">
					<div class="field-grid">
						<div class="field field-wide">
							<label>Full Name</label>
							<input type="text" class="form-control" name="name" required>
						</div>
						<div class="field">
							<label>Gender</label>
							<select class="form-select" name="gender" required>
								<option value="">Select Gender</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Other">Other</option>
							</select>
						</div>
						<div class="field">
							<label>NIC Number</label>
							<input type="text" class="form-control" name="id" required>
						</div>
						<div class="field">
							<label>Age</label>
							<input type="number" class="form-control" name="age" min="1" max="120" required>
						</div>
						<div class="field">
							<label>Appointment Date</label>
							<input type="date" id="appointmentDate" min="<%= LocalDate.now() %>" class="form-control" name="date" required>
						</div>
						<div class="field field-wide">
							<label>Email Address</label>
							<input type="email" class="form-control" name="email" required>
						</div>
						<div class="field">
							<label>Phone Number</label>
							<input type="tel" class="form-control" name="phone" pattern="[0-9]{10}" placeholder="10-digit number" required>
							<small class="field-hint">Format: 0XXXXXXXXX</small>
						</div>
						<div class="field field-wide">
							<label>Medical Conditions</label>
							<textarea class="form-control" name="diseases" rows="3" required></textarea>
						</div>
						<div class="field">
							<label>Preferred Doctor</label>
							<select class="form-select" name="doctor">
								<option value="">Select Doctor</option>
								<option value="Dr. Smith">Dr. John Smith (Cardiology)</option>
								<option value="Dr. Johnson">Dr. Sarah Johnson (Neurology)</option>
								<option value="Dr. Lee">Dr. Michael Lee (Orthopedics)</option>
							</select>
						</div>
					</div>
					<div class="form-actions">
						<button type="reset" class="btn btn-outline-secondary">
							<i class="bi bi-arrow-counterclockwise"></i> Clear
						</button>
						<button type="submit" class="btn btn-primary">
							<i class="bi bi-send-check"></i> Submit
						</button>
					</div>
				</form>
			</section>

			<section class="portal-panel lookup-panel" id="lookup">
				<div class="panel-head">
					<h2><i class="bi bi-search"></i> Find Appointment</h2>
					<p>Use NIC to retrieve a patient appointment profile.</p>
				</div>

				<form action="SearchServlet2" method="post" class="lookup-form">
					<div class="lookup-input-wrap">
						<i class="bi bi-person-vcard"></i>
						<input type="text" name="id" id="searchInput" placeholder="Enter NIC" value="${param.id}" required>
					</div>
					<button type="submit" class="btn btn-lookup">
						<i class="bi bi-search"></i> Search
					</button>
				</form>

				<c:if test="${not empty error}">
					<div class="lookup-alert" role="alert">
						<i class="bi bi-exclamation-circle-fill"></i>
						<span>${error}</span>
					</div>
				</c:if>

				<div class="lookup-tips">
					<h4>Search Tips</h4>
					<ul>
						<li>Use the same NIC entered during booking.</li>
						<li>Check for missing leading zeroes or typos.</li>
						<li>Use update flow from results when details change.</li>
					</ul>
				</div>
			</section>
		</div>

		<c:if test="${not empty allPatients}">
			<section class="portal-panel results-panel">
				<div class="results-head">
					<h3>Search Results</h3>
					<span class="results-badge">${allPatients.size()} record(s)</span>
				</div>
				<div class="table-responsive">
					<table class="results-table">
						<thead>
							<tr>
								<th>Name</th>
								<th>Gender</th>
								<th>ID</th>
								<th>Age</th>
								<th>Date</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Conditions</th>
								<th>Doctor</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="patient" items="${allPatients}">
								<tr>
									<td>${patient.name}</td>
									<td>${patient.gender}</td>
									<td>${patient.id}</td>
									<td>${patient.age}</td>
									<td>${patient.date}</td>
									<td>${patient.email}</td>
									<td>${patient.phone}</td>
									<td>${patient.diseases}</td>
									<td>${patient.doctor}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</c:if>
	</main>
	
	<!-- FOOTER SECTION -->
	<jsp:include page="/components/footer.jsp" />

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
        </script>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
	</script>
		
</body>
</html>