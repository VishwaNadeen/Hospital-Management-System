<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
  <!--  <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">-->

<link rel="stylesheet" href="<%=request.getContextPath()%>/CS/app.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
			<a class="navbar-brand" href="#"><span class="text-primary">Medi</span>Home</a>
			<div class="d-flex gap-4 align-items-center">
				<a class="text-decoration-none text-dark fw-medium"
					onclick="showPatientForm()">APPOINTMENT</a>
					 <a href="IdInput.jsp" class="text-decoration-none text-dark fw-medium">VIEW APPOINTMENT</a>
					 <a class="text-decoration-none text-primary small">user</a>
			</div>
		</div>
 <h2 style="color: green;"> Done!</h2>
    
</body>
</html>