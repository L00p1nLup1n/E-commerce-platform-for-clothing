<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!-- BEGIN CONTENT -->
<div class="col-md-9 col-sm-9">
	<h1>Create an account</h1>
	<div class="content-form-page">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<c:if test="${alert !=null}">
					<h3 class="alert alert danger">${alert}</h3>
				</c:if>
				<form action="${pageContext.request.contextPath}/register"
					method="post" class="form-horizontal" role="form">
					<fieldset>
						<legend>Your personal details</legend>
						<div class="form-group">
							<label for="firstname" class="col-lg-4 control-label">Username
								<span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="text" class="form-control" id="firstname"
									name="username" required>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-lg-4 control-label">Password
								<span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="text" class="form-control" id="lastname"
									name="pass" required>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-lg-4 control-label">Email <span
								class="require">*</span></label>
							<div class="col-lg-8">
								<input type="text" class="form-control" id="email" name="email"
									required>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-lg-4 control-label">Fullname
								<span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="text" class="form-control" id="password"
									name="fullname" required>
							</div>
						</div>
						<div class="form-group">
							<label for="confirm-password" class="col-lg-4 control-label">Phone
								<span class="require">*</span>
							</label>
							<div class="col-lg-8">
								<input type="number" class="form-control" id="confirm-password"
									name="phone" required>
							</div>
						</div>
					</fieldset>
					<div class="row">
						<div
							class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
							<button type="submit" class="btn btn-primary">Create an
								account</button>
							<button type="button" class="btn btn-default">Cancel</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
</div>

<!-- END CONTENT -->






