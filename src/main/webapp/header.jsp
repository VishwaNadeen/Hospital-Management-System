<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<%
    // Determine page-specific header class and active nav item.
    String headerClass = "";
    String currentUri = request.getRequestURI();
    String currentPage = currentUri.substring(currentUri.lastIndexOf('/') + 1);
    
    if (currentPage.equals("updateOrder.jsp")) {
        headerClass = "update-order-header";
    } else if (currentPage.equals("orderInsert.jsp")) {
        headerClass = "order-insert-header";
    }

    boolean isHome = currentPage.equals("Home.jsp") || currentPage.isEmpty();
    boolean isServices = currentPage.equals("services.jsp");
    boolean isDoctors = currentPage.equals("DoctorsList.jsp") || currentUri.contains("DoctorsListServlet");
    boolean isAppointment = currentPage.equals("Appointment.jsp");
    boolean isViewAppointment = currentPage.equals("SearchId.jsp") || currentPage.equals("IdInput.jsp") || currentUri.contains("GetAllServlet");
%>

<!-- Bootstrap & FontAwesome -->
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<style>
    :root {
        --hms-navbar-height: 84px;
    }

    body {
        padding-top: var(--hms-navbar-height);
    }

    .header {
        padding: 0;
    }

    .nav-custom {
        min-height: var(--hms-navbar-height);
    }

    .navbar-nav .nav-link.active {
        color: var(--primary-blue);
        font-weight: 700;
    }

    .navbar-nav .nav-link.active::after {
        width: 100%;
    }

    @media (max-width: 991.98px) {
        :root {
            --hms-navbar-height: 72px;
        }

        .navbar-nav {
            padding: 0.75rem 0;
            row-gap: 0.2rem;
        }

        .navbar-nav .nav-link {
            margin: 0;
            padding: 0.65rem 0;
        }
    }
</style>

<!-- ========== HEADER SECTION ========== -->
<header class="header">
    <nav class="navbar navbar-expand-lg navbar-light nav-custom fixed-top <%= headerClass %>">
        <div class="container-fluid container-xl px-3 px-lg-4">
            <a class="navbar-brand nav-brand" href="Home.jsp">
                <i class="bi bi-heart-pulse me-2"></i>MediCare
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto">
                    <a class="nav-link <%= isHome ? "active" : "" %>" href="Home.jsp">Home</a>
                    <a class="nav-link <%= isServices ? "active" : "" %>" href="services.jsp">Services</a>
                    <a class="nav-link <%= isDoctors ? "active" : "" %>" href="DoctorsListServlet">Doctors</a>
                    <a class="nav-link <%= isAppointment ? "active" : "" %>" href="Appointment.jsp">
                        <i class="bi bi-calendar-plus me-1"></i>Appointment
                    </a>
                    <a class="nav-link <%= isViewAppointment ? "active" : "" %>" href="SearchId.jsp">
                        <i class="bi bi-search me-1"></i>View Appointment
                    </a>
                    <a class="nav-link" href="#" onclick="document.getElementById('loginModal').style.display='block'">
                        <i class="bi bi-box-arrow-in-right me-1"></i>Login
                    </a>
                </div>
            </div>
        </div>
    </nav>
</header>

<!-- ✅ Login Modal -->
<div id="loginModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="document.getElementById('loginModal').style.display='none'">&times;</span>
        <form method="post" action="LoginServlet">
            <h5 class="mb-3">Login</h5>
            <div class="mb-2">
                <label>Username:</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <input type="submit" value="Login" class="btn btn-primary w-100">
        </form>
    </div>
</div>

<!-- Modal outside click close script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    window.onclick = function(event) {
        var modal = document.getElementById('loginModal');
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
