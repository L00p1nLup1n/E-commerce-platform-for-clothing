<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
    <div class="cart-container"
         style="width: 100%; margin: 0 auto; background-color: #f8f9fa; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">
        <h1>Shopping Cart</h1>

        <c:set var="cart" value="${sessionScope.cart}" />
        <c:choose>
            <c:when test="${empty cart}">
                <p>Your cart is empty.</p>
            </c:when>
            <c:otherwise>
                <p>Items in your cart:</p><br>
                <table class="cart-table" style="table-layout: fixed; width: 100%; margin-bottom: 20px; border-collapse: separate; border-spacing: 16px;">
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
                    <form
                        action="${pageContext.request.contextPath}/Cart"
                        method="post"
                        id="cart-detail"
                    >
                    <input type="hidden" name="action" value="update" />
                        <c:forEach var="product" items="${cart}">
                            <tr>
                                <td><a href="${pageContext.request.contextPath}/products?productid=${product.id}">${product.name}</a></td>
                                <td>
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <input type="number" name="quantity" value="${product.quantity}" min="0" class="form-control" style="width: 69px;">
                                </td>
                                <td>$<fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="2"/></td>
                                <td>$<fmt:formatNumber value="${product.subtotal}" type="number" maxFractionDigits="2"/></td>
                                <td>
                                    <a href="#" onclick="removeProduct('${pageContext.request.contextPath}/Cart','${product.id}')">
                                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    <button type="submit" title="Update Cart" style="background-color: #e74c3c; color: white; padding: 10px 20px; text-decoration: none; border: none; font-size: 16px; border-radius: 5%;">
                        <i class="fa fa-refresh" aria-hidden="true"> </i>
                    </button>
                    </form>
                    </tbody>
                </table>
                <br>
                <div class="cart-summary">
                    <p>Total Items: <span id="total-items">${sessionScope.cartItems}</span></p>
                    <p>Total Price: <span id="total-price">$<fmt:formatNumber value="${sessionScope.cartPrice}" type="number" maxFractionDigits="2"/></span></p>
                </div>
            </c:otherwise>
        </c:choose>
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