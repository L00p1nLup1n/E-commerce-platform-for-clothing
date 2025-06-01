package ship.iu.controller.admin;

import java.io.File;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import ship.iu.Services.ICategoryService;
import ship.iu.Services.IProductService;
import ship.iu.Services.IReviewService;
import ship.iu.Services.Implement.CategoryServiceImpl;
import ship.iu.Services.Implement.ProductServiceImpl;
import ship.iu.Services.Implement.ReviewServiceImpl;
import ship.iu.model.ProductModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import static ship.iu.utils.Constant.*;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = { "/admin/categories", "/admin/category/add", "/admin/category/insert",
		"/admin/category/edit", "/admin/category/update", "/admin/category/delete", "/admin/category/search" })
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ICategoryService cateService = new CategoryServiceImpl();
	public IProductService productService = new ProductServiceImpl();
	public IReviewService reviewService = new ReviewServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		if (url.contains("/admin/categories")) {
			List<ProductModel> list = productService.findAllProducts();
			for (ProductModel product : list){
				String categoryname = cateService.getCategoryIdtoNameMap().get(product.getCategoryid());
				product.setCategoryname(categoryname);
			}
			request.getSession().setAttribute("listproduct", list);

			String queryString = request.getQueryString();
			String previousUrl = (queryString != null && !queryString.isEmpty()) 
				? request.getRequestURI() + "?" + queryString 
				: request.getRequestURI();
			request.getSession().setAttribute("previousUrl", previousUrl);
			
			System.out.println("Current URL: " + previousUrl);


			request.getRequestDispatcher("/views/admin/category-list.jsp").forward(request, response);

		} else if (url.contains("/admin/category/add")) {
			request.getRequestDispatcher("/views/admin/category-add.jsp").forward(request, response);

		} else if (url.contains("/admin/category/edit")) {
			int id = Integer.parseInt(request.getParameter("id"));
			ProductModel product = productService.findProductById(id);
			request.setAttribute("product", product);

			request.getRequestDispatcher("/views/admin/category-edit.jsp").forward(request, response);
		} else if (url.contains("/admin/category/delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			reviewService.deleteAllReviewFromProduct(id);
			productService.deleteProduct(id);
			response.sendRedirect(request.getContextPath() + "/admin/categories");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String url = request.getRequestURI();
		if (url.contains("/admin/category/insert")) {
			ProductModel product = new ProductModel();
			int categoryid = Integer.parseInt(request.getParameter("categoryid"));
			String productname = request.getParameter("productname");
			int status = Integer.parseInt(request.getParameter("status"));
			double price = Double.parseDouble(request.getParameter("price"));
			String desc = request.getParameter("description");

			product.setCategoryid(categoryid);
			product.setName(productname);
			product.setStatus(status);
			product.setPrice(price);
			product.setDescription(desc);
			product.setAdded_date(new Date());

			String fname = "";
			String uploadPath = DIR;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {
				Part part = request.getPart("image");
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;
					part.write(uploadPath + "/" + fname);
					product.setImage(fname);
				} else {
					product.setImage("avatar.png");
				}
			} catch (Exception e) {
				e.printStackTrace();

			}
			productService.addProduct(product);
			response.sendRedirect(request.getContextPath() + "/admin/categories");

		} else if (url.contains("update")) {
			int productid = Integer.parseInt(request.getParameter("productid"));
			int categoryid = Integer.parseInt(request.getParameter("categoryid"));
			String productname = request.getParameter("productname");
			String status = request.getParameter("status");
			int statuss = Integer.parseInt(status);
			String desc = request.getParameter("description");
			double price = Double.parseDouble(request.getParameter("price"));

			ProductModel newProduct = new ProductModel();
			newProduct.setId(productid);
			newProduct.setCategoryid(categoryid);
			newProduct.setName(productname);
			newProduct.setStatus(statuss);
			newProduct.setPrice(price);
			newProduct.setDescription(desc);
			ProductModel oldProduct = productService.findProductById(productid);
			String fileold = oldProduct.getImage();
			
			String fname = "";
			String uploadPath = DIR;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {
				Part part = request.getPart("image");
				System.out.println("Filename: "+fname);
				System.out.println("part: "+part);
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;
					// upload file
					part.write(uploadPath + "/" + fname);
					newProduct.setImage(fname);
				} else {
					newProduct.setImage(fileold);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			productService.updateProduct(newProduct);
			String previousUrl = (String) request.getSession().getAttribute("previousUrl");
			if (previousUrl != null) {
				response.sendRedirect(previousUrl);
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/categories"); //Default
			}
		}
	}
}
