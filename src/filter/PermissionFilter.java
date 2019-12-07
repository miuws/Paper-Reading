package filter;

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

public class PermissionFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
 
    }
 
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest hreq= (HttpServletRequest) req;
        HttpServletResponse hresp= (HttpServletResponse) resp;
 
        String servletpath=hreq.getServletPath();

        HttpSession hsess=hreq.getSession();

        String flag= (String) hsess.getAttribute("flag");

        if (servletpath!=null&&(
                (servletpath.equals("/servlet/AdminLoginServlet"))||
                (servletpath.equals("/servlet/MainPageServlet"))
                )){
 
            chain.doFilter(req, resp);
        }else{
            if (flag!=null&&flag.equals("login_success")){
                chain.doFilter(req, resp);
            }else {
                RequestDispatcher rd=hreq.getRequestDispatcher("/index.jsp");
                rd.forward(hreq,hresp);
            }
        }
    }
    public void destroy() {
    }
}
