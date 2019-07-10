<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<h1>Login</h1>
	<form action="login.jsp">
		Username : <input type="text" name="uname" /> <input type="submit"
			value="Login" />
	</form>
	
	<%
	  String uname = request.getParameter("uname");
	  if(uname != null)
	  {
		  
		  // store name in session
		  session.setAttribute("username",uname);
		  Cookie c = new Cookie("username",uname);
		  c.setMaxAge(7 * 24 * 60 * 60);
		  response.addCookie(c);
		  response.sendRedirect("home.jsp");
	  }
	%>



</body>
</html>