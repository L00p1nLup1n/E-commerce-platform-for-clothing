<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Order Confirmation</title>
</head>
<body
	style="font-family: Arial, sans-serif; background-color: #f8f9fa; margin: 0; padding: 0;">
	<div
		style="width: 60%; margin: 50px auto; background: #ffffff; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); padding: 20px;">
		<h1 style="color: #28a745; text-align: center;"> Order Confirmed!</h1>
		<p style="text-align: center;">
			Thank you for your order, <strong>${sessionScope.account.username}</strong>!
			Your order has been successfully placed and is being processed.
		</p>

		<!-- Section for user details -->
		<div style="margin-bottom: 20px;">	
			<h2 style="color: #333;">Contact Information</h2>
			<p>
				<strong>Name:</strong> ${sessionScope.account.username}
			</p>
			<p>
				<strong>Email:</strong> ${sessionScope.account.email}
			</p>
			<p>
				<strong>Phone Number:</strong> ${sessionScope.account.phone}
			</p>
		</div>		
		<!-- Section for action buttons -->
		<div style="text-align: center; margin-top: 20px;">
			<a href="${pageContext.request.contextPath}/users/home"
				style="background-color: #28a745; color: white; padding: 10px 20px; text-decoration: none; border-radius: 4px; font-size: 16px;">
				Back to Home </a>
		</div>
	</div>
</body>
</html>
