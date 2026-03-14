<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="css/updatePharmacist.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    
</head>
<body>

<jsp:include page="/components/header.jsp" />

		<%	
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String type = request.getParameter("type");
			String stock = request.getParameter("stock");
			String price = request.getParameter("price");
			String sname = request.getParameter("sname");
			String rdate = request.getParameter("rdate");
			String exp = request.getParameter("exp");
			String status = request.getParameter("status");
			String description = request.getParameter("description");
		
		%>
		
		<form action="UpdatePharmacistServlet" method = "post">
		Item Id <input type = "text" name="id" value = "<%=id%>"readonly><br>
		Name<input type = "text" name="name" value = "<%=name%>"><br>
		Item Type<input type = "text" name="type" value = "<%=type%>"><br>
		Quantity in Stock<input type = "text" name="stock" value = "<%=stock%>"><br>
		Unit Price<input type = "text" name="price" value = "<%=price%>"><br>
		Supplier Name<input type = "text" name="sname" value = "<%=sname%>"><br>
		Date Received<input type = "text" name="rdate" value = "<%=rdate%>"><br>
		Expire Date<input type = "text" name="exp" value = "<%=exp%>"><br>
		Status<input type = "text" name="status" value = "<%=status%>"><br>
		Description<input type = "text" name="description" value = "<%=description%>"><br>
		
		<input type = "submit" name="submit" value = "Confirm Update"><br>
	</form> 
	
	<jsp:include page="/components/footer.jsp" />

    <script>
        // Mobile menu toggle
        const mobileMenu = document.querySelector('.nav-menu');
        const menuToggle = document.querySelector('.menu-toggle') || document.createElement('div');
        
        if (!document.querySelector('.menu-toggle')) {
            menuToggle.classList.add('menu-toggle');
            menuToggle.innerHTML = '<i class="fas fa-bars"></i>';
            document.querySelector('.header') && document.querySelector('.header').appendChild(menuToggle);
        }
        
        menuToggle.addEventListener('click', () => {
            mobileMenu && mobileMenu.classList.toggle('active');
        });

        // Smooth Scroll
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                const href = this.getAttribute('href');
                if (href !== "#") {
                    e.preventDefault();
                    document.querySelector(href) && document.querySelector(href).scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            });
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>