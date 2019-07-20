package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Employee;
import oracle.jdbc.rowset.OracleCachedRowSet;

@WebServlet("/employeesByJob")
public class EmployeesByJobServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter pw = response.getWriter();
		response.setContentType("application/json");
		
		try {
			OracleCachedRowSet crs = new OracleCachedRowSet();
			crs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
			crs.setUsername("hr");
			crs.setPassword("hr");
			crs.setCommand("select first_name || ' ' || last_name fullname, salary from employees where job_id = ?");
			crs.setString(1, request.getParameter("jobid"));
			crs.execute();
			
			ArrayList<Employee> employees = new ArrayList<>();

			while (crs.next()) {
               Employee e = new Employee();
               e.setName( crs.getString(1));
               e.setSalary( crs.getInt(2));
               employees.add(e);
			}
			
			// create json array from ArrayList and send to client
			
			Gson gson = new Gson();
			pw.println( gson.toJson(employees));
			crs.close();

		} catch (Exception ex) {
            pw.println("[]"); 
		}

	}

}
