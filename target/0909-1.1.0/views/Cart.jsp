<%@page import="ship.iu.model.Product"%>
<%@page import="java.util.List"%>
<<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
    </head>
    <body>
        <div class="cart-container"             
             style="width: 80%; margin: 0 auto; background-color: #f8f9fa; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">
            <h1>Shopping Cart</h1>
            <%
                List<Product> cart = (List<Product>) session.getAttribute("cart");
                if (cart == null || cart.isEmpty()) {
            %>
            <p>Your cart is empty.</p>
            <% } else { %>
            <table class="cart-table" style="table-layout: fixed; width: 100%; margin-bottom: 20px;">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Product product : cart) {
                    %>
                        <tr>
                            <td><%= product.getName()%></td>
                            <td>
                                <input type="hidden" name="productId" value="<%= product.getId()%>">
                                <input type="number" name="quantity" value="<%= product.getQuantity()%>" min="0" class="form-control" style="width: 60px;">
                            </td>
                            <td>$<%= String.format("%.2f", product.getPrice())%></td>
                            <td>$<%= String.format("%.2f", product.getSubtotal())%></td>
                            <td>
                                <a href="#" onclick="removeProduct('${pageContext.request.contextPath}/Cart','<%= product.getId()%>')"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                            </td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="cart-summary">
                <p>Total Items: <span id="total-items">${sessionScope.cartItems}</span></p>
                <p>Total Price: <span id="total-price">$<fmt:formatNumber value="${sessionScope.cartPrice}" type="number" maxFractionDigits="2"/></span></p>
            </div>
            <% } %>
        </div>
        <div class="cart-actions" style="display: flex; justify-content: space-between; margin-top: 20px;">
            <a href="${pageContext.request.contextPath}/users/home"
               style="background-color: #28a745; color: white; padding: 10px 20px; text-decoration: none; border-radius: 4px; font-size: 16px;">
                Continue Shopping
            </a>
            <button onclick="document.getElementById('checkoutForm').submit(); return false;" 
            style="background-color: #28a745; color: white; padding: 10px 20px; text-decoration: none; border: none; font-size: 16px; border-radius: 5%;">
                Checkout
            </button>

        </div>
            <form id="checkoutForm" action="${pageContext.request.contextPath}/Cart" method="post">
                <input type="hidden" name="action" value="checkout">
            </form>
    </body>
</html>