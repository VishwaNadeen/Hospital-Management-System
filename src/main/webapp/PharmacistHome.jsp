<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacist Portal</title>
    
    <link rel="stylesheet" type="text/css" href="css/PharmacistHome.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>

<body>
    <jsp:include page="header.jsp" />

    <div class="pharmacist-container">
        <div class="glass-card">
            <div class="card-header">
                <h2><i class="fas fa-pills"></i> Pharmacist Dashboard</h2>
                <p>Manage your pharmacy inventory and operations</p>
            </div>
            
            <div class="action-buttons">
                <a href="pharmacistInsert.jsp" class="action-btn insert-btn">
                    <div class="btn-icon"><i class="fas fa-plus-circle"></i></div>
                    <div class="btn-text">
                        <h3>Add New Medication</h3>
                        <p>Insert new products into inventory</p>
                    </div>
                </a>
                
                <form action="PharmacistGetAllServlet" method="post" class="action-form">
                    <button type="submit" class="action-btn inventory-btn">
                        <div class="btn-icon"><i class="fas fa-boxes"></i></div>
                        <div class="btn-text">
                            <h3>Inventory Management</h3>
                            <p>View and manage all medication stock</p>
                        </div>
                    </button>
                </form>
                
                <a href="PharmacistSearch.jsp" class="action-btn search-btn">
                    <div class="btn-icon"><i class="fas fa-search"></i></div>
                    <div class="btn-text">
                        <h3>Search Medications</h3>
                        <p>Find specific items in your inventory</p>
                    </div>
                </a>
            </div>
            
            <div class="quick-stats">
                <div class="stat-card">
                    <i class="fas fa-clipboard-list"></i>
                    <h4>Today's Tasks</h4>
                    <span class="stat-number">5</span>
                </div>
                <div class="stat-card">
                    <i class="fas fa-bell"></i>
                    <h4>Alerts</h4>
                    <span class="stat-number">2</span>
                </div>
                <div class="stat-card">
                    <i class="fas fa-calendar-check"></i>
                    <h4>Orders</h4>
                    <span class="stat-number">8</span>
                </div>
            </div>
        </div>
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