<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
<meta charset="UTF-8">
<title>Record Display</title>
<link rel="stylesheet" href="css/RecordDisplay.css">
</head>
<body>
    <jsp:include page="/components/header.jsp" />
    <div class="container">
        <h1>Patient Medical Record</h1>
        
        <c:forEach var="rec" items="${recDetails}">
            <div class="record-container">
                <div class="record-field">
                    <strong>NIC Number:</strong> ${rec.nic}
                </div>
                <div class="record-field">
                    <strong>Age:</strong> ${rec.age}
                </div>
                <div class="record-field">
                    <strong>Gender:</strong> ${rec.gender}
                </div>
                <div class="record-field">
                    <strong>Medical History:</strong> ${rec.medicalHistory}
                </div>
                <div class="record-field">
                    <strong>Vital Signs:</strong> ${rec.vitalSigns}
                </div>
                <div class="record-field">
                    <strong>Diagnosis:</strong> ${rec.diagnosis}
                </div>
                <div class="record-field">
                    <strong>Treatment Plan:</strong> ${rec.treatmentPlan}
                </div>
                <div class="record-field">
                    <strong>Date:</strong> ${rec.date}
                </div>
            </div>
            
            <c:set var="nic" value="${rec.nic}"/>
            <c:set var="age" value="${rec.age}"/>
            <c:set var="gender" value="${rec.gender}"/>
            <c:set var="medicalHistory" value="${rec.medicalHistory}"/>
            <c:set var="vitalSigns" value="${rec.vitalSigns}"/>
            <c:set var="diagnosis" value="${rec.diagnosis}"/>
            <c:set var="treatmentPlan" value="${rec.treatmentPlan}"/>
            <c:set var="date" value="${rec.date}"/>
        </c:forEach>

        <div class="button-group">
            <c:url value="pages/record/UpdateRecord.jsp" var="recUpdate">
                <c:param name="nic" value="${nic}"/>
                <c:param name="age" value="${age}"/>
                <c:param name="gender" value="${gender}"/>
                <c:param name="medicalHistory" value="${medicalHistory}"/>
                <c:param name="vitalSigns" value="${vitalSigns}"/>
                <c:param name="diagnosis" value="${diagnosis}"/>
                <c:param name="treatmentPlan" value="${treatmentPlan}"/>
                <c:param name="date" value="${date}"/>
            </c:url>
            <a href="${recUpdate}" class="btn-update">Update Record</a>

            <c:url value="pages/record/DeleteRecord.jsp" var="recDelete">
                <c:param name="nic" value="${nic}"/>
                <c:param name="age" value="${age}"/>
                <c:param name="gender" value="${gender}"/>
                <c:param name="medicalHistory" value="${medicalHistory}"/>
                <c:param name="vitalSigns" value="${vitalSigns}"/>
                <c:param name="diagnosis" value="${diagnosis}"/>
                <c:param name="treatmentPlan" value="${treatmentPlan}"/>
                <c:param name="date" value="${date}"/>
            </c:url>
            <a href="${recDelete}" class="btn-delete">Delete Record</a>

            <a href="pages/record/SearchRecord.jsp" class="btn-cancel">Back to Search</a>
        </div>
    </div>
</body>
</html>

