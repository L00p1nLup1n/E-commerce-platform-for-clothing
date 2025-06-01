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
        <c:when test="${empty products && not empty categoryname}">
            <h4>This category currently have no product. Stay tuned!</h4>
        </c:when>
        <c:when test="${empty products && empty categoryname}">
            <h4>No products found matching your preference.</h4>
        </c:when>
        <c:otherwise>
            <h4>Found ${products.size()} products matching your preference.</h4>
            <div class="product-list">
                <c:forEach var="product" items="${products}">
                    <div class="product-item" style="border: 1px solid #e74c3c">
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
                                <img src="${imgUrl}" class="img-responsive" alt="${product.name}" style="max-height: 550px; max-width: 200px;">
                            </div>
                            <div class="product-description" style="flex: 1; max-width: 650px; padding: 20px; background-color:rgb(240, 255, 255); border-radius: 10px; border: 1px solid orange">
                                ${product.description}
                            </div>
                        </div>
                            <div style="margin-left: 20px">
                                <h3>${product.name}</h3>
                                <div class="pi-price">${product.price}</div>
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

    