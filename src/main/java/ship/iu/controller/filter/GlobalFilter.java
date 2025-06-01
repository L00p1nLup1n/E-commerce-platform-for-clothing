package ship.iu.controller.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import java.io.IOException;
import ship.iu.Services.ICategoryService;
import ship.iu.Services.Implement.CategoryServiceImpl;

@WebFilter("/*")
public class GlobalFilter implements Filter {
    private ICategoryService categoryService = new CategoryServiceImpl();

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    synchronized (categoryService) {
        if (categoryService.getCategoryIdtoNameMap().isEmpty() || categoryService.getCategoryNametoIdMap().isEmpty()) {
            categoryService.loadCategories();
            System.out.println("Categories successfully loaded");
        }
    }
        chain.doFilter(request, response); // Continue request processing
    }

    @Override
    public void init(FilterConfig filterConfig) {}

    @Override
    public void destroy() {}
}
