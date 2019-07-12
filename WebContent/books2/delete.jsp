<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*" pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Book</title>
</head>
<body>
	<%@include file="header.html"%>
	<h1>Delete Book</h1>

	<sql:setDataSource var="oracle"
		driver="oracle.jdbc.driver.OracleDriver"
		url="jdbc:oracle:thin:@localhost:1521:XE" user="hr" password="hr" />

	<sql:update var="count" dataSource="${oracle}">
	   delete from june24_books where id = ?
	   <sql:param value="${param.id}" />
	</sql:update>

	<c:if test="${count == 1}">
		<c:redirect url="list.jsp"></c:redirect>
	</c:if>

	<c:if test="${count == 0}">
		<h2>Sorry! Book id not found!</h2>
	</c:if>

</body>
</html>