<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Portal</title>

    <link rel="stylesheet" href="css/AdminPortral.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <script>
        function setupDoctorPortalErrorMsgUnique() {
            const errorDiv = document.querySelector('.doctor-portal-err-msg');
            if (errorDiv) {
                setTimeout(() => {
                    errorDiv.style.opacity = '0';
                    setTimeout(() => {
                        errorDiv.remove();
                    }, 500);
                }, 3000);
            }
        }

        window.addEventListener('DOMContentLoaded', setupDoctorPortalErrorMsgUnique);
    </script>

</head>

<body class="doctor-portal-body-unique">
<div class="doctor-portal-wrapper-unique">
    <jsp:include page="header.jsp" />

    <div class="doctor-portal-container-unique">
        <h1 class="doctor-portal-heading-unique">Doctor Portal</h1>
        <% if (request.getAttribute("error") != null) { %>
            <div class="doctor-portal-err-msg">
                <strong>Error:</strong> <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form class="doctor-portal-form-unique doctor-portal-form-blue-unique" action="DoctorLogInServlet" method="post">
            <label for="doctor-portal-nic-unique">Enter Doctor NIC Number</label>
            <input type="text" name="nic" id="doctor-portal-nic-unique"
                   placeholder="e.g. 123456789V"
                   value="<%= request.getParameter("nic") != null ? request.getParameter("nic") : "" %>"
                   required>
            <button type="submit">Search</button>
        </form>

        <form class="doctor-portal-form-unique doctor-portal-form-green-unique" action="AllDoctorsServlet" method="post">
            <label>Show All Doctors</label>
            <button type="submit">Show</button>
        </form>

        <form class="doctor-portal-form-unique doctor-portal-form-yellow-unique" action="doctorInsert.jsp">
            <label>Add New Doctor</label>
            <button type="submit">Add</button>
        </form>

        <div class="doctor-portal-home-link-unique">
            <a href="Home.jsp">← Back to Home</a>
        </div>
    </div>

    <div class="doctor-portal-footer-wrapper-unique">
	    	<%@ include file="footer.jsp" %>
    </div>
    
</div>
</body>

<script>
    const mobileMenu = document.querySelector('.nav-menu');
    const menuToggle = document.createElement('div');
    menuToggle.classList.add('menu-toggle');
    menuToggle.innerHTML = '<i class="fas fa-bars"></i>';
    document.querySelector('.header').appendChild(menuToggle);

    menuToggle.addEventListener('click', () => {
        mobileMenu.classList.toggle('active');
    });

    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
