<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medical Record Search</title>
    <link rel="stylesheet" href="cssrec/Searchrecord.css">
</head>
<body class="record-search-body">
    <jsp:include page="header.jsp" />

    <div class="record-search-container">
        <h1 class="record-search-heading">Medical Records Management</h1>

        <%-- Error message display --%>
        <% if(request.getParameter("error") != null) { %>
            <div class="record-search-error-message">
                <%= request.getParameter("error") %>
            </div>
        <% } %>

        <div class="record-search-form-wrapper">
            <form action="SearchServlet" method="post" class="record-search-form">
                <h2 class="record-search-subheading">Search Medical Record</h2>
                <div class="record-search-form-group">
                    <label for="record-search-id">Record ID</label>
                    <input type="text" id="record-search-id" name="nicID" required>
                </div>
                <button type="submit" class="record-search-btn-search">Search</button>
            </form>

            <form class="record-search-form-group" action="EnterRecord.jsp">
                <h2 class="record-search-subheading">Create New Record</h2>
                <button type="submit" class="record-search-btn-create">Create</button>
            </form>

            <form class="record-search-form-group" action="Home.jsp">
                <button type="submit" class="record-search-btn-back">Back to Home</button>
            </form>
        </div>
    </div>

</body>
</html>


