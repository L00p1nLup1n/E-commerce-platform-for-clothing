<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<head>
    <title>Category List</title>
</head>
<body>
    <div style="text-align: center; margin-bottom: 20px;">
		<a href="${pageContext.request.contextPath}/admin/category/add"
			style="display: inline-block; padding: 10px 20px; background-color: #007BFF; color: white; text-decoration: none; border-radius: 5px;">Add
			Products</a>
	</div>

    <table border="1" style="width: 100%; border-collapse: collapse; font-family: Arial, sans-serif; text-align: center;">
        <thead>
            <tr style="background-color: #f2f2f2; font-weight: bold;">
                <th style="padding: 10px; text-align: center;">STT</th>
                <th style="padding: 10px; text-align: center;">Images</th>
                <th style="padding: 10px; text-align: center;">Product ID</th>
                <th style="padding: 10px; text-align: center;">Product Name</th>
                <th style="padding: 10px; text-align: center;">Status</th>
                <th style="padding: 10px; text-align: center;">Price</th>
                <th style="padding: 10px; text-align: center;">Description</th>
                <th style="padding: 10px; text-align: center;">Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listcate}" var="cate" varStatus="STT">
                <c:choose>
                    <c:when test="${STT.index % 2 == 0}">
                        <tr style="background-color: #f9f9f9;">
                    </c:when>
                    <c:otherwise>
                        <tr style="background-color: white;">
                    </c:otherwise>
                </c:choose>
                    <td style="padding: 10px;">${STT.index + 1}</td>
                    <td style="padding: 10px;">
                        <c:choose>
                            <c:when test="${cate.images != null && cate.images.length() >= 5 && cate.images.substring(0,5) != 'https'}">
                                <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                            </c:when>
                            <c:otherwise>
                                <c:url value="${cate.images}" var="imgUrl"></c:url>
                            </c:otherwise>
                        </c:choose>
                        <img src="${imgUrl}" alt="Product Image" style="max-height: 150px; max-width: 200px; border-radius: 5px;">
                    </td>
                    <td style="padding: 10px;">${cate.categoryid}</td>
                    <td style="padding: 10px; text-align: center;">${cate.categoryname}</td>
                    <td style="padding: 10px;">
                        <c:if test="${cate.status == 1}">
                            <span style="color: green; font-weight: bold;">Active</span>
                        </c:if>
                        <c:if test="${cate.status != 1}">
                            <span style="color: red; font-weight: bold;">Locked</span>
                        </c:if>
                    </td>
                    <td style="padding: 10px;">${cate.price}</td>
                    <td style="padding: 10px; text-align: left;">
                        <c:if test="${cate.desc.length() > 500}">
                            ${cate.desc.substring(0, 500)}...
                        </c:if>
                        <c:if test="${cate.desc.length() <= 500}">
                            ${cate.desc}
                        </c:if>
                    </td>
                    <td style="padding: 10px;">
                        <a href="<c:url value='/admin/category/edit?id=${cate.categoryid}'/>" 
                           style="color: #007BFF; text-decoration: none;">Edit</a>
                        |
                        <a href="<c:url value='/admin/category/delete?id=${cate.categoryid}'/>" 
                           style="color: #FF0000; text-decoration: none;">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div style="text-align: center; margin-top: 20px;">
        <a href="${pageContext.request.contextPath}/admin/checkout" 
           style="display: inline-block; padding: 10px 20px; background-color: #28a745; color: white; text-decoration: none; border-radius: 5px;">Check Out!</a>
    </div>
</body>
