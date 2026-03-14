<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Medication</title>
    
    <link rel="stylesheet" type="text/css" href="css/PharmacistSearch.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>

<jsp:include page="/components/header.jsp" />

<div class="pharmacist-container">
    <div class="glass-card">
        <div class="card-header">
            <h2><i class="fas fa-search"></i> Search Medication</h2>
            <p>Enter the item ID to find specific medication information</p>
        </div>
        
        <form action="PharmacistServlet" method="post" class="search-form">
            <div class="search-group">
                <label for="item_id">
                    <i class="fas fa-fingerprint"></i> Item ID
                </label>
                <div class="search-input-container">
                    <input type="text" id="item_id" name="item_id" placeholder="Enter medication ID" required>
                    <button type="submit" name="submit" class="search-btn">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                <div class="search-help">
                    <p>Enter the unique identifier of the medication to search</p>
                </div>
            </div>
            
            <div class="search-options">
                <h4>Filter by:</h4>
                <div class="options-grid">
                    <div class="option-item">
                        <input type="checkbox" id="inStock" name="filter" value="inStock">
                        <label for="inStock">In Stock</label>
                    </div>
                    <div class="option-item">
                        <input type="checkbox" id="expiring" name="filter" value="expiring">
                        <label for="expiring">Expiring Soon</label>
                    </div>
                    <div class="option-item">
                        <input type="checkbox" id="lowStock" name="filter" value="lowStock">
                        <label for="lowStock">Low Stock</label>
                    </div>
                </div>
            </div>
            
            <div class="form-actions">
                <button type="submit" name="submit" value="Submit" class="btn-submit">
                    <i class="fas fa-search"></i> Search
                </button>
                <a href="pages/pharmacy/PharmacistHome.jsp" class="btn-return">
                    <i class="fas fa-home"></i> Back to Home
                </a>
            </div>
        </form>
    </div>
    
    <div class="search-tips glass-card">
        <h3><i class="fas fa-lightbulb"></i> Search Tips</h3>
        <ul>
            <li>Use the exact Item ID for precise results</li>
            <li>Check the inventory page for a list of all available medications</li>
            <li>You can filter search results using the options above</li>
        </ul>
    </div>
</div>

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