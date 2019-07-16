package listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class TestListener implements ServletContextListener, HttpSessionListener {

    public void sessionCreated(HttpSessionEvent se)  { 
         System.out.println("sessionCreated()");
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
    	System.out.println("sessionDestroyed()");
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
    	System.out.println("contextDestroyed()");
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	System.out.println("contextInitialized()");
    }
	
}
