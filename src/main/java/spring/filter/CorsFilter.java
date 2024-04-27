package spring.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
public class CorsFilter implements Filter {

	@Override
    public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("doFilter run......");
    }
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("CrossOriginResourceSharing.doFilter()");
		// TODO Auto-generated method stub
		HttpServletResponse res = (HttpServletResponse) response; 
		res.setHeader("Access-Control-Allow-Origin", "http://localhost:3000"); //허용대상 도메인
		res.setHeader("Access-Control-Allow-Methods", "POST, GET, DELETE, PUT"); 
		res.setHeader("Access-Control-Max-Age", "3600"); 
		res.setHeader("Access-Control-Allow-Headers", "x-requested-with, origin, content-type, accept"); 

		// pass the request along the filter chain
		chain.doFilter(request, response);

	}
	
	@Override
    public void destroy() {

    }

}
