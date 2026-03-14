<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Doctor</title>
    <link rel="stylesheet" href="css/AdminDoctorAdd.css?v=<%= System.currentTimeMillis() %>">
</head>
<body class="admin-doctor-add-page">
    <main class="add-wrap">
        <section class="add-card">
            <header class="add-head">
                <div>
                    <h2>Add New Doctor</h2>
                    <p>Create a new doctor record from the embedded admin workspace.</p>
                </div>
                <a href="AdminDoctorPanel.jsp" class="back-link">Back</a>
            </header>

            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="add-error"><%= request.getAttribute("errorMessage") %></div>
            <% } %>

            <form action="DoctorInsertServlet" method="post" class="add-form" id="doctorAddForm">
                <input type="hidden" name="source" value="adminEmbed">
                <input type="hidden" id="update" name="update">

            <div class="row-2">
                <div class="field"><label for="fname">First Name</label><input type="text" id="fname" name="fname" required></div>
                <div class="field"><label for="lname">Last Name</label><input type="text" id="lname" name="lname" required></div>
            </div>

            <div class="row-2">
                <div class="field"><label for="id">Identity Number</label><input type="text" id="id" name="id" required></div>
                <div class="field"><label for="uname">Username</label><input type="text" id="uname" name="uname" required></div>
            </div>

            <div class="row-2">
                <div class="field"><label for="psw">Password</label><input type="password" id="psw" name="psw" required></div>
                <div class="field"><label for="dob">Date of Birth</label><input type="date" id="dob" name="dob" required></div>
            </div>

            <div class="row-2">
                <div class="field"><label for="gender">Gender</label>
                    <select id="gender" name="gender" required>
                        <option value="">-- Select Gender --</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="field"><label for="number">Phone Number</label><input type="tel" id="number" name="number" required></div>
            </div>

            <div class="row-2">
                <div class="field"><label for="email">Email</label><input type="email" id="email" name="email" required></div>
                <div class="field"><label for="address">Address</label><input type="text" id="address" name="address" required></div>
            </div>

            <div class="row-2">
                <div class="field"><label for="spe">Specialization</label><input type="text" id="spe" name="spe"></div>
                <div class="field"><label for="qua">Qualification</label><input type="text" id="qua" name="qua"></div>
            </div>

            <div class="row-2">
                <div class="field"><label for="exp">Experience Years</label><input type="number" id="exp" name="exp"></div>
                <div class="field"><label for="availability">Availability</label>
                    <select id="availability" name="availability">
                        <option value="">-- Select Availability --</option>
                        <option value="Weekday">Weekday</option>
                        <option value="Weekend">Weekend</option>
                    </select>
                </div>
            </div>

            <div class="row-2">
                <div class="field"><label for="status">Status</label>
                    <select id="status" name="status">
                        <option value="">-- Select Status --</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
                <div class="field"><label for="create">Created At</label><input type="date" id="create" name="create" readonly></div>
            </div>

                <button type="submit" class="submit-btn">Create Doctor</button>
            </form>
        </section>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('create').value = today;
            document.getElementById('update').value = today;

            const dobField = document.getElementById('dob');
            dobField.setAttribute('max', today);

            document.getElementById('doctorAddForm').addEventListener('submit', function (event) {
                const phoneNumber = document.getElementById('number').value;
                if (!/^\d{10}$/.test(phoneNumber)) {
                    alert('Phone number must be exactly 10 digits.');
                    event.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
