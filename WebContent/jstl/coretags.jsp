<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"  %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Core Tags</title>
</head>
<body>

<c:set var="count" value="10" scope="session" />

Count = ${sessionScope.count}

<c:remove var="count" scope="session" />
<p></p>

Count = ${sessionScope.count}
<p></p>

<c:out value="<h1> Is for heading 1" />

</body>
</html>