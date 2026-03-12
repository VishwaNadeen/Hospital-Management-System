<%@ page import="Order.Order" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Order order = (Order) request.getAttribute("order");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Order</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/updateOrder.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="uo-main-content">
        <div class="uo-container">
            <div class="uo-form-container">
                <h2 class="uo-form-title">Update Order Details</h2>
                <form action="UpdateOrderServlet" method="post" enctype="multipart/form-data" class="uo-form-grid">
                    <input type="hidden" name="id" value="<%= order.getId() %>">

                    <div class="uo-form-group">
                        <label for="uo-title">Title</label>
                        <input type="text" id="uo-title" name="title" value="<%= order.getTitle() %>" required>
                    </div>

                    <div class="uo-form-group">
                        <label for="uo-name">Name</label>
                        <input type="text" id="uo-name" name="name" value="<%= order.getName() %>" required>
                    </div>

                    <div class="uo-form-group">
                        <label for="uo-age">Age</label>
                        <input type="number" id="uo-age" name="age" value="<%= order.getAge() %>" required>
                    </div>

                    <div class="uo-form-group">
                        <label for="uo-gender">Gender</label>
                        <input type="text" id="uo-gender" name="gender" value="<%= order.getGender() %>" required>
                    </div>

                    <div class="uo-form-group">
                        <label for="uo-phone">Phone</label>
                        <input type="tel" id="uo-phone" name="phone" value="<%= order.getPhone() %>" required>
                    </div>

                    <div class="uo-form-group">
                        <label for="uo-email">Email</label>
                        <input type="email" id="uo-email" name="email" value="<%= order.getEmail() %>" required>
                    </div>

                    <div class="uo-form-group">
                        <label for="uo-address">Address</label>
                        <input type="text" id="uo-address" name="address" value="<%= order.getAddress() %>" required>
                    </div>

                    <div class="uo-form-group">
                        <label for="uo-image">New Image</label>
                        <div class="uo-file-upload">
                            <input type="file" id="uo-image" name="image" accept="image/*">
                            <span class="uo-file-upload-text">Choose File</span>
                        </div>
                    </div>

                    <div class="uo-form-group">
                        <label for="uo-comments">Comments</label>
                        <textarea id="uo-comments" name="comments" rows="4" required><%= order.getComments() %></textarea>
                    </div>

                    <div class="uo-form-actions">
                        <input type="submit" value="Update Order" class="uo-submit-btn">
                        <a href="orderInsert.jsp" class="uo-cancel-btn">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
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
