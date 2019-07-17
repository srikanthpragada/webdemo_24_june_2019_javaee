package filters;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

// @WebFilter("/*")
public class LogFilter implements Filter {

   	public void destroy() {
		// TODO Auto-generated method stub
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println(((HttpServletRequest)request).getRequestURI());
		chain.doFilter(request, response);
		System.out.println(LocalDateTime.now().toString()); 
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
