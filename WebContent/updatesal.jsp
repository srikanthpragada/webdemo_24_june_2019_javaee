<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Salary</title>
</head>
<body>

	<%
		Connection con = DriverManager.getConnection
		        ("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr");
		PreparedStatement ps = con.prepareStatement
				("update employees set salary = ? where employee_id = ?");
		int empid = Integer.parseInt(request.getParameter("empid"));
		int newsalary = Integer.parseInt(request.getParameter("newsalary"));
		
		ps.setInt(1, newsalary);
		ps.setInt(2, empid);
		try {
			int count = ps.executeUpdate();
			if (count == 1)
				out.println("<h2>Updated salary successfully</h2>");
			else
				out.println("<h2>Employee id is not found</h2>");
		} catch (Exception ex) {
			System.out.println(ex);
			out.println("Could not update salary due to error!");
		}
	%>

</body>
</html>