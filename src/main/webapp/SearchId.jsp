<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Appointment Search - MediCare</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/searchid.css">

</head>
<body>

<!-- ========== HEADER SECTION ========== -->
<jsp:include page="header.jsp" />

	<div class="hero-section">
		<div class="hero-content text-center">
			<h2 class="display-4 mb-4">Patient Appointment</h2>
			<p class="lead">Access your appointment details anytime, anywhere.</p>
		</div>
	</div>

	<main class="container">
		<div class="search-container">
			<form action="SearchServlet2" method="post" class="search-form">
				<input type="text" id="searchInput" name="id"
					placeholder="Enter Your NIC" required autofocus
					class="flex-grow-1">
				<button type="submit" class="btn btn-theme">
					<i class="bi bi-search me-2"></i>Search
				</button>
			</form>

			<c:if test="${not empty error}">
				<div class="alert alert-theme alert-dismissible fade show">
					${error}
					<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				</div>
			</c:if>

			<c:choose>
				<c:when test="${not empty allPatients}">
					<div class="table-responsive">
						<table class="results-table table table-hover">
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
				</c:when>

				<c:when test="${empty allPatients and not empty searched}">
					<div class="text-center py-5">
						<i class="bi bi-file-earmark-x fs-1 text-muted mb-3"></i>
						<p class="fs-5 text-muted">No records found for the provided
							ID</p>
					</div>
				</c:when>
			</c:choose>
		</div>
	</main>
	
	<!-- ========== FOOTER SECTION ========== -->
	<jsp:include page="footer.jsp" />
	
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