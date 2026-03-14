<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/AdminDashboard.css?v=<%= System.currentTimeMillis() %>">
</head>
<body class="admin-dashboard-page">
    <main class="admin-layout">
        <aside class="admin-sidebar">
            <div class="sidebar-brand">
                <span class="brand-icon"><i class="fa-solid fa-shield-halved"></i></span>
                <div>
                    <h1>Admin Panel</h1>
                    <p>Hospital Management</p>
                </div>
            </div>

            <nav class="sidebar-nav" aria-label="Admin navigation">
                <a class="nav-item active js-workspace-link" href="admin/AdminDoctorPanel.jsp" target="adminWorkspaceFrame" data-title="Doctor Portal" data-match="admin/AdminDoctorPanel.jsp,admin/AdminDoctorAdd.jsp,doctor/doctorInsert.jsp,doctor/AllDoctorsDisplay.jsp">
                    <i class="fa-solid fa-user-doctor"></i>
                    <span>Doctor Portal</span>
                </a>
                <a class="nav-item js-workspace-link" href="admin/AdminPharmacistPanel.jsp" target="adminWorkspaceFrame" data-title="Pharmacist Portal" data-match="admin/AdminPharmacistPanel.jsp,pharmacy/PharmacistHome.jsp,pharmacy/PharmacistSearch.jsp,pharmacy/pharmacistInsert.jsp,pharmacy/PharmacistDetails.jsp,pharmacy/pharmacistAllUpdate.jsp,pharmacy/AllDrugDetails.jsp">
                    <i class="fa-solid fa-capsules"></i>
                    <span>Pharmacist Portal</span>
                </a>
                <a class="nav-item js-workspace-link" href="admin/AdminMedicalRecordPanel.jsp" target="adminWorkspaceFrame" data-title="Medical Records" data-match="admin/AdminMedicalRecordPanel.jsp,record/SearchRecord.jsp,record/RecordDisplay.jsp,record/EnterRecord.jsp,record/UpdateRecord.jsp,record/DeleteRecord.jsp">
                    <i class="fa-solid fa-file-medical"></i>
                    <span>Medical Records</span>
                </a>
            </nav>

            <div class="sidebar-footer">
                <a class="logout-btn" href="pages/home/Home.jsp">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    <span>Log Out</span>
                </a>
            </div>
        </aside>

        <section class="admin-content">
            <header class="content-header">
                <div>
                    <h2 id="workspaceTitle">Doctor Portal</h2>
                </div>
            </header>

            <iframe
                class="workspace-frame"
                id="adminWorkspaceFrame"
                name="adminWorkspaceFrame"
                src="admin/AdminDoctorPanel.jsp"
                title="Admin module workspace"
                onload="resizeWorkspaceFrame(this)">
            </iframe>
        </section>
    </main>

    <script>
        function resizeWorkspaceFrame(frame) {
            try {
                const doc = frame.contentWindow.document;
                const bodyHeight = doc.body ? doc.body.scrollHeight : 0;
                const htmlHeight = doc.documentElement ? doc.documentElement.scrollHeight : 0;
                const nextHeight = Math.max(bodyHeight, htmlHeight, 700);
                frame.style.height = (nextHeight + 16) + 'px';
            } catch (e) {
                frame.style.height = '900px';
            }
        }

        (function () {
            const links = document.querySelectorAll('.js-workspace-link');
            const title = document.getElementById('workspaceTitle');
            const frame = document.getElementById('adminWorkspaceFrame');

            function setActiveByPage(pageName) {
                let hasMatch = false;
                links.forEach((item) => {
                    const matchList = (item.dataset.match || '')
                        .split(',')
                        .map((v) => v.trim())
                        .map((v) => v.split('/').pop());
                    if (matchList.includes(pageName)) {
                        item.classList.add('active');
                        hasMatch = true;
                        if (title) {
                            title.textContent = item.dataset.title || 'Admin Module';
                        }
                    } else {
                        item.classList.remove('active');
                    }
                });

                if (!hasMatch) {
                    const first = document.querySelector('.js-workspace-link');
                    if (first) {
                        first.classList.add('active');
                    }
                }
            }

            links.forEach((link) => {
                link.addEventListener('click', function () {
                    links.forEach((item) => item.classList.remove('active'));
                    this.classList.add('active');
                    if (title) {
                        title.textContent = this.dataset.title || 'Admin Module';
                    }
                });
            });

            if (frame) {
                frame.addEventListener('load', function () {
                    try {
                        const pageName = frame.contentWindow.location.pathname.split('/').pop();
                        if (pageName) {
                            setActiveByPage(pageName);
                        }
                    } catch (e) {
                        // Ignore cross-origin or inaccessible frame edge cases.
                    }
                });
            }
        })();
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
