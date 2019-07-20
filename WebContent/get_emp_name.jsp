<%@ page language="java"
	import="oracle.jdbc.rowset.OracleCachedRowSet"
	pageEncoding="ISO-8859-1"%>
<%
	OracleCachedRowSet crs = new OracleCachedRowSet();
	crs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
	crs.setUsername("hr");
	crs.setPassword("hr");
	crs.setCommand("select first_name || ' ' || last_name from employees where employee_id = ?");
	crs.setString(1, request.getParameter("empid"));
	crs.execute();
	if (crs.next())
		out.println(crs.getString(1));
	else
		out.println("Employee Not Found!");
	crs.close();
%>