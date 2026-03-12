<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 style="color: red;">
        <% if(session.getAttribute("error") != null) { %>
            Error: <%= session.getAttribute("error") %>
        <% } else { %>
            Operation Failed! Please try again.
        <% } %>
    </h2>
    <a href="Login.jsp">Back to Form</a>
</body>
</html>