package misc;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(
		urlPatterns= {"/Account/*","/Apply/*","/Inv/*","/Po/*","/ceo/*"}
)//value = "/_03_listBooks/*"

public class LoginFilter implements Filter{
	String servletPath;
	String contextPath;
	String requestURI;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		servletPath = req.getServletPath();  
		contextPath = req.getContextPath();
		requestURI  = req.getRequestURI();
		HttpSession session=req.getSession();
		if(session.getAttribute("user")==null) {
			//RequestDispatcher rd = request.getRequestDispatcher("http://localhost:8080/PurchasingSystem/RENAME.jsp");
			//rd.forward(request, response);
			resp.sendRedirect(contextPath + "/MainPage.jsp");
			return;
		}else {
			chain.doFilter(request, response);
			
		}
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
