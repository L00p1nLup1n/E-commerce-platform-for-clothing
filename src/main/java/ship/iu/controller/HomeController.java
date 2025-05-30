package ship.iu.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ship.iu.Services.Implement.ProductServiceImpl;
import ship.iu.model.ProductModel;

@WebServlet(urlPatterns = { "/home"})
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductServiceImpl productService = new ProductServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		List<ProductModel> products = productService.findAllProducts();
	    req.setAttribute("products", products);

		req.getRequestDispatcher("/views/Home.jsp").forward(req, resp);

	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
	}
}