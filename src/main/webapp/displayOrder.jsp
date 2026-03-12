<%@ page import="Order.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Order order = (Order) request.getAttribute("order");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/orderDetails.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
	<!-- Header Section -->
<jsp:include page="header.jsp" />


    <div class="order-details-container">
        <h2 class="order-details-heading">Order Details</h2>
        <% if (order != null) { %>
            <div class="order-details-info">
                <div class="order-details-group">
                    <h3 class="order-details-subheading">Order Information</h3>
                    <p><strong>ID:</strong> <%= order.getId() %></p>
                    <p><strong>Title:</strong> <%= order.getTitle() %></p>
                    <p><strong>Name:</strong> <%= order.getName() %></p>
                    <p><strong>Age:</strong> <%= order.getAge() %></p>
                    <p><strong>Gender:</strong> <%= order.getGender() %></p>
                </div>
                <div class="order-details-group">
                    <h3 class="order-details-subheading">Contact Information</h3>
                    <p><strong>Phone:</strong> <%= order.getPhone() %></p>
                    <p><strong>Email:</strong> <%= order.getEmail() %></p>
                    <p><strong>Address:</strong> <%= order.getAddress() %></p>
                </div>
                <div class="order-details-group">
                    <h3 class="order-details-subheading">Additional Information</h3>
                    <p><strong>Comments:</strong> <%= order.getComments() %></p>
                </div>
            </div>

            <% if (order.getImage() != null) { %>
                <div class="order-details-image-container">
                    <img src="imageServlet?id=<%= order.getId() %>" class="order-details-image" alt="Patient Image"/>
                </div>
            <% } else { %>
                <div class="order-details-image-container">
                    <p class="order-details-no-image">No image uploaded.</p>
                </div>
            <% } %>
        <% } else { %>
            <div class="order-details-not-found">
                <p>Order not found.</p>
            </div>
        <% } %>

        <% if (order != null) { %>
            <div class="order-details-buttons">
                <form action="LoadOrderForUpdate" method="get">
                    <input type="hidden" name="id" value="<%= order.getId() %>" />
                    <input type="submit" value="Update Order" class="order-details-update-btn">
                </form>

                <form action="DeleteOrderServlet" method="get">
                    <input type="hidden" name="id" value="<%= order.getId() %>" />
                    <input type="submit" value="Delete Order" class="order-details-delete-btn" onclick="return confirm('Are you sure you want to delete this order?')" />
                </form>
            </div>
        <% } %>
    </div>
    <!-- Chatbot -->
	<div class="chatbot-icon">
		<i class="fas fa-robot"></i>
	</div>
	
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

// Chatbot Interaction
const chatbot = document.querySelector('.chatbot-icon');
chatbot.addEventListener('click', () => {
    // Add chatbot modal logic
    alert('Welcome! How can I assist you today?');
});
    </script>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
	</script>
		

</body>
</html>