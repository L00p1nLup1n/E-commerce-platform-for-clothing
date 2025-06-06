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
<form action="${pageContext.request.contextPath}/admin/category/insert"
	method="post" enctype="multipart/form-data">
	<label for="categoryid">Category:</label><br> 
	<select id="categoryid" name="categoryid" required>
		<option value="1">Men</option>
		<option value="2">Unisex</option>
		<option value="3">Women</option>
		<option value="4">Outerwear</option>
		<option value="5">Business</option>
		<option value="6">Kids</option>
	</select><br>

	<label for="productname">Product name:</label><br> 
	<input type="text" id="productname" name="productname" placeholder="Enter product name"><br> 

	<label for="description">Description:</label><br>
	<textarea id="description" name="description" rows="5" cols="40" placeholder="Enter description here"></textarea><br> 

	<label for="price">Price:</label><br> 
	<input type="number" id="price" name="price" min="0" step="0.01" placeholder="Enter price"><br> 

	<label for="image">Images:</label><br>
	<img height="150" width="200" src="" /> <input type="file" id="image" 
	name="image"> 

	<label for="status">Status:</label><br> 

	<input type="radio" id="ston" name="status" value="1" checked> 
	<label for="ston">Active</label><br> 

	<input type="radio" id="stoff" name="status" value="0"> 
	<label for="stoff">Stopped</label><br>

	<input type="submit" value="Insert">
</form>
