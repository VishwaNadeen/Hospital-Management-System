<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    if (request.getAttribute("doctorsAll") == null) {
        request.getRequestDispatcher("/AllDoctorsServlet").forward(request, response);
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
    <meta charset="UTF-8">
    <title>Doctor List</title>
    <link rel="stylesheet" href="css/AllDoctorsDisplay.css">
</head>
<body>
    <jsp:include page="/components/header.jsp" />

    <div class="search-container">
        <input type="text" id="searchInput" placeholder="Search doctors...">
    </div>
    
    <table border="1" id="doctorTable">
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
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
                <th>Created At</th>
                <th>Updated At</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="docs" items="${doctorsAll}">
                <tr>
                    <td>${docs.first_name}</td>
                    <td>${docs.last_name}</td>
                    <td>${docs.id_no}</td>
                    <td>${docs.username}</td>
                    <td>${docs.password}</td>
                    <td>${docs.dob}</td>
                    <td>${docs.gender}</td>
                    <td>${docs.phone}</td>
                    <td>${docs.email}</td>
                    <td>${docs.address}</td>
                    <td>${docs.specialization}</td>
                    <td>${docs.qualification}</td>
                    <td>${docs.experience_years}</td>
                    <td>${docs.availability}</td>
                    <td>${docs.status}</td>
                    <td>${docs.created_at}</td>
                    <td>${docs.updated_at}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div class="home-link">
        <a href="pages/doctor/doctorList.jsp"><- Back to Doctors</a>
    </div>
    
    <script>
    function filterTable() {
        var input, filter, table, tr, td, i, j, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("doctorTable");
        tr = table.getElementsByTagName("tr");
        
        // Loop through all table rows (starting from index 1 to skip header)
        for (i = 1; i < tr.length; i++) {
            var found = false;
            td = tr[i].getElementsByTagName("td");
            
            // Loop through all table columns
            for (j = 0; j < td.length - 1; j++) { // Skip the last column (Action column)
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        found = true;
                        break;
                    }
                }
            }
            
            if (found) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
    
    document.getElementById("searchInput").addEventListener("input", filterTable);
    </script>
    
</body>
</html>

