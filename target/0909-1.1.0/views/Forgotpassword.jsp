<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password?</title>
</head>
<body>
	<table border="1" cellpadding="10" cellspacing="0" align="center">
		<tr>
			<td colspan="2" align="center">
				<h2>Forgot Password</h2>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><c:if test="${alert != null}">
					<p style="color: red;">${alert}</p>
				</c:if></td>
		</tr>
		<form action="${pageContext.request.contextPath}/forgotpassword"
			method="post">
			<tr>
				<td align="right"><label for="username">Enter Username:</label>
				</td>
				<td><input type="text" id="username" name="username"></td>
			</tr>
			<tr>
				<td align="right"><label for="email">Enter Email:</label></td>
				<td><input type="email" id="email" name="email"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Confirm</button>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>
