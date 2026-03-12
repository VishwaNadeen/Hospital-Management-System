<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Pharmacist Item</title>
    <link rel="stylesheet" type="text/css" href="css/deletePharmacist.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body class="pharm-delete-body">

<!-- Header Section -->
	<jsp:include page="header.jsp" />
	

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

<h1 class="pharm-delete-title">Delete Pharmacist Inventory Item</h1>

<form action="DeletePharmacistServlet" method="post" class="pharm-delete-form">
    <input type="text" name="id" value="<%= id %>" readonly class="pharm-delete-input" placeholder="Item ID">
    <input type="text" name="name" value="<%= name %>" readonly class="pharm-delete-input" placeholder="Name">
    <input type="text" name="type" value="<%= type %>" readonly class="pharm-delete-input" placeholder="Item Type">
    <input type="text" name="stock" value="<%= stock %>" readonly class="pharm-delete-input" placeholder="Quantity in Stock">
    <input type="text" name="price" value="<%= price %>" readonly class="pharm-delete-input" placeholder="Unit Price">
    <input type="text" name="sname" value="<%= sname %>" readonly class="pharm-delete-input" placeholder="Supplier Name">
    <input type="text" name="rdate" value="<%= rdate %>" readonly class="pharm-delete-input" placeholder="Date Received">
    <input type="text" name="exp" value="<%= exp %>" readonly class="pharm-delete-input" placeholder="Expire Date">
    <input type="text" name="status" value="<%= status %>" readonly class="pharm-delete-input" placeholder="Status">
    <input type="text" name="description" value="<%= description %>" readonly class="pharm-delete-input" placeholder="Description">

    <input type="submit" value="Delete This Item" class="pharm-delete-button">
</form>


<!-- FOOTER SECTION -->
	<jsp:include page="footer.jsp" />

     <script>
                const mobileMenu = document.querySelector('.nav-menu');
          const menuToggle = document.createElement('div');
menuToggle.classList.add('menu-toggle');
menuToggle.innerHTML = '<i class="fas fa-bars"></i>';
document.querySelector('.header').appendChild(menuToggle);

menuToggle.addEventListener('click', () => {
    mobileMenu.classList.toggle('active');
});

// Smooth Scroll
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
    });
});
    </script>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
