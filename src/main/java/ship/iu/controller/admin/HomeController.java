package ship.iu.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ship.iu.Services.Implement.ProductServiceImpl;
import ship.iu.model.ProductModel;

@WebServlet(urlPatterns = { "/admin/home"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductServiceImpl productService = new ProductServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		List<ProductModel> newArrivals = productService.getNewArrivals();
		List<ProductModel> randomSelect = productService.randomSelectionDisplay();
		List<ProductModel> promotions = productService.findProductsByCategory(1); //Men category id is 1
	    req.setAttribute("newArrivals", newArrivals);
		req.setAttribute("randomSelect", randomSelect);
		req.setAttribute("promotions", promotions);

	    req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
	}
}
