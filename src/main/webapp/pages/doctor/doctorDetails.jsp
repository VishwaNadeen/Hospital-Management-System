<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Profile</title>
    <link rel="stylesheet" href="css/doctorDetails.css?v=<%= System.currentTimeMillis() %>">
</head>
<body class="doctor-profile-page">
<jsp:include page="/components/header.jsp" />

<main class="profile-main">
    <c:choose>
        <c:when test="${not empty docDetails}">
            <c:set var="doc" value="${docDetails[0]}" />

            <section class="profile-shell">
                <header class="profile-hero">
                    <div class="hero-main">
                        <p class="eyebrow">Doctor Profile</p>
                        <h1>Dr. ${doc.first_name} ${doc.last_name}</h1>
                        <p class="hero-sub">Specialist details, contact data, and availability.</p>
                        <div class="hero-tags">
                            <span class="tag">${doc.specialization}</span>
                            <span class="tag">${doc.availability}</span>
                            <span class="tag status ${doc.status == 'active' ? 'status-active' : 'status-inactive'}">${doc.status}</span>
                        </div>
                    </div>
                    <div class="id-chip">
                        <span>ID</span>
                        <strong>${doc.id_no}</strong>
                    </div>
                </header>

                <section class="details-grid">
                    <article class="detail-card">
                        <h2>Personal</h2>
                        <dl>
                            <div><dt>First Name</dt><dd>${doc.first_name}</dd></div>
                            <div><dt>Last Name</dt><dd>${doc.last_name}</dd></div>
                            <div><dt>Date of Birth</dt><dd>${doc.dob}</dd></div>
                            <div><dt>Gender</dt><dd>${doc.gender}</dd></div>
                        </dl>
                    </article>

                    <article class="detail-card">
                        <h2>Professional</h2>
                        <dl>
                            <div><dt>Specialization</dt><dd>${doc.specialization}</dd></div>
                            <div><dt>Qualification</dt><dd>${doc.qualification}</dd></div>
                            <div><dt>Experience</dt><dd>${doc.experience_years} years</dd></div>
                            <div><dt>Availability</dt><dd>${doc.availability}</dd></div>
                        </dl>
                    </article>

                    <article class="detail-card full">
                        <h2>Contact</h2>
                        <dl>
                            <div><dt>Phone</dt><dd>${doc.phone}</dd></div>
                            <div><dt>Email</dt><dd>${doc.email}</dd></div>
                            <div><dt>Address</dt><dd>${doc.address}</dd></div>
                        </dl>
                    </article>
                </section>
            </section>
        </c:when>
        <c:otherwise>
            <section class="empty-state">
                <h2>Doctor not found</h2>
                <p>The selected doctor record could not be loaded.</p>
            </section>
        </c:otherwise>
    </c:choose>
</main>

<jsp:include page="/components/footer.jsp" />
</body>
</html>
