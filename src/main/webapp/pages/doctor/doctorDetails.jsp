<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Details</title>
    <link rel="stylesheet" href="css/AllDoctorsDisplay.css">
</head>
<body>
<jsp:include page="/components/header.jsp" />

<div class="search-container">
    <h2>Doctor Details</h2>
</div>

<table border="1" id="doctorTable">
    <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>ID</th>
            <th>DOB</th>
            <th>Gender</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Specialization</th>
            <th>Qualification</th>
            <th>Experience</th>
            <th>Availability</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="doc" items="${docDetails}">
            <tr>
                <td>${doc.first_name}</td>
                <td>${doc.last_name}</td>
                <td>${doc.id_no}</td>
                <td>${doc.dob}</td>
                <td>${doc.gender}</td>
                <td>${doc.phone}</td>
                <td>${doc.email}</td>
                <td>${doc.address}</td>
                <td>${doc.specialization}</td>
                <td>${doc.qualification}</td>
                <td>${doc.experience_years}</td>
                <td>${doc.availability}</td>
                <td>${doc.status}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="home-link">
    <a href="pages/doctor/doctorList.jsp"><- Back to Doctors</a>
</div>

<jsp:include page="/components/footer.jsp" />
</body>
</html>
