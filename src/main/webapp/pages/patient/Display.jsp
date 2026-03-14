<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
    <meta charset="UTF-8">
    <title>Patient List - MediHome</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="css/display.css">
   <link rel="stylesheet" href="%=request.getContextPath()%>/css/delete.css">

<body style="padding-top: 70px;">

	<!-- Header Section -->
	<jsp:include page="/components/header.jsp" />

	<div class="main-content">
        <div class="container-fluid">
            <c:if test="${not empty success}">
                <div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
                    ${success}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="success" scope="session"/>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show mt-4" role="alert">
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="error" scope="session"/>
            </c:if>

</div>
</div>
            <div class="table-responsive rounded-3">
                  <h2 class="text-center my-5">Your Booked Appointments</h2>

        <div class="d-flex justify-content-center align-items-center min-vh-100 flex-column">
        
            <div class="col-lg-8">
                <c:choose>
                    <c:when test="${not empty allPatients}">
                        <c:forEach var="patient" items="${allPatients}">
                            <div class="appointment-card">
                                <div class="row g-0">
                                    
                                    <div class="col-md-8 details-section">
                                        <div class="detail-item">
                                            <div class="detail-label">Patient Information</div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="detail-value">Name</div>
                                                    <small class="text-muted">${patient.name}</small>
                                                    
                                                    <div class="detail-value">Gender</div>
                                                    <small class="text-muted">${patient.gender}</small>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="detail-value">ID</div>
                                                    <small class="text-muted">${patient.id}</small>

                                                    <div class="detail-value">Age</div>
                                                    <small class="text-muted">${patient.age}</small>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="detail-item">
                                            <div class="detail-label">Appointment Details</div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="detail-value">Date</div>
                                                    <small class="text-muted">${patient.date}</small>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="detail-value">Doctor</div>
                                                    <small class="text-muted">${patient.doctor}</small>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="detail-value">Diseases</div>
                                                    <small class="text-muted">${patient.diseases}</small>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="detail-item">
                                            <div class="detail-label">Contact Information</div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="detail-value">Phone</div>
                                                    <small class="text-muted">${patient.phone}</small>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="detail-value">Email</div>
                                                    <small class="text-muted">${patient.email}</small>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="action-buttons">
                                            <div class="d-flex gap-2">
                                                <c:url var="updateUrl" value="pages/patient/Update.jsp">
                                                    <!-- URL parameters here -->
                                                      <c:param name="id" value="${patient.id}" />
                                                    <c:param name="name" value="${patient.name}" />
                                                    <c:param name="gender" value="${patient.gender}" />
                                                    <c:param name="age" value="${patient.age}" />
                                                    <c:param name="date" value="${patient.date}" />
                                                    <c:param name="email" value="${patient.email}" />
                                                    <c:param name="phone" value="${patient.phone}" />
                                                    <c:param name="diseases" value="${patient.diseases}" />
                                                    <c:param name="doctor" value="${patient.doctor}" />
                                                </c:url>
                                                <a href="${updateUrl}" class="btn btn-outline-primary">
                                                    <i class="bi bi-pencil-square me-2"></i>Edit
                                                </a>
                                               <form action="DeleteServlet" method="post"
      onsubmit="return confirm('Are you sure you want to cancel this appointment?')">
    <input type="hidden" name="id" value="${patient.id}">
    <button type="submit" class="btn btn-outline-danger">
        <i class="bi bi-x-circle me-2"></i>Cancel
    </button>
</form>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5">
                            <i class="bi bi-calendar-x fs-1 text-muted"></i>
                            <h4 class="text-muted mt-3">No Appointments Found</h4>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

           
        </div>
    </div>
    
	<!-- FOOTER SECTION -->
	<jsp:include page="/components/footer.jsp" />

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
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>