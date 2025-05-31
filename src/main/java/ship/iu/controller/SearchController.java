package ship.iu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ship.iu.Services.ICategoryService;
import ship.iu.Services.IProductService;
import ship.iu.Services.Implement.CategoryServiceImpl;
import ship.iu.Services.Implement.ProductServiceImpl;
import ship.iu.model.ProductModel;

@WebServlet(urlPatterns = { "/search" })
public class SearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    IProductService productService = new ProductServiceImpl();
    ICategoryService categoryService = new CategoryServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = request.getParameter("query");
        String categoryName = request.getParameter("categoryname");
        List<ProductModel> products = new ArrayList<>();
        
        if (query != null && !query.trim().isEmpty()) {
            // User is searching by product name
            products = productService.searchProducts(query.trim());
            System.out.println("Search query: " + query);
        } else if (categoryName != null && !categoryName.trim().isEmpty()) {
            // Convert category name to category ID before searching
            Integer categoryId = categoryService.getCategoryIdByName(categoryName);

            if (categoryId != null ) {
                products = productService.findProductsByCategory(categoryId);
                System.out.println("Filtering by category: " + categoryName + " (ID: " + categoryId + ")");
            }
        }

        // Prevent null list errors
        if (products == null) {
            products = new ArrayList<>();
        }

        request.setAttribute("products", products);
        request.setAttribute("query", query != null ? query.trim() : "");
        request.setAttribute("categoryname", categoryName != null ? categoryName.trim() : "");
        
        request.getRequestDispatcher("/views/SearchResults.jsp").forward(request, response);
    }



@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
}

    
}
