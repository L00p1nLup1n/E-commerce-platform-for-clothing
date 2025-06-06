<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<!-- BEGIN CONTENT -->
<div class="col-md-12 col-sm-12">
	<h1>Welcome to our website!</h1>
	<div class="content-form-page">
		<div class="row">
			<div class="col-md-7 col-sm-7">
				<c:if test="${alert !=null}">
					<h3 class="alert alert danger">${alert}</h3>
				</c:if>
				<form action="${pageContext.request.contextPath}/login"
					method="post" class="form-horizontal form-without-legend"
					role="form">
					<div class="form-group">
						<label for="email" class="col-lg-4 control-label">Username
							<span class="require">*</span>
						</label>
						<div class="col-lg-8">
							<input type="text" class="form-control" id="username"
								name="username" required>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-lg-4 control-label">Password
							<span class="require">*</span>
						</label>
						<div class="col-lg-8">
							<input type="password" class="form-control" id="password"
								name="pass" required> <input type="checkbox"
							 	name="remember"> Remember me
						</div>
					</div>
					<div class="row">
						<div class="col-lg-8 col-md-offset-4 padding-left-0">
							<a href="${pageContext.request.contextPath}/forgotpassword">Forgot
								Password?</a>
						</div>
					</div>
					<div class="row">
						<div
							class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
							<button type="submit" class="btn btn-primary">Login</button>
						</div>
					</div>
					<div class="row">
						<div
							class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-10 padding-right-30">
							<hr>
							<div class="login-socio">
								<p class="text-muted">or login using:</p>
								<ul class="social-icons">
									<li><a href="#" data-original-title="facebook"
										class="facebook" title="facebook"></a></li>
									<li><a href="#" data-original-title="Twitter"
										class="twitter" title="Twitter"></a></li>
									<li><a href="#" data-original-title="Google Plus"
										class="googleplus" title="Google Plus"></a></li>
									<li><a href="#" data-original-title="Linkedin"
										class="linkedin" title="LinkedIn"></a></li>
								</ul>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- END CONTENT -->






