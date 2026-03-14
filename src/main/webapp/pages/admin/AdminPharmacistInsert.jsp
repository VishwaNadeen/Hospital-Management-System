<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Inventory Item</title>

    <link rel="stylesheet" type="text/css" href="css/pharmacistInsert.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
<div class="pharmacist-container">
    <div class="glass-card">
        <div class="card-header">
            <h2><i class="fas fa-plus-circle"></i> Add New Medication</h2>
            <p>Enter details to add a new item to inventory</p>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger" role="alert"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="PharmacistInsert" method="post" class="insert-form">
            <div class="form-row">
                <div class="form-group">
                    <label for="id"><i class="fas fa-fingerprint"></i> Item ID</label>
                    <input type="text" id="id" name="id" required>
                </div>

                <div class="form-group">
                    <label for="name"><i class="fas fa-prescription-bottle-alt"></i> Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="type"><i class="fas fa-pills"></i> Type</label>
                    <input type="text" id="type" name="type" required>
                </div>

                <div class="form-group">
                    <label for="stock"><i class="fas fa-cubes"></i> Quantity in Stock</label>
                    <input type="number" id="stock" name="stock" min="1" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="price"><i class="fas fa-tag"></i> Unit Price</label>
                    <input type="number" id="price" name="price" step="0.01" min="0" required>
                </div>

                <div class="form-group">
                    <label for="sname"><i class="fas fa-truck"></i> Supplier Name</label>
                    <input type="text" id="sname" name="sname" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="rdate"><i class="fas fa-calendar-check"></i> Date Received</label>
                    <input type="date" id="rdate" name="rdate" readonly>
                </div>

                <div class="form-group">
                    <label for="exp"><i class="fas fa-calendar-times"></i> Expire Date</label>
                    <input type="date" id="exp" name="exp" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="status"><i class="fas fa-info-circle"></i> Status</label>
                    <select id="status" name="status" required>
                        <option value="">Select status</option>
                        <option value="In Stock">In Stock</option>
                        <option value="Low Stock">Low Stock</option>
                        <option value="Out of Stock">Out of Stock</option>
                        <option value="Discontinued">Discontinued</option>
                    </select>
                </div>
            </div>

            <div class="form-row full-width">
                <div class="form-group">
                    <label for="description"><i class="fas fa-file-medical-alt"></i> Description</label>
                    <textarea id="description" name="description" rows="3"></textarea>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" name="submit" class="btn-submit">
                    <i class="fas fa-save"></i> Add Item
                </button>
                <a href="pages/admin/AdminPharmacistPanel.jsp" class="btn-cancel">
                    <i class="fas fa-times"></i> Back
                </a>
            </div>
        </form>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const today = new Date();
        const yyyy = today.getFullYear();
        const mm = ('0' + (today.getMonth() + 1)).slice(-2);
        const dd = ('0' + today.getDate()).slice(-2);
        const todayStr = yyyy + '-' + mm + '-' + dd;

        document.getElementById("rdate").value = todayStr;

        const tomorrow = new Date(today);
        tomorrow.setDate(tomorrow.getDate() + 1);
        const minExpDate =
            tomorrow.getFullYear() + '-' +
            ('0' + (tomorrow.getMonth() + 1)).slice(-2) + '-' +
            ('0' + tomorrow.getDate()).slice(-2);

        document.getElementById("exp").setAttribute("min", minExpDate);
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
