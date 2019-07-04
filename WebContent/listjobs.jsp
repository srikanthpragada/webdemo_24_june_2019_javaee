<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="oracle.jdbc.rowset.OracleCachedRowSet"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Of Jobs</title>
</head>
<body>
    <h1>List Of Jobs</h1>
    <ul>
	<%
		OracleCachedRowSet crs = new OracleCachedRowSet();
		crs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
		crs.setUsername("hr");
		crs.setPassword("hr");
		crs.setCommand("select * from jobs");
		crs.execute();
		while (crs.next()) {
			out.println( "<li>" + crs.getString("job_title") + "</li>");
		}
	%>
	</ul>

</body>
</html>