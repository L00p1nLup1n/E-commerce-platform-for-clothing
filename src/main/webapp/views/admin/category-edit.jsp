<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<style>
textarea#description {
	resize: none; /* Prevent resizing */
	width: 100%; /* Make it responsive */
	max-width: 400px; /* Limit maximum width */
	height: 150px; /* Set fixed height */
}
</style>

<form action="${pageContext.request.contextPath}/admin/category/update"
	method="post" enctype="multipart/form-data">
	<!-- Hidden field for category ID -->
	<input type="hidden" id="categoryid" name="categoryid"
		value="${cate.categoryid}">

	<!-- Category name -->
	<label for="categoryname">Category name:</label><br> <input
		type="text" id="categoryname" name="categoryname"
		value="${cate.categoryname}" required><br>

	<!-- Description -->
	<label for="description">Description:</label><br>
	<textarea id="description" name="description"
		placeholder="Enter description here">${cate.desc}</textarea>
	<br>

	<!-- Price -->
	<label for="price">Price:</label><br> <input type="number"
		id="price" name="price" min="0" step="0.01" placeholder="Enter price"
		value="${cate.price}" required><br>

	<!-- Images -->
	<label for="images">Images:</label><br>
	<c:choose>
		<c:when
			test="${cate.images != null && cate.images.length() >= 5 && cate.images.substring(0,5) != 'https'}">
			<c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
		</c:when>
		<c:otherwise>
			<c:url value="${cate.images}" var="imgUrl"></c:url>
		</c:otherwise>
	</c:choose>
	<img height="150" width="200" src="${imgUrl}" alt="Category Image" /><br>
	<input type="file" id="images" name="images"><br>

	<!-- Status -->
	<label for="status">Status:</label><br> <input type="radio"
		id="ston" name="status" value="1" ${cate.status == 1 ? 'checked' : ''}>
	<label for="ston">Active</label><br> <input type="radio"
		id="stoff" name="status" value="0"
		${cate.status != 1 ? 'checked' : ''}> <label for="stoff">Stopped</label><br>

	<!-- Submit button -->
	<input type="submit" value="Update">
</form>
