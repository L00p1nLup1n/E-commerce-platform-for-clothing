package ship.iu.controller.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import ship.iu.model.UserModel;

@WebFilter(urlPatterns = "/seller/*")
public class SellerFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resq = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		Object obj = session.getAttribute("account");
		UserModel user = (UserModel) obj;
		if (user != null && user.getRoleid() == 4) {
			chain.doFilter(request, response);
			return; //
		} else {
			resq.sendRedirect(req.getContextPath() + "/logout");
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
