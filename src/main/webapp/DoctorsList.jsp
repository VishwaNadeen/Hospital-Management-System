<%@ page import="Doctor.Doctor" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.Period"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    List<Doctor> doctorsList = (List<Doctor>) request.getAttribute("doctorsList");

    // Always render via servlet so data loading stays in one place.
    if (doctorsList == null) {
        response.sendRedirect("DoctorsListServlet");
        return;
    }

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctors List</title>
    <link rel="stylesheet" href="css/DoctorsList.css?v=<%= System.currentTimeMillis() %>">
</head>
<body class="doctors-page">

<jsp:include page="header.jsp" />

<div class="doctors-wrapper">
    <main class="doctors-main">
        <div class="container mt-5">
            <h2 class="page-title">Doctors Directory</h2>
            <p class="page-subtitle">Meet our specialists and view their latest availability in one place.</p>
            <div class="doctors-grid">
                <%
                    if (doctorsList != null && !doctorsList.isEmpty()) {
                        for (Doctor doctor : doctorsList) {
                            try {
                                LocalDate dob = LocalDate.parse(doctor.getDob(), formatter);
                                int age = Period.between(dob, LocalDate.now()).getYears();
                %>
                <div class="doctor-card">
                    <div class="doctor-info">
                        <div class="doctor-head">
                            <h3 class="doctor-name">Dr. <%= doctor.getFirstName() %> <%= doctor.getLastName() %></h3>
                            <span class="doctor-status <%= "active".equalsIgnoreCase(doctor.getStatus()) ? "status-active" : "status-inactive" %>"><%= doctor.getStatus() %></span>
                        </div>
                        <div class="doctor-tags">
                            <span class="doctor-tag"><%= doctor.getSpecialization() %></span>
                            <span class="doctor-tag"><%= doctor.getAvailability() %></span>
                        </div>
                        <p><span class="label">Specialization:</span><span class="value"><%= doctor.getSpecialization() %></span></p>
                        <p><span class="label">Qualification:</span><span class="value"><%= doctor.getQualification() %></span></p>
                        <p><span class="label">Experience:</span><span class="value"><%= doctor.getExperienceYears() %> years</span></p>
                        <p><span class="label">Availability:</span><span class="value"><%= doctor.getAvailability() %></span></p>
                        <p><span class="label">Age:</span><span class="value"><%= age %></span></p>
                        <p><span class="label">Gender:</span><span class="value"><%= doctor.getGender() %></span></p>
                    </div>
                </div>
                <%
                            } catch (Exception e) {
                                out.println("<div class='doctor-card error-card'><p>Error parsing DOB for doctor: " + doctor.getFirstName() + "</p></div>");
                            }
                        }
                    } else {
                %>
                <div class="no-doctors-message">
                    <h3>No doctors found in the database</h3>
                    <p>Please contact the administrator to add doctors to the system.</p>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </main>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
