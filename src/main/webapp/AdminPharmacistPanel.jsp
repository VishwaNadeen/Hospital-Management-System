<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="Pharmacist.Pharmacist" %>
<%@ page import="Pharmacist.PharmacistDBUtill" %>
<%
List<Pharmacist> allPharmacists = PharmacistDBUtill.getALLPharmacist();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacist Admin Panel</title>
    <link rel="stylesheet" href="css/AdminPharmacistPanel.css?v=<%= System.currentTimeMillis() %>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="pharmacist-admin-page">
    <main class="pharmacist-admin-wrap">
        <section class="pharmacist-admin-single">
            <article class="pharmacist-unified-card">
                <section class="pharmacist-section pharmacist-section-search">
                    <div class="pharmacist-search-row">
                        <div class="pharmacist-search-group">
                            <input type="text" id="searchInput" placeholder="Search by item id, name, type, supplier, status...">
                            <button type="button" id="searchTrigger" class="btn btn-primary search-btn">Search</button>
                        </div>
                        <a href="pharmacistInsert.jsp" class="btn btn-warning add-btn-inline">Add Item</a>
                    </div>
                </section>

                <section class="pharmacist-section pharmacist-section-list">
                    <div class="pharmacist-table-shell">
                        <table id="pharmacistTable">
                            <thead>
                                <tr>
                                    <th>Item ID</th>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Stock</th>
                                    <th>Unit Price</th>
                                    <th>Supplier</th>
                                    <th>Received</th>
                                    <th>Expire</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% for (Pharmacist pha : allPharmacists) { %>
                                <tr>
                                    <td><%= pha.getItem_id() %></td>
                                    <td><%= pha.getItem_name() %></td>
                                    <td><%= pha.getItem_type() %></td>
                                    <td><%= pha.getQuantity_in_stock() %></td>
                                    <td><%= pha.getUnit_price() %></td>
                                    <td><%= pha.getSupplier_name() %></td>
                                    <td><%= pha.getDate_received() %></td>
                                    <td><%= pha.getExp_date() %></td>
                                    <td><%= pha.getStatus() %></td>
                                </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </section>
            </article>
        </section>
    </main>

    <script>
        function filterPharmacistTable() {
            const filter = document.getElementById('searchInput').value.toUpperCase();
            const rows = document.querySelectorAll('#pharmacistTable tbody tr');
            rows.forEach((row) => {
                const txt = row.textContent || row.innerText;
                row.style.display = txt.toUpperCase().indexOf(filter) > -1 ? '' : 'none';
            });
        }

        document.getElementById('searchInput').addEventListener('input', filterPharmacistTable);
        document.getElementById('searchTrigger').addEventListener('click', filterPharmacistTable);
        document.getElementById('searchInput').addEventListener('keydown', function (event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                filterPharmacistTable();
            }
        });
    </script>
</body>
</html>
