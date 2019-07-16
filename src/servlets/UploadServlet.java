package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig
public class UploadServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		Part p = request.getPart("emails");
		BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
		pw.println("<ul>");
		while (true) {
			String line = br.readLine();
			if (line == null)
				break;
			pw.println("<li>" + line + "</li>");
		}
		pw.println("</ul>");
	}

}
