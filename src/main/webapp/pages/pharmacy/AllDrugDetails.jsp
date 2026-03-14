<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="css/AllDrugDetails.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    
</head>
<body>

<jsp:include page="/components/header.jsp" />

<h2>Inventory Management</h2>
<input type="text" id="searchInput" placeholder="Search...">

<table border="1">
    <tr>
        <th>Item Id</th>
        <th>Name</th>
        <th>Item Type</th>
        <th>Quantity in Stock</th>
        <th>Unit Price</th>
        <th>Supplier Name</th>
        <th>Date Received</th>
        <th>Expire Date</th>
        <th>Status</th>
        <th>Description</th>
        <th>Action</th>
    </tr>
    
    <c:forEach var="phas" items="${allPharmacist}">
    <tr>
        <td>${phas.item_id}</td>
        <td>${phas.item_name}</td>
        <td>${phas.item_type}</td>
        <td>${phas.quantity_in_stock}</td>
        <td>${phas.unit_price}</td>
        <td>${phas.supplier_name}</td>
        <td>${phas.date_received}</td>
        <td>${phas.exp_date}</td>
        <td>${phas.status}</td>
        <td>${phas.description}</td>
        
        <td>
        	<a href="pages/pharmacy/pharmacistAllUpdate.jsp?item_id=${phas.item_id}&item_name=${phas.item_name}&item_type=${phas.item_type}&quantity_in_stock=${phas.quantity_in_stock}&unit_price=${phas.unit_price}&
        	supplier_name=${phas.supplier_name}&date_received=${phas.date_received}&exp_date=${phas.exp_date}&status=${phas.status}&description=${phas.description}">
        		<button type="submit">Update</button>
        	</a>
        	
        	<form action="DeleteAllServlet" method="post">
        		<button>Delete</button>
        	</form>
        </td>
    </tr>
    </c:forEach>
</table>

<jsp:include page="/components/footer.jsp" />

<script>
function filterTable() {
    var input, filter, table, tr, td, i, j, txtValue;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.querySelector("table");
    tr = table.getElementsByTagName("tr");
    
    // Loop through all table rows (starting from index 1 to skip header)
    for (i = 1; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td");
        var showRow = false;
        
        // Loop through all table columns
        for (j = 0; j < td.length; j++) {
            if (td[j]) {
                txtValue = td[j].textContent || td[j].innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    showRow = true;
                    break; // No need to check other columns if match found
                }
            }
        }
        
        // Show or hide the row based on whether a match was found
        tr[i].style.display = showRow ? "" : "none";
    }
}

document.getElementById("searchInput").addEventListener("input", filterTable);

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