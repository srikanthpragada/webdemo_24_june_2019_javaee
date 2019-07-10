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
   
   // check for a cookie with username 
   
%>

Welcome, ${sessionScope.username}
<p/>
<a href="logout.jsp">Logout</a>


</body>
</html>