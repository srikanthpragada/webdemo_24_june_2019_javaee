<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Book</title>
</head>
<body>
    <h1>Delete Book</h1>
	<%

	    String id = request.getParameter("id");
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr");
		PreparedStatement ps = con.prepareStatement("delete from june24_books where id = ?");
		ps.setString(1, id);
		try {
			int count = ps.executeUpdate();
			if (count == 1)
				response.sendRedirect("list.jsp");
			else
				out.println("<h2>Sorry! Book not found!</h2>");
		} catch (Exception ex) {
			out.println("<h2>Sorry! Could not delete book due to error! </h2>");
		}
	%>


</body>
</html>