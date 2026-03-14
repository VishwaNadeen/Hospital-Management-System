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
    boolean isDoctors = currentPage.equals("doctorList.jsp") || currentPage.equals("AllDoctorsDisplay.jsp") || currentUri.contains("DoctorsListServlet") || currentUri.contains("AllDoctorsServlet");
    boolean isAppointment = currentPage.equals("Appointment.jsp") || currentPage.equals("SearchId.jsp") || currentUri.contains("SearchServlet2") || currentUri.contains("GetAllServlet");
    boolean isLogin = currentPage.equals("Login.jsp");
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

    .navbar-nav {
        column-gap: 0.45rem;
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
            column-gap: 0.25rem;
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
            <a class="navbar-brand nav-brand" href="pages/home/Home.jsp">
                <i class="bi bi-heart-pulse me-2"></i>MediCare
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto">
                    <a class="nav-link <%= isHome ? "active" : "" %>" href="pages/home/Home.jsp">
                        <i class="bi bi-house-door me-1"></i>Home
                    </a>
                    <a class="nav-link <%= isServices ? "active" : "" %>" href="pages/home/services.jsp">
                        <i class="bi bi-grid me-1"></i>Services
                    </a>
                    <a class="nav-link <%= isDoctors ? "active" : "" %>" href="pages/doctor/doctorList.jsp">
                        <i class="bi bi-heart-pulse me-1"></i>Doctors
                    </a>
                    <a class="nav-link <%= isAppointment ? "active" : "" %>" href="pages/patient/Appointment.jsp">
                        <i class="bi bi-calendar2-week me-1"></i>Appointments
                    </a>
                    <a class="nav-link <%= isLogin ? "active" : "" %>" href="pages/home/Login.jsp">
                        <i class="bi bi-box-arrow-in-right me-1"></i>Login
                    </a>
                </div>
            </div>
        </div>
    </nav>
</header>
