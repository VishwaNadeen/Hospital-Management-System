<%@ page import="DoctorPackage.Doctor" %>
<%@ page import="DoctorPackage.DoctorDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    List<Doctor> doctorsList = DoctorDBUtil.getAllDoctor();

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctors List</title>
    <link rel="stylesheet" href="css/DoctorsList.css?v=<%= System.currentTimeMillis() %>">
</head>
<body class="doctors-page">

<jsp:include page="/components/header.jsp" />

<div class="doctors-wrapper">
    <main class="doctors-main">
        <div class="container mt-5">
            <h2 class="page-title">Doctors Directory</h2>
            <p class="page-subtitle">Meet our specialists and view their latest availability in one place.</p>
            <div class="doctors-grid">
                <%
                    if (!doctorsList.isEmpty()) {
                        for (Doctor doctor : doctorsList) {
                            try {
                                LocalDate dob = LocalDate.parse(doctor.getDob(), formatter);
                                int age = Period.between(dob, LocalDate.now()).getYears();
                                String status = doctor.getStatus() != null ? doctor.getStatus() : "Unknown";
                                String statusClass = "active".equalsIgnoreCase(status) ? "status-active" : "status-inactive";
                %>
                <jsp:include page="/components/doctorCard.jsp">
                    <jsp:param name="fullName" value='<%= "Dr. " + doctor.getFirst_name() + " " + doctor.getLast_name() %>'/>
                    <jsp:param name="status" value='<%= status %>'/>
                    <jsp:param name="statusClass" value='<%= statusClass %>'/>
                    <jsp:param name="specialization" value='<%= doctor.getSpecialization() %>'/>
                    <jsp:param name="qualification" value='<%= doctor.getQualification() %>'/>
                    <jsp:param name="experienceYears" value='<%= doctor.getExperience_years() %>'/>
                    <jsp:param name="availability" value='<%= doctor.getAvailability() %>'/>
                    <jsp:param name="age" value='<%= String.valueOf(age) %>'/>
                    <jsp:param name="gender" value='<%= doctor.getGender() %>'/>
                    <jsp:param name="idNo" value='<%= doctor.getId_no() %>'/>
                </jsp:include>
                <%
                            } catch (Exception e) {
                                out.println("<div class='doctor-card error-card'><p>Error parsing DOB for doctor: " + doctor.getFirst_name() + "</p></div>");
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

<jsp:include page="/components/footer.jsp" />
</body>
</html>
