package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/marks")
public class MarksServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         int marks = Integer.parseInt(request.getParameter("marks"));
         String grade = "Fail";
         if (marks  > 80)
        	 grade = "Grade A";
         else
        	 if(marks > 60)
        		  grade = "Grade B";
        	 else
        		 if ( marks > 40)
        			 grade = "Grade C";
        PrintWriter pw = response.getWriter();
        pw.println("<h1>" + grade + "</h1>");
	}

}
