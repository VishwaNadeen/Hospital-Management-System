<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Verify ID - MediHome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <jsp:include page="header.jsp" />
    <div class="container mt-5" style="max-width: 500px;">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">View Appointments</h4>
            </div>
            <div class="card-body">
                <!-- Directly submit to GetAllServlet -->
                <form action="GetAllServlet" method="get">
                    <div class="mb-3">
                        <label class="form-label">Enter Your ID Number</label>
                        <input type="text" name="id" class="form-control" required 
                               placeholder="National ID/NIC">
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">View Appointments</button>
                    </div>
                </form>
                
                <!-- Error Message Display -->
                <% if(request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger mt-3">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>

