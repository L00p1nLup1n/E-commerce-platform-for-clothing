package ship.iu.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import ship.iu.Services.IUserService;
import ship.iu.model.UserModel;
import ship.iu.utils.Constant;
import ship.iu.Services.Implement.IUserServiceImpl;



@WebServlet(urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
@SuppressWarnings("static-access")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		IUserService service = new IUserServiceImpl();
		String username = request.getParameter("username").trim();
		String password = request.getParameter("pass").trim();
		String email = request.getParameter("email").trim();
		String fullname = request.getParameter("fullname").trim();
		String phone = request.getParameter("phone").trim();
		String alertMsg = "";
		if (service.checkExistEmail(email)) {
			alertMsg = "This email is in use!";
			request.setAttribute("alert", alertMsg);
			request.getRequestDispatcher("/views/Register.jsp").forward(request, response);
			return;
		}
		if (service.checkExistUsername(username)) {
			alertMsg = "This username has been taken!";
			request.setAttribute("alert", alertMsg);
			request.getRequestDispatcher("/views/Register.jsp").forward(request, response);
			return;
		}
		boolean isSuccess = service.register(username, email, password,fullname, phone);
		if (isSuccess) {
			request.setAttribute("alert", alertMsg);
			response.sendRedirect(request.getContextPath() + "/login");
		} else {
			alertMsg = "System error!";
			request.setAttribute("alert", alertMsg);
			request.getRequestDispatcher("/views/Register.jsp").forward(request, response);
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/Register.jsp");
		rd.forward(request, response);
	}
}
