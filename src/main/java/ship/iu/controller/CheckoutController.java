package ship.iu.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ship.iu.Services.IUserService;
import ship.iu.Services.Implement.IUserServiceImpl;


@WebServlet(urlPatterns = {"/checkout"})
public class CheckoutController extends HttpServlet {
	IUserService service = new IUserServiceImpl();
	private static final long serialVersionUID = 1L;

@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
	 HttpSession session = req.getSession();
        Boolean checkoutSuccess = (Boolean) session.getAttribute("checkoutSuccess");

        if (checkoutSuccess == null || !checkoutSuccess) {
            // If not, redirect to the home page
            resp.sendRedirect(req.getContextPath() + "/");
            return;
        }
        // Reset the checkout success flag
        session.removeAttribute("checkoutSuccess");
		
	req.getRequestDispatcher("/views/Checkout.jsp").forward(req, resp);
	}
}