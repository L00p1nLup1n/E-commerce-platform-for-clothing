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

	<input type="hidden" id="productid" name="productid"
		value="${product.id}">

	<label for="categoryid">Category:</label><br> 
	<select id="categoryid" name="categoryid" required>
		<option value="1" ${product.categoryid == '1' ? 'selected' : ''}>Men</option>
		<option value="2" ${product.categoryid == '2' ? 'selected' : ''}>Unisex</option>
		<option value="3" ${product.categoryid == '3' ? 'selected' : ''}>Women</option>
		<option value="4" ${product.categoryid == '4' ? 'selected' : ''}>Outerwear</option>
		<option value="5" ${product.categoryid == '5' ? 'selected' : ''}>Business</option>
		<option value="6" ${product.categoryid == '6' ? 'selected' : ''}>Kids</option>
	</select><br>


	<!-- Category name -->
	<label for="productname">Product name:</label><br> <input
		type="text" id="productname" name="productname"
		value="${product.name}" required><br>

	<!-- Description -->
	<label for="description">Description:</label><br>
	<textarea id="description" name="description"
		placeholder="Enter description here">${product.description}</textarea>
	<br>

	<!-- Price -->
	<label for="price">Price:</label><br> <input type="number"
		id="price" name="price" min="0" step="0.01" placeholder="Enter price"
		value="${product.price}" required><br>

	<!-- Images -->
	<label for="image">Images:</label><br>
	<c:choose>
		<c:when
			test="${product.image != null && product.image.length() >= 5 && product.image.substring(0,5) != 'https'}">
			<c:url value="/image?fname=${product.image}" var="imgUrl"></c:url>
		</c:when>
		<c:otherwise>
			<c:url value="${product.image}" var="imgUrl"></c:url>
		</c:otherwise>
	</c:choose>
	<img height="150" width="200" src="${imgUrl}" alt="Category Image" /><br>
	<input type="file" id="image" name="image"><br>

	<!-- Status -->
	<label for="status">Status:</label><br> 
	<input type="radio" id="ston" name="status" value="1" ${product.status == 1 ? 'checked="checked"' : ''}>
	<label for="ston">Active</label>
	<br> 
	<input type="radio" id="stoff" name="status" value="0" ${product.status != 1 ? 'checked="checked"' : ''}>
	<label for="stoff">Stopped</label>
	<br>

	<!-- Submit button -->
	<input type="submit" value="Update">
</form>
