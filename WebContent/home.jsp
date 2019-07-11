<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<%
		// check whether there is any attribute in session called username

		String name = (String) session.getAttribute("username");
		if (name == null) {
			Cookie[] cookies = request.getCookies();
			if (cookies == null) {
				// check for a cookie with username
				for (Cookie c : request.getCookies()) {
					if (c.getName().equals("username")) {
						name = c.getValue();
						session.setAttribute("username", name);
						break;
					}
				}
			}

		}

		if (name == null)
			response.sendRedirect("login.jsp");
	%>

	Welcome, ${sessionScope.username}
	<p />
	<a href="logout.jsp">Logout</a>


</body>
</html>