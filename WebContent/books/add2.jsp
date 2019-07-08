<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book</title>
</head>
<body>

	<h1>Add Book</h1>
	<form action="add.jsp" method="post">
		Title <br /> <input type="text" name='title' value="${param.title}" />

		<p></p>
		Author <br /> <input type="text" name='author'
			value="${param.author}" />
		<p></p>
		Price <br /> <input type="number" name='price' value="${param.price}" />
		<p></p>
		<input type="submit" value="Add Book" />
	</form>

	<p></p>
	<a href="list.jsp">List of Books</a>

	<%
		String title = request.getParameter("title");
		if (title == null)
			return; // exit JSP 

		

		try {
			
			out.println("<h2>Book has been added successfully</h2>");
		} catch (Exception ex) {
			System.out.println(ex);
			out.println("<h2>Could not add book due to error!</h2>");
		}
	%>




</body>
</html>