<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - MediCare</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css?v=<%= System.currentTimeMillis() %>">
</head>
<body class="login-page">
<jsp:include page="header.jsp" />

<main class="login-main">
    <section class="login-shell">
        <div class="login-card">
            <h2>Account Login</h2>
            <p class="sub">Enter your username and password.</p>

            <% String error = request.getParameter("error"); %>
            <% if (error != null && !error.isEmpty()) { %>
                <div class="login-alert" role="alert"><%= error %></div>
            <% } %>

            <form method="post" action="LoginServlet" class="login-form" autocomplete="on">
                <label for="username">Username</label>
                <div class="input-wrap">
                    <i class="bi bi-person"></i>
                    <input id="username" type="text" name="username" required autofocus>
                </div>

                <label for="password">Password</label>
                <div class="input-wrap">
                    <i class="bi bi-key"></i>
                    <input id="password" type="password" name="password" required>
                </div>

                <button type="submit" class="btn-login">
                    <i class="bi bi-box-arrow-in-right"></i>
                    <span>Sign In</span>
                </button>
            </form>
        </div>
    </section>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
