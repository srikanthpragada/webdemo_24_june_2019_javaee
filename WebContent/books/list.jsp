<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="oracle.jdbc.rowset.OracleCachedRowSet"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Of Books</title>
</head>
<body>
    <%@include file="header.html" %>
	<h1>List Of Books</h1>
	<table style="width: 100%" cellpadding='5px' border="1">
		<tr style="background-color: red; color: white">
			<th>Id</th>
			<th>Title</th>
			<th>Author</th>
			<th>Price</th>
			<th></th>
		</tr>
		<%
			OracleCachedRowSet crs = new OracleCachedRowSet();
			crs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
			crs.setUsername("hr");
			crs.setPassword("hr");
			crs.setCommand("select * from june24_books order by id");
			crs.execute();
			while (crs.next()) {
		%>
		<tr>
			<td><%=crs.getInt(1)%></td>
			<td><%=crs.getString(2)%></td>
			<td><%=crs.getString(3)%></td>
			<td><%=crs.getInt(4)%></td>
			<td style="text-align:center">
			 <% 
			   out.println("<a href='delete.jsp?id=" + crs.getInt(1) + "'>Delete</a>&nbsp;");
			   out.println("<a href='edit.jsp?id=" + crs.getInt(1) + "'>Edit</a>");
			 %>
		    </td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>