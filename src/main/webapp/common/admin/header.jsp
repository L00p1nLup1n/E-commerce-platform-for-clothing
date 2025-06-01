<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url value="/" var="URL"></c:url>


<!-- BEGIN TOP BAR -->
<div class="pre-header">
	<div class="container">
		<div class="row">
			<!-- BEGIN TOP BAR LEFT PART -->
			<div class="col-md-6 col-sm-6 additional-shop-info">
				<ul class="list-unstyled list-inline">

					<!-- BEGIN CURRENCIES -->
					<li><i class="userRole"></i><span>Administrator</span></li>
					<!-- END CURRENCIES -->
					<!-- BEGIN LANGS -->

					<!-- END LANGS -->
				</ul>
			</div>
			<!-- END TOP BAR LEFT PART -->
			<!-- BEGIN TOP BAR MENU -->
			<div class="col-md-6 col-sm-6 additional-nav">
				<ul class="list-unstyled list-inline pull-right">

					<c:choose>
						<c:when test="${sessionScope.account == null }">
							<li><a href="${pageContext.request.contextPath }/login">Login
							</a></li>
							<li><a href="${pageContext.request.contextPath }/register">Register
							</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="${pageContext.request.contextPath }/member/myaccount">${sessionScope.account.fullname}</a></li>
							<li><a href="${pageContext.request.contextPath }/logout">Logout
							</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!-- END TOP BAR MENU -->
		</div>
	</div>
</div>
<!-- END TOP BAR -->
<!-- BEGIN HEADER -->
<div class="header">
	<div class="container">
		<a class="site-logo"
			href="${pageContext.request.contextPath}/admin/home"><img
			src="${URL}/assets/frontend/layout/img/logos/iu_store_logo.png"
			alt="IU SHOP UI"></a> <a href="javascript:void(0);"></a> <a
			href="javascript:void(0);" class="mobi-toggler"><i
			class="fa fa-bars"></i></a>

		<!-- BEGIN CART -->
		<div class="top-cart-block">
			<div class="top-cart-info">
				<a href="javascript:void(0);" class="top-cart-info-count">0
					items</a> <a href="javascript:void(0);" class="top-cart-info-value">$0</a>
			</div>
			<i class="fa fa-shopping-cart"></i>

			<div class="top-cart-content-wrapper">
				<div class="top-cart-content" style="border: 1px solid grey">
					<ul class="scroller" style="height: 250px;">
					</ul>
					<div class="text-right">
						<a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-primary">Manage Products</a>
					</div>
				</div>
			</div>
		</div>
		<!--END CART -->

		<!-- BEGIN NAVIGATION -->
		<div class="header-navigation">
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/home"> Home </a></li>
				<li><a href="${pageContext.request.contextPath}/admin/search?categoryname=Kids"> Kids </a></li>
				<li><a href="${pageContext.request.contextPath}/admin/search?categoryname=Men"> Men </a></li>
				<li><a href="${pageContext.request.contextPath}/admin/search?categoryname=Women"> Women </a></li>
				<li><a href="${pageContext.request.contextPath}/admin/search?categoryname=Unisex"> Unisex </a></li>
				<li><a href="${pageContext.request.contextPath}/admin/search?categoryname=Outerwear"> Outerwear </a></li>
				<li><a href="${pageContext.request.contextPath}/admin/search?categoryname=Business"> Business </a></li>				
				<!-- BEGIN TOP SEARCH -->
				<li class="menu-search"><span class="sep"></span> <i
					class="fa fa-search search-btn"></i>
					<div class="search-box">
						<form action="#">
							<div class="input-group">
								<input type="text" placeholder="Search" class="form-control">
								<span class="input-group-btn">
									<button class="btn btn-primary" type="submit">Search</button>
								</span>
							</div>
						</form>
					</div></li>
				<!-- END TOP SEARCH -->
			</ul>
		</div>
		<!-- END NAVIGATION -->
	</div>
</div>
<!-- Header END -->