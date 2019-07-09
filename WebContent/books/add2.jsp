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
	<form action="add2.jsp" method="post">
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
	%>

	<jsp:useBean class="beans.Book" scope="page" id="book"></jsp:useBean>
	<jsp:setProperty property="*" name="book" />

	<%
		try {
			book.addBook();
			out.println("<h2>" + book.getTitle() + " has been added successfully</h2>");
		} catch (Exception ex) {
			System.out.println(ex);
			out.println("<h2>Could not add book due to error!</h2>");
		}
	%>
</body>
</html>