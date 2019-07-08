<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Book</title>
</head>
<body>

	<h1>Update Book</h1>
	<%
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		String id = request.getParameter("id");

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr");
		PreparedStatement ps = con
				.prepareStatement("update june24_books set title = ?, author = ? , price = ? where id = ?");
		ps.setString(1, title);
		ps.setString(2, author);
		ps.setInt(3, Integer.parseInt(price));
		ps.setInt(4, Integer.parseInt(id));

		try {
			int count = ps.executeUpdate();
			if (count == 1)
			    response.sendRedirect("list.jsp");
			else
				out.println("<h2>Sorry! Book not found!</h2>");
		} catch (Exception ex) {
			System.out.println(ex);
			out.println("<h2>Could not update book due to error!</h2>");
		}
	%>




</body>
</html>