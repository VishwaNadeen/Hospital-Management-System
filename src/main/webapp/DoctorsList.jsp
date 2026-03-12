<%@ page import="Doctor.Doctor" %>
<%@ page import="Doctor.DoctorDBUtil" %>
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

    // ✅ fallback: if null (page directly refreshed), get from DB manually
    if (doctorsList == null) {
        doctorsList = DoctorDBUtil.getAllDoctors();
    }

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctors List</title>
    <link rel="stylesheet" href="css/DoctorsList.css">
</head>
<body class="doctors-page">

<jsp:include page="header.jsp" />

<div class="doctors-wrapper">
    <main class="doctors-main">
        <div class="container mt-5">
            <h2 class="page-title">Doctors Directory</h2>
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
                        <h3><%= doctor.getFirstName() %> <%= doctor.getLastName() %></h3>
                        <p>Age: <%= age %></p>
                        <p>Gender: <%= doctor.getGender() %></p>
                        <p>Specialization: <%= doctor.getSpecialization() %></p>
                        <p>Qualification: <%= doctor.getQualification() %></p>
                        <p>Experience: <%= doctor.getExperienceYears() %> years</p>
                        <p>Availability: <%= doctor.getAvailability() %></p>
                        <p>Status: <%= doctor.getStatus() %></p>
                    </div>
                </div>
                <%
                            } catch (Exception e) {
                                out.println("<p>Error parsing DOB for doctor: " + doctor.getFirstName() + "</p>");
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
