package ship.iu.controller;

import java.io.IOException;
import java.util.List;
import java.util.Date;
import java.util.Iterator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ship.iu.Services.ICategoryService;
import ship.iu.Services.IProductService;
import ship.iu.Services.IReviewService;
import ship.iu.Services.Implement.CategoryServiceImpl;
import ship.iu.Services.Implement.ProductServiceImpl;
import ship.iu.Services.Implement.ReviewServiceImpl;
import ship.iu.model.ProductModel;
import ship.iu.model.ReviewModel;
import ship.iu.model.UserModel;

@WebServlet(urlPatterns = {"/products/*"})
public class ItemDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final IProductService productService = new ProductServiceImpl();
    private final IReviewService reviewService = new ReviewServiceImpl();
    private final ICategoryService categoryService = new CategoryServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            int productId = Integer.parseInt(request.getParameter("productid"));
            ProductModel product = productService.findProductById(productId);
            if (product == null) {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            
            List<ReviewModel> reviews = reviewService.getReviewsByProductId(productId);
            String categoryname = categoryService.getCategoryIdtoNameMap().get(product.getCategoryid());
            product.setCategoryname(categoryname);

            System.out.println("The current category is: "+ categoryname);
            request.setAttribute("product", product);
            request.setAttribute("reviews", reviews);

			String queryString = request.getQueryString();
			String previousUrl = (queryString != null && !queryString.isEmpty()) 
				? request.getRequestURI() + "?" + queryString 
				: request.getRequestURI();
            request.getSession().setAttribute("previousUrl", previousUrl);
			
			System.out.println("Current URL: " + previousUrl);

            // Forward to the item details page
            request.getRequestDispatcher("/views/ItemDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/products");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("account");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        String action = request.getParameter("action");
        if ("addReview".equals(action)) {
            try {
                int productId = Integer.parseInt(request.getParameter("productid"));
                String comment = request.getParameter("comment");
                int rating = Integer.parseInt(request.getParameter("rating"));

                ReviewModel review = new ReviewModel(productId, user.getId(), user.getUsername(), rating, comment, new Date());
                reviewService.addReview(review);

                // Retrieve updated product instance
                ProductModel product = productService.findProductById(productId);
                request.setAttribute("product", product);
                request.setAttribute("reviews", reviewService.getReviewsByProductId(productId));

                // Forward to display updated product details
                request.getRequestDispatcher("/views/ItemDetails.jsp").forward(request, response);

            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/products");
            }
        } else if ("deleteReview".equals(action)){
            try {
                int productId = Integer.parseInt(request.getParameter("productid"));
                int reviewId = Integer.parseInt(request.getParameter("reviewId"));
                List<ReviewModel> reviews = reviewService.getReviewsByProductId(productId);

                // Find and remove the review in the product detail
                Iterator<ReviewModel> iterator = reviews.iterator();
                while (iterator.hasNext()) {
                    ReviewModel review = iterator.next();
                    if (review.getId() == reviewId) {
                        reviewService.deleteReview(review);
                        iterator.remove();
                        break;
                    }
                }

                ProductModel product = productService.findProductById(productId);
                request.setAttribute("product", product);
                request.setAttribute("reviews", reviewService.getReviewsByProductId(productId));

                // Forward to display updated product details
                request.getRequestDispatcher("/views/ItemDetails.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/products");
            }
        }
        else {
            response.sendRedirect(request.getContextPath() + "/products");
        }
    }
}
