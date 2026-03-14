<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
<meta charset="UTF-8">
<title>Delet Doctor Profile</title>
<link rel="stylesheet" type="text/css" href="css/doctorDelete.css">
</head>
<body>
    <jsp:include page="/components/header.jsp" />

	<%
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String id_no = request.getParameter("id_no");
		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String specialization = request.getParameter("specialization");
		String qualification = request.getParameter("qualification");
		String experience_years = request.getParameter("experience_years");
		String availability = request.getParameter("availability");
		String status = request.getParameter("status");
		String created_at = request.getParameter("created_at");
		String updated_at = request.getParameter("updated_at");
	
	%>
	
	<h1>Delete Details</h1>
	
	<form action="AllDoctorsDeleteServlet" method="post">
		First Name <input type="text" name="first_name" value="<%=first_name%>" readonly><br>
		Last Name <input type="text" name="last_name" value="<%=last_name%>" readonly><br>
		NIC Number <input type="text" name="id_no" value="<%=id_no%>" readonly><br>
		User Name <input type="text" name="user_name" value="<%=user_name%>" readonly><br>
		Date of Birth <input type="date" name="dob" value="<%=dob%>" readonly><br>
		Gender <input type="text" name="gender" value="<%=gender%>" readonly><br>
		Phone Number <input type="text" name="phone" value="<%=phone%>" readonly><br>
		Email <input type="email" name="email" value="<%=email%>" readonly><br>
		Address <input type="text" name="address" value="<%=address%>" readonly><br>
		Specialization <input type="text" name="specialization" value="<%=specialization%>" readonly><br>
		Qualification <input type="text" name="qualification" value="<%=qualification%>" readonly><br>
		Experience <input type="text" name="experience_years" value="<%=experience_years%>" readonly><br>
		Availability <input type="text" name="availability" value="<%=availability%>" readonly><br>
		Status <input type="text" name="status" value="<%=status%>" readonly><br>
		Created At <input type="date" name="created_at" value="<%=created_at%>" readonly><br>
		Updated At <input type="date" name="updated_at" value="<%=updated_at%>" readonly><br>
		
		<input type="submit" name="submit" value="Confirm Delete"><br>
		
	</form>
	
</body>
</html>

