<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medical Records Admin Panel</title>
    <link rel="stylesheet" href="css/AdminMedicalRecordPanel.css?v=<%= System.currentTimeMillis() %>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="medical-admin-page">
    <main class="medical-admin-wrap">
        <section class="medical-admin-single">
            <% if (request.getParameter("error") != null) { %>
                <div class="medical-admin-error"><%= request.getParameter("error") %></div>
            <% } %>

            <article class="medical-unified-card">
                <section class="medical-section medical-section-search">
                    <div class="medical-search-row">
                        <form action="SearchServlet" method="post" class="medical-search-group" id="recordSearchForm">
                            <input type="hidden" name="source" value="adminEmbed">
                            <input type="text" id="searchInput" name="nicID" placeholder="Search medical record by NIC / Record ID..." required>
                            <button type="submit" id="searchTrigger" class="btn btn-primary search-btn">Search</button>
                        </form>
                        <a href="pages/record/EnterRecord.jsp" class="btn btn-warning add-btn-inline">Add Record</a>
                    </div>
                </section>

                <section class="medical-section medical-section-info">
                    <div class="medical-info-grid">
                        <article class="medical-info-card">
                            <h3><i class="fa-solid fa-file-medical"></i> Search Records</h3>
                            <p>Find a patient record quickly using NIC or record identifier.</p>
                        </article>
                        <article class="medical-info-card">
                            <h3><i class="fa-solid fa-user-plus"></i> Create Record</h3>
                            <p>Add a new medical record with diagnosis and treatment details.</p>
                        </article>
                        <article class="medical-info-card">
                            <h3><i class="fa-solid fa-shield-heart"></i> Update Workflow</h3>
                            <p>After searching, you can update or delete from the record detail page.</p>
                        </article>
                    </div>
                </section>
            </article>
        </section>
    </main>
</body>
</html>
