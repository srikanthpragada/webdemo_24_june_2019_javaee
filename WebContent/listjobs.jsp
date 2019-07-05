<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="oracle.jdbc.rowset.OracleCachedRowSet"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Of Jobs</title>
</head> 
<body>
	<h1>List Of Jobs</h1>
	<table style="width: 100%" cellpadding='5px' border="1">
		<tr style="background-color:red;color:white">
			<th>Id</th>
			<th>Title</th>
			<th>Min Salary</th>
			<th>Max Salary</th>
		</tr>
		<%
			OracleCachedRowSet crs = new OracleCachedRowSet();
			crs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
			crs.setUsername("hr");
			crs.setPassword("hr");
			crs.setCommand("select * from jobs");
			crs.execute();
			while (crs.next()) {
		%>
		<tr>
			<td><%=crs.getString(1)%></td>
			<td><%=crs.getString(2)%></td>
			<td><%=crs.getInt(3)%></td>
			<td><%=crs.getInt(4)%></td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>