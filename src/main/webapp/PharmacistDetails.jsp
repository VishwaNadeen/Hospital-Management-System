<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pharmaceutical Inventory</title>

	<link rel="stylesheet" type="text/css" href="css/PharmacistDetalis.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    
</head>
<body>

<jsp:include page="header.jsp" />

<h2>Pharmaceutical Inventory Management</h2>

<table>
    <thead>
        <tr>
            <th>Item ID</th>
            <th>Name</th>
            <th>Type</th>
            <th>Stock</th>
            <th>Unit Price</th>
            <th>Supplier</th>
            <th>Received Date</th>
            <th>Expiry Date</th>
            <th>Status</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="pha" items="${phaDetails}">
            <tr>
                <td>${pha.item_id}</td>
                <td>${pha.item_name}</td>
                <td>${pha.item_type}</td>
                <td>${pha.quantity_in_stock}</td>
                <td>${pha.unit_price}</td>
                <td>${pha.supplier_name}</td>
                <td>${pha.date_received}</td>
                <td>${pha.exp_date}</td>
                <td>${pha.status}</td>
                <td>${pha.description}</td>
                <td>
                    <div class="action-buttons">
                        <c:url value="updatePharmacist.jsp" var="phaUpdate">
                            <c:param name="id" value="${pha.item_id}"/>
                            <c:param name="name" value="${pha.item_name}"/>
                            <c:param name="type" value="${pha.item_type}"/>
                            <c:param name="stock" value="${pha.quantity_in_stock}"/>
                            <c:param name="price" value="${pha.unit_price}"/>
                            <c:param name="sname" value="${pha.supplier_name}"/>
                            <c:param name="rdate" value="${pha.date_received}"/>
                            <c:param name="status" value="${pha.status}"/>
                            <c:param name="exp" value="${pha.exp_date}"/>
                            <c:param name="description" value="${pha.description}"/>
                        </c:url>
                        <a href="${phaUpdate}" class="btn btn-update">Update</a>

                        <c:url value="deletepharmacist.jsp" var="phaDelete">
                            <c:param name="id" value="${pha.item_id}"/>
                            <c:param name="name" value="${pha.item_name}"/>
                        </c:url>
                        <a href="${phaDelete}" class="btn btn-delete">Delete</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="home-link">
    <a href="PharmacistHome.jsp">← Back to Dashboard</a>
</div>

<jsp:include page="footer.jsp" />

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