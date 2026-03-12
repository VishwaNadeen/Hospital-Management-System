<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.time.LocalDate"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Appointment - MediCare</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/update.css">
</head>
<body>

    	<!-- Header Section -->
<jsp:include page="header.jsp" />
    

    <!-- Main Content -->
    <div class="container-fluid">
        <div class="appointment-container">
            <div class="form-header">
                <h2>Update Medical Appointment</h2>
                <p class="mb-0">Modify your healthcare schedule securely</p>
            </div>

            <!-- Alerts -->
            <c:if test="${not empty success}">
                <div class="alert alert-success alert-dismissible fade show mx-4 mt-3" role="alert">
                    ${success}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
                <c:remove var="success" scope="session"/>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show mx-4 mt-3" role="alert">
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
                <c:remove var="error" scope="session"/>
            </c:if>

            <%-- Retrieve parameters --%>
            <% String name = request.getParameter("name"); %>
            <% String gender = request.getParameter("gender"); %>
            <% String id = request.getParameter("id"); %>
            <% String age = request.getParameter("age"); %>
            <% String date = request.getParameter("date"); %>
            <% String email = request.getParameter("email"); %>
            <% String phone = request.getParameter("phone"); %>
            <% String diseases = request.getParameter("diseases"); %>
            <% String doctor = request.getParameter("doctor"); %>

            <form id="updateForm" action="UpdateServlet" method="post" class="form-section" onsubmit="return validateForm()">
                <input type="hidden" name="id" value="<%=id%>">

                <!-- Personal Information -->
                <div class="form-card p-4">
                    <h5 class="mb-4" style="color: var(--primary-green);">
                        <i class="bi bi-person-circle me-2"></i>Personal Information
                    </h5>
                    <div class="row g-4">
                        <div class="col-md-8">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="name" value="<%=name%>" required>
                        </div>
                        
                        <div class="col-md-4">
                            <label class="form-label">Gender</label>
                            <select class="form-select" name="gender" required>
                                <option value="Male" <%= "Male".equals(gender) ? "selected" : "" %>>Male</option>
                                <option value="Female" <%= "Female".equals(gender) ? "selected" : "" %>>Female</option>
                                <option value="Other" <%= "Other".equals(gender) ? "selected" : "" %>>Other</option>
                            </select>
                        </div>
                        
                        <div class="col-md-3">
                            <label class="form-label">ID</label>
                            <input type="text" class="form-control" name="id" value="<%=id%>" readonly>
                        </div>
                        
                        <div class="col-md-3">
                            <label class="form-label">Age</label>
                            <input type="number" class="form-control" name="age" value="<%=age%>" min="1" max="120" required>
                        </div>
                        
                        <div class="col-md-5">
                            <label class="form-label">Appointment Date</label>
                            <div class="input-group">
                                <input type="date" id="appointmentDate" 
                                    class="form-control" name="date"
                                    min="<%= LocalDate.now() %>" 
                                    value="<%=date != null ? date : ""%>" required>
                                <span class="input-group-text">
                                    <i class="bi bi-calendar"></i>
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
                            <label class="form-label">Email Address</label>
                            <input type="email" class="form-control" name="email" value="<%=email%>" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" 
                                name="phone" value="<%=phone%>"
                                pattern="[0-9]{10}" required>
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
                            <textarea class="form-control" name="diseases" rows="3" required><%=diseases%></textarea>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Preferred Doctor</label>
                            <select class="form-select" name="doctor">
                                <option value="">Select Doctor</option>
                                <option value="Dr. Smith" <%= "Dr. Smith".equals(doctor) ? "selected" : "" %>>Dr. John Smith</option>
                                <option value="Dr. Johnson" <%= "Dr. Johnson".equals(doctor) ? "selected" : "" %>>Dr. Sarah Johnson</option>
                                <option value="Dr. Lee" <%= "Dr. Lee".equals(doctor) ? "selected" : "" %>>Dr. Michael Lee</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Form Actions -->
                <div class="d-flex justify-content-end gap-3 mt-5">
                    <a href="GetAllServlet" class="btn btn-outline-secondary px-4">
                        <i class="bi bi-x-circle me-2"></i>Cancel
                    </a>
                    <button type="submit" class="btn btn-primary px-4">
                        <i class="bi bi-save me-2"></i>Update
                    </button>
                </div>
            </form>
        </div>
    </div>
    
	<!-- FOOTER SECTION -->
	<jsp:include page="footer.jsp" />
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function validateForm() {
            const dateInput = document.getElementById('appointmentDate');
            const selectedDate = new Date(dateInput.value);
            const today = new Date();
            today.setHours(0,0,0,0);
            
            if(selectedDate < today) {
                alert("Appointment date cannot be in the past!");
                dateInput.focus();
                return false;
            }

            const phone = document.querySelector("[name='phone']").value;
            if(!/^\d{10}$/.test(phone)) {
                alert("Phone number must be 10 digits");
                return false;
            }

            const email = document.querySelector("[name='email']").value;
            if(!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                alert("Please enter a valid email address");
                return false;
            }

            return true;
        }
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
</body>
</html>