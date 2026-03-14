<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="/components/header.jsp" />
<h2 style="color: red;">
        <% if(session.getAttribute("error") != null) { %>
            Error: <%= session.getAttribute("error") %>
        <% } else { %>
            Operation Failed! Please try again.
        <% } %>
    </h2>
    <a href="pages/home/Login.jsp">Back to Form</a>
</body>
</html>

