<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="oracle.jdbc.rowset.OracleCachedRowSet" 
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Book</title>
</head>
<body>
    <%@include file="header.html" %>
	<h1>Edit Book</h1>
	<%
		String id = request.getParameter("id");

		OracleCachedRowSet crs = new OracleCachedRowSet();
		crs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
		crs.setUsername("hr");
		crs.setPassword("hr");
		crs.setCommand("select * from june24_books where id = ?");
		crs.setString(1,id);
		crs.execute();
		if (!crs.next()) // move to first row
		{
			out.println("<h2>Sorry! Book not found!</h2>");
			return;
		}
	%>
	
	<form action="update.jsp" method="post">
	    <input type="hidden" name="id" value="${param.id}"/>
	    
		Title <br /> <input type="text" name='title' 
		     value="<%=crs.getString(2) %>" />
		<p></p>
		Author <br /> <input type="text" name='author'
			value="<%=crs.getString(3) %>" />
		<p></p>
		Price <br /> 
		<input type="number" name='price' value="<%=crs.getString(4) %>" />
		<p></p>
		<input type="submit" value="Update Book" />
	</form>
 


</body>
</html>