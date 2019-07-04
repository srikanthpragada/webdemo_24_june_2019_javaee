<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Today</title>
</head>
<body>
	<h2>
		<%
			out.println(java.time.LocalDateTime.now().toString());
		%>
	</h2>
</body>
</html>