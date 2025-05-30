package ship.iu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ship.iu.Services.IProductService;
import ship.iu.Services.Implement.ProductServiceImpl;
import ship.iu.model.ProductModel;

@WebServlet(urlPatterns = { "/search" })
public class SearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    IProductService productService = new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = request.getParameter("query");
        List<ProductModel> products = new ArrayList<>();
    
        if (query != null && !query.trim().isEmpty()) {
            products = productService.searchProducts(query.trim());
            if (products == null) {
                products = new ArrayList<>();
            }
            System.out.println("Search query: " + query);
            System.out.println("Number of products found: " + products.size());
        }
        request.setAttribute("products", products);
        request.setAttribute("query", query.trim());
        request.getRequestDispatcher("/views/SearchResults.jsp").forward(request, response);

    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
}

    
}
