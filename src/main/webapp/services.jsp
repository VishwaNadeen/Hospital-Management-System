<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Our Services</title>
    <link rel="stylesheet" href="css/Services.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="services-container-hms">
    <h1 class="services-title-hms">Our Hospital Services</h1>

    <div class="service-card-hms" onclick="goToDoctorPage()">
        <img src="images/consultation.png" alt="Consultation" class="service-icon-hms">
        <h2 class="service-name-hms">Doctor Consultation</h2>
        <p class="service-desc-hms">Experienced doctors available for in-person and virtual consultations.</p>
    </div>

    <div class="service-card-hms">
        <img src="images/labtest.png" alt="Lab Tests" class="service-icon-hms">
        <h2 class="service-name-hms">Laboratory Services</h2>
        <p class="service-desc-hms">Comprehensive diagnostic tests with timely and accurate reports.</p>
    </div>

    <div class="service-card-hms" onclick="goToPharmacyPage()">
        <img src="images/pharmacy.png" alt="Pharmacy" class="service-icon-hms">
        <h2 class="service-name-hms">Pharmacy</h2>
        <p class="service-desc-hms">Get prescribed medicines at our on-site pharmacy or order online.</p>
    </div>

    <div class="service-card-hms">
        <img src="images/emergency.png" alt="Emergency" class="service-icon-hms">
        <h2 class="service-name-hms">24/7 Emergency</h2>
        <p class="service-desc-hms">Immediate medical care and ambulance service anytime.</p>
    </div>

    <div class="service-card-hms">
        <img src="images/inpatient.png" alt="Inpatient" class="service-icon-hms">
        <h2 class="service-name-hms">Inpatient Care</h2>
        <p class="service-desc-hms">Well-equipped rooms and constant monitoring for admitted patients.</p>
    </div>

    <div class="service-card-hms">
        <img src="images/operation.png" alt="Surgery" class="service-icon-hms">
        <h2 class="service-name-hms">Surgical Services</h2>
        <p class="service-desc-hms">Advanced surgical facilities handled by skilled surgeons and staff.</p>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script>
    function goToPharmacyPage() {
        window.location.href = "orderInsert.jsp";
    }
    
    function goToDoctorPage() {
        window.location.href = "DoctorsListServlet";
    }
</script>


</body>
</html>
