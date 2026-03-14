<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String fullName = request.getParameter("fullName");
    String status = request.getParameter("status");
    String statusClass = request.getParameter("statusClass");
    String specialization = request.getParameter("specialization");
    String qualification = request.getParameter("qualification");
    String experienceYears = request.getParameter("experienceYears");
    String availability = request.getParameter("availability");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    String idNo = request.getParameter("idNo");
%>

<div class="doctor-card">
    <div class="doctor-info">
        <div class="doctor-head">
            <h3 class="doctor-name"><%= fullName != null ? fullName : "Doctor" %></h3>
            <span class="doctor-status <%= statusClass != null ? statusClass : "status-inactive" %>"><%= status != null ? status : "Unknown" %></span>
        </div>
        <div class="doctor-tags">
            <span class="doctor-tag"><%= specialization != null ? specialization : "N/A" %></span>
            <span class="doctor-tag"><%= availability != null ? availability : "N/A" %></span>
        </div>
        <p><span class="label">Specialization:</span><span class="value"><%= specialization != null ? specialization : "N/A" %></span></p>
        <p><span class="label">Qualification:</span><span class="value"><%= qualification != null ? qualification : "N/A" %></span></p>
        <p><span class="label">Experience:</span><span class="value"><%= experienceYears != null ? experienceYears : "0" %> years</span></p>
        <p><span class="label">Availability:</span><span class="value"><%= availability != null ? availability : "N/A" %></span></p>
        <p><span class="label">Age:</span><span class="value"><%= age != null ? age : "N/A" %></span></p>
        <p><span class="label">Gender:</span><span class="value"><%= gender != null ? gender : "N/A" %></span></p>
        <% if (idNo != null && !idNo.trim().isEmpty()) { %>
            <p class="doctor-actions">
                <a class="doctor-view-link" href="DoctorDetailsServlet?id_no=<%= idNo %>">View Full Profile</a>
            </p>
        <% } %>
    </div>
</div>
