package ship.iu.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import ship.iu.Services.IUserService;
import ship.iu.model.UserModel;
import ship.iu.utils.Constant;
import ship.iu.Services.Implement.IUserServiceImpl;
import ship.iu.model.Product;

@WebServlet(urlPatterns = { "/Cart" })
public class CartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    IUserService service = new IUserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
            session.setAttribute("cartItems", 0);
            session.setAttribute("cartPrice", 0.0);
        }
        RequestDispatcher rd = request.getRequestDispatcher("/views/Cart.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Handle logic: check if the user is logged in
        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("account");
        if (user == null) {
            // User is not logged in, redirect to login page
            response.sendRedirect(request.getContextPath() + "/login");
        }
        else {
            String action = request.getParameter("action");
            System.out.println("Action: " + action);
            List<Product> cart = (List<Product>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
                session.setAttribute("cart", cart);
            }
            // Handle different actions
            if ("add".equals(action)) {
                // Add a product to the cart
                int productId = Integer.parseInt(request.getParameter("productId"));
                String productName = request.getParameter("productName");
                double productPrice = Double.parseDouble(request.getParameter("productPrice"));

                // Check if the product is already in the cart
                boolean found = false;
                for (Product product : cart) {
                    if (product.getId() == productId) {
                        product.incrementQuantity();
                        found = true;
                        break;
                    }
                }

                // If not found, add a new product
                if (!found) {
                    Product newProduct = new Product(productId, productName, productPrice);
                    cart.add(newProduct);
                }

                // Update the session
                session.setAttribute("cart", cart);
                session.setAttribute("cartItems", cart.size());
                session.setAttribute("cartPrice", cart.stream().mapToDouble(Product::getSubtotal).sum());
                                // Get updated values
                Integer cartItems = (Integer) session.getAttribute("cartItems");
                Double cartPrice = (Double) session.getAttribute("cartPrice");

                // Build items string: name,qty,price;name,qty,price;...
                StringBuilder itemsString = new StringBuilder();
                if (cart != null) {
                    for (Product item : cart) {
                        itemsString.append(item.getName())
                                   .append(",")
                                   .append(item.getQuantity())
                                   .append(",")
                                   .append(item.getPrice())
                                   .append(";");
                    }
                }

                response.setContentType("text/plain");
                response.getWriter().write(
                    (cartItems != null ? cartItems : 0) + "|" +
                    (cartPrice != null ? cartPrice : 0) + "|" +
                    itemsString.toString()
                );
                return;
            } else if ("update".equals(action)) {
                // Update product quantities
                String[] productIds = request.getParameterValues("productId");
                String[] quantities = request.getParameterValues("quantity");

                if (productIds != null && quantities != null && productIds.length == quantities.length) {
                    for (int i = 0; i < productIds.length; i++) {
                        int id = Integer.parseInt(productIds[i]);
                        int quantity = Integer.parseInt(quantities[i]);
                        // Update quantity for this product
                        for (Product product : cart) {
                            if (product.getId() == id) {
                                product.setQuantity(quantity);
                                break;
                            }
                        }
                    }

                    // Remove products with quantity 0
                    cart.removeIf(product -> product.getQuantity() <= 0);

                    // Update the session
                    session.setAttribute("cart", cart);
                }

                // Redirect to cart page
                response.sendRedirect(request.getContextPath() + "/Cart");

            } else if ("remove".equals(action)) {
                // Remove a product from the cart
                int productId = Integer.parseInt(request.getParameter("productId"));

                // Find and remove the product
                Iterator<Product> iterator = cart.iterator();
                while (iterator.hasNext()) {
                    Product product = iterator.next();
                    if (product.getId() == productId) {
                        iterator.remove();
                        break;
                    }
                }

                // Update the session
                session.setAttribute("cart", cart);
                session.setAttribute("cartItems", cart.size());
                session.setAttribute("cartPrice", cart.stream().mapToDouble(Product::getSubtotal).sum());

                // Redirect to cart page
                response.sendRedirect(request.getContextPath() + "/Cart");

            } else if ("clear".equals(action)) {
                // Clear the entire cart
                cart.clear();

                // Update the session
                session.setAttribute("cart", cart);

                // Redirect to cart page
                response.sendRedirect(request.getContextPath() + "/Cart");

            }
            else if ("checkout".equals(action)) {

            if (cart.isEmpty()) {
                // If the cart is empty, redirect to cart page
                response.sendRedirect(request.getContextPath() + "/Cart?error=empty");
                return;
            }
            // Clear the cart
            session.removeAttribute("cart");
            session.removeAttribute("cartItems");
            session.removeAttribute("cartPrice");
            session.setAttribute("checkoutSuccess", true);

            // Redirect to a checkout success page
            response.sendRedirect(request.getContextPath() + "/checkout");
            }
            else {
                // If action is not recognized, redirect to cart page
                response.sendRedirect(request.getContextPath() + "/Cart");
            }
        }
    }
}
