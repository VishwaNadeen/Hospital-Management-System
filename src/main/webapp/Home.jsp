<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare Hub - Digital Healthcare Solutions</title>
    <link rel="stylesheet" href="css/home.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>

<body class="home-no-gap">

<jsp:include page="header.jsp" />

<style>
    body.home-no-gap {
        padding-top: var(--hms-navbar-height) !important;
    }

    body.home-no-gap .hero {
        margin-top: 0 !important;
    }
</style>

<!-- ✅ Success Message Display -->
<c:if test="${not empty success}">
    <div class="alert-anchor">
        <div class="container">
            <div class="alert alert-success alert-dismissible fade show mb-0">
                ${success}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <% session.removeAttribute("success"); %>
        </div>
    </div>
</c:if>

<main>
    <section class="hero">
        <div class="hero-content">
            <h1>Your Health, Our Priority</h1>
            <p>24/7 access to quality healthcare services from the comfort of your home</p>
            <div class="cta-buttons">
                <button class="btn btn-primary" onclick="location.href='Appointment.jsp';" >Book Appointment</button>
                <a class="btn btn-secondary" href="#emergency">Emergency Care</a>
            </div>
        </div>
    </section>

    <section class="quick-access">
        <div class="access-card" onclick="location.href='Appointment.jsp';" style="cursor: pointer;">
            <i class="fas fa-calendar-check fa-3x"></i>
            <h3>Book Appointment</h3>
            <p>Schedule with top specialists in minutes</p>
        </div>

        <div class="access-card" onclick="location.href='orderInsert.jsp';" style="cursor: pointer;">
            <i class="fas fa-user-md fa-3x"></i>
            <h3>Pharmacy</h3>
            <p>Browse 500+ Medicines</p> 
        </div>

        <div class="access-card" onclick="location.href='#';" style="cursor: pointer;">
            <i class="fas fa-file-medical fa-3x"></i>
            <h3>Medical Records</h3>
            <p>Secure digital health records access</p>
        </div>
    </section>

    <div class="emergency-banner" id="emergency">
        <div class="emergency-banner-content">
            <span>🚨 24/7 Emergency: Call 1-800-MEDI-CARE</span>
            <button class="btn btn-white">Emergency Location</button>
        </div>
    </div>

    <div class="chatbot-icon">
        <i class="fas fa-robot"></i>
    </div>
</main>

<jsp:include page="footer.jsp" />

<!-- Scripts -->
<script>
    // Smooth Scroll
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });

    // Chatbot Interaction
    document.querySelector('.chatbot-icon')?.addEventListener('click', () => {
        alert('Welcome! How can I assist you today?');
    });

    // Auto-dismiss success alert
    <c:if test="${not empty success}">
        window.addEventListener('DOMContentLoaded', () => {
            setTimeout(() => {
                const alert = bootstrap.Alert.getOrCreateInstance(document.querySelector('.alert'));
                alert?.close();
            }, 5000);
        });
    </c:if>
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
