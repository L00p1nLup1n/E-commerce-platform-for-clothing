<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
<div class="col-md-12">
    <h2>${query}</h2>
    <c:choose>
        <c:when test="${empty products}">
            <p>No products found matching your search.</p>
        </c:when>
        <c:otherwise>
        <p>Found ${products.size()} products matching your search.</p>
        <div class="product-list">
            <c:forEach var="product" items="${products}">
                <div class="product-item">
                    <a href="${pageContext.request.contextPath}/products?productid=${product.id}" style="text-decoration: none; color: inherit;">
                    <div class="product-container" style="display: flex; gap: 15px;">
                        <div class="pi-img-wrapper uniform-wrapper" style="flex: 0 0 auto;">
                            <c:choose>
                                <c:when test="${product.image != null && product.image.length() >= 5 && product.image.substring(0,5) != 'https'}">
                                    <c:url value="/image?fname=${product.image}" var="imgUrl"></c:url>
                                </c:when>
                                <c:otherwise>
                                    <c:url value="${product.image}" var="imgUrl"></c:url>
                                </c:otherwise>
                            </c:choose>
                            <img src="${imgUrl}" class="img-responsive" alt="${product.name}" style="max-height: 150px; max-width: 200px;">
                        </div>
                        <div class="product-description" style="flex: 1; max-width: 500px; margin: 20px">
                            ${product.description != null && product.description.length() > 100 ? product.description.substring(0, 100) + '...' : product.description}
                        </div>
                    </div>
                        <div style="margin-left: 20px">
                            <h3>SHIRT</h3>
                            <div class="pi-price">130.0</div>
                        </div>
                        <div class="sticker sticker-sale"></div>
                    </a>
                </div>
            </c:forEach>
        </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>

    