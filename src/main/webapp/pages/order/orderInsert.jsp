<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="Make Order - MediCare">
<head>
    <base href="<%= request.getContextPath() %>/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacy - MediCare Hub</title>

    <link rel="stylesheet" type="text/css" href="css/orderInsert.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>

	<!-- Header Section -->
<jsp:include page="/components/header.jsp" />

<div class="pharmacy-order-container">

    <h2 class="pharmacy-order-heading">Existing Orders</h2>
    <p class="pharmacy-order-subtitle">Enter order ID to search for an existing order</p>

    <div class="pharmacy-search-box">
        <input type="text" id="pharmacyOrderId" placeholder="Enter Order ID">
        <button onclick="searchPharmacyOrder()"><i class="fas fa-search"></i> Search Order</button>
    </div>

    <h2 class="pharmacy-order-heading">Create New Order</h2>
    <p class="pharmacy-order-subtitle">Enter order details to place order</p>
    
    <form action="InsertOrderServlet" method="post" enctype="multipart/form-data" class="pharmacy-order-form">

        <div class="pharmacy-input-group">
            <label for="title">Title:</label>
            <select name="title" required>
                <option value="" disabled selected>Select Title</option>
                <option value="Mr.">Mr.</option>
                <option value="Mrs.">Mrs.</option>
                <option value="Miss.">Miss.</option>
                <option value="Dr.">Dr.</option>
            </select>
        </div>

        <div class="pharmacy-input-group">
            <label for="name">Full Name:</label>
            <input type="text" name="name" placeholder="Enter full name" required>
        </div>

        <div class="pharmacy-input-group">
            <label for="age">Age:</label>
            <input type="text" name="age" placeholder="Enter age" required>
        </div>

        <div class="pharmacy-input-group">
            <label for="gender">Gender:</label>
            <select name="gender" required>
                <option value="" disabled selected>Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="pharmacy-input-group">
            <label for="phone">Phone:</label>
            <input type="text" name="phone" placeholder="Enter contact number" required>
        </div>

        <div class="pharmacy-input-group">
            <label for="email">Email:</label>
            <input type="email" name="email" placeholder="Enter email address" required>
        </div>

        <div class="pharmacy-input-group">
            <label for="address">Address:</label>
            <input type="text" name="address" placeholder="Enter full address" required>
        </div>

        <div class="pharmacy-input-group">
            <label for="image">Prescription Photo:</label>
            <input type="file" name="image" accept="image/*" required>
        </div>

        <div class="pharmacy-input-group pharmacy-full-width">
            <label for="comments">Medical Notes:</label>
            <textarea name="comments" placeholder="Enter any relevant medical history or notes"></textarea>
        </div>

        <div class="pharmacy-btn-group">
            <input type="submit" value="Submit Order" class="pharmacy-submit-btn">
            <button type="button" class="pharmacy-cancel-btn" onclick="window.location.href='pages/home/Home.jsp'">Cancel</button>
        </div>
    </form>
</div>
<!-- Chatbot -->
	<div class="chatbot-icon">
		<i class="fas fa-robot"></i>
	</div>
	
	<!-- FOOTER SECTION -->
	<jsp:include page="/components/footer.jsp" />

<script>
function searchPharmacyOrder() {
    const id = document.getElementById("pharmacyOrderId").value;
    if (!id.trim()) {
        alert("Please enter a valid Order ID");
        return;
    }
    window.location.href = "SearchOrderServlet?id=" + encodeURIComponent(id);
}
</script>
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