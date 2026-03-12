<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Inventry Details</title>
<link rel="stylesheet" href="css/PharmacistAllUpdate.css">
</head>
<body>
    
        <h1>Update Inventry</h1>
        
        <%
        String id = request.getParameter("item_id");
		String name = request.getParameter("item_name");
		String type = request.getParameter("item_type");
		String stock = request.getParameter("quantity_in_stock");
		String price = request.getParameter("unit_price");
		String sname = request.getParameter("supplier_name");
		String rdate = request.getParameter("date_received");
		String status = request.getParameter("status");
		String exp = request.getParameter("exp_date");
		String description = request.getParameter("description");
        %>
        
       <form action="UpdateAllServlet" method = "post">
		Item Id <input type = "text" name="id" value = "<%=id%>"readonly><br>
		Name<input type = "text" name="name" value = "<%=name%>"><br>
		Item Type<input type = "text" name="type" value = "<%=type%>"><br>
		Quantity in Stock<input type = "text" name="stock" value = "<%=stock%>"><br>
		Unit Price<input type = "text" name="price" value = "<%=price%>"><br>
		Supplier Name<input type = "text" name="sname" value = "<%=sname%>"><br>
		Date Received<input type = "date" name="rdate" value = "<%=rdate%>"><br>
		Expire Date<input type = "date" name="exp" value = "<%=exp%>"><br>
		Status<input type = "text" name="status" value = "<%=status%>"><br>
		Description<input type = "text" name="description" value = "<%=description%>"><br>
		
		<input type = "submit" name="submit" value = "Confirm Update"><br>
		</form>

</body>
</html>