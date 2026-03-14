<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="DoctorPackage.Doctor" %>
<%@ page import="DoctorPackage.DoctorDBUtil" %>
<%
List<Doctor> doctorsAll = DoctorDBUtil.getAllDoctor();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Admin Panel</title>
    <link rel="stylesheet" href="css/AdminDoctorPanel.css?v=<%= System.currentTimeMillis() %>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="doctor-admin-page">
    <main class="doctor-admin-wrap">
        <% if (request.getAttribute("error") != null) { %>
            <div class="doctor-admin-error">
                <strong>Error:</strong> <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <section class="doctor-admin-single">
            <article class="doctor-unified-card">
                <section class="doctor-section doctor-section-search">
                    <div class="doctor-search-row">
                        <div class="doctor-search-group">
                            <input type="text" id="searchInput" placeholder="Search by name, ID, username, email, phone...">
                            <button type="button" id="searchTrigger" class="btn btn-primary search-btn">Search</button>
                        </div>
                        <a href="AdminDoctorAdd.jsp" class="btn btn-warning add-btn-inline">Add Doctor</a>
                    </div>
                </section>

                <section class="doctor-section doctor-section-list">
                    <div class="doctor-table-shell">
                        <table id="doctorTable">
                            <thead>
                                <tr>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>ID</th>
                                    <th>Username</th>
                                    <th>DOB</th>
                                    <th>Gender</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Specialization</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% for (Doctor docs : doctorsAll) { %>
                                <tr>
                                    <td><%= docs.getFirst_name() %></td>
                                    <td><%= docs.getLast_name() %></td>
                                    <td><%= docs.getId_no() %></td>
                                    <td><%= docs.getUsername() %></td>
                                    <td><%= docs.getDob() %></td>
                                    <td><%= docs.getGender() %></td>
                                    <td><%= docs.getPhone() %></td>
                                    <td><%= docs.getEmail() %></td>
                                    <td><%= docs.getSpecialization() %></td>
                                    <td><%= docs.getStatus() %></td>
                                </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </section>
            </article>
        </section>
    </main>

    <script>
        function filterDoctorTable() {
            const filter = document.getElementById('searchInput').value.toUpperCase();
            const rows = document.querySelectorAll('#doctorTable tbody tr');
            rows.forEach((row) => {
                const txt = row.textContent || row.innerText;
                row.style.display = txt.toUpperCase().indexOf(filter) > -1 ? '' : 'none';
            });
        }

        document.getElementById('searchInput').addEventListener('input', filterDoctorTable);
        document.getElementById('searchTrigger').addEventListener('click', filterDoctorTable);
        document.getElementById('searchInput').addEventListener('keydown', function (event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                filterDoctorTable();
            }
        });
    </script>
</body>
</html>
