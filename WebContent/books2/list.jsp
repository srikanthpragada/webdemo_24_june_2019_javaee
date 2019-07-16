<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="oracle.jdbc.rowset.OracleCachedRowSet"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Of Books</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<h1>List Of Books</h1>
	
	<sql:setDataSource var="oracle"
		driver="oracle.jdbc.driver.OracleDriver"
		url="jdbc:oracle:thin:@localhost:1521:XE" user="hr" password="hr" />

	<sql:query var="books" dataSource="${oracle}">
      select * from june24_books  order by id
    </sql:query>

	<table style="width: 100%" cellpadding='5px' border="1">
		<tr style="background-color: red; color: white">
			<th>Id</th>
			<th>Title</th>
			<th>Author</th>
			<th>Price</th>
			<th></th>
		</tr>
		<c:forEach var="book" items="${books.rows}">
			<tr>
				<td>${book.id}</td>
				<td>${book.title}</td>
				<td>${book.author}</td>
				<td>${book.price }</td>
				<td style="text-align: center">
				    <a href="edit.jsp?id=${book.id}">Edit</a>
					<a onclick="return confirm('Do you really want to delete book?')"  
					   href="delete.jsp?id=${book.id}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>