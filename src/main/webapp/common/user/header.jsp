<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@include file="/common/taglib.jsp"%>
<c:url value="/" var="URL"></c:url>

<!-- BEGIN TOP BAR -->
<div class="pre-header">
  <div class="container">
    <div class="row">
      <!-- BEGIN TOP BAR LEFT PART -->
      <div class="col-md-6 col-sm-6 additional-shop-info">
        <ul class="list-unstyled list-inline">
          <li><i class="fa fa-phone"></i><span>0909 911113</span></li>
          <!-- BEGIN CURRENCIES -->

          <!-- END CURRENCIES -->
        </ul>
      </div>
      <!-- END TOP BAR LEFT PART -->
      <!-- BEGIN TOP BAR MENU -->
      <div class="col-md-6 col-sm-6 additional-nav">
        <ul class="list-unstyled list-inline pull-right">
          <c:choose>
            <c:when test="${sessionScope.account == null }">
              <li>
                <a href="${pageContext.request.contextPath }/login">Login </a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath }/register"
                  >Register
                </a>
              </li>
            </c:when>
            <c:otherwise>
              <li>
                <a href="${pageContext.request.contextPath}/member/myaccount"
                  >Hello, ${sessionScope.account.fullname}!</a
                >
              </li>
              <li>
                <a href="${pageContext.request.contextPath }/logout">Logout </a>
              </li>
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
    <a class="site-logo" href="${pageContext.request.contextPath}/users/home"
      ><img
        src="${URL}/assets/frontend/layout/img/logos/iu_store_logo.png"
        alt="IU SHOP UI"
    /></a>
    <a href="javascript:void(0);"></a>
    <a href="javascript:void(0);" class="mobi-toggler"
      ><i class="fa fa-bars"></i
    ></a>

    <!-- BEGIN CART -->
    <c:if test="${pageContext.request.servletPath != '/Cart'}">
      <div class="top-cart-block">
        <div class="top-cart-info">
          <a
            href="${sessionScope.account != null ? pageContext.request.contextPath.concat('/Cart') : pageContext.request.contextPath.concat('/login')}"
            class="top-cart-info-count"
            id="cart-count"
          >
            <c:choose>
              <c:when test="${sessionScope.cart == null}">0</c:when>
              <c:otherwise>${sessionScope.cartItems}</c:otherwise>
            </c:choose>
            item(s)
          </a>

          <a href="javascript:void(0);" class="top-cart-info-value" id="cart-price">
            <c:choose>
              <c:when test="${sessionScope.cart == null || sessionScope.cartItems == 0}">$0</c:when>
              <c:otherwise>
                $<fmt:formatNumber value="${sessionScope.cartPrice}" type="number" minFractionDigits="1" maxFractionDigits="3"/>
              </c:otherwise>
            </c:choose>
          </a>
        </div>
        <i class="fa fa-shopping-cart"></i>
        <div class="top-cart-content-wrapper">
          <div class="top-cart-content" style="width: 550px; border: 1px solid grey">
            <ul class="scroller" style="height: 250px">
              <!-- Check if user is logged in and if cart is empty-->
              <c:choose>
                <c:when test="${not empty sessionScope.account}">
                  <c:choose>
                  <c:when test="${not empty sessionScope.cart}">
                    <c:forEach var="item" items="${sessionScope.cart}">
                      <li
                        style="
                          display: flex;
                          justify-content: space-around;
                          align-items: center;
                        "
                      >
                        <c:set var="itemName" value="${fn:length(item.name) > 20 ? fn:substring(item.name, 0, 20) : item.name}" />
                        <c:set var="itemName" value="${fn:length(item.name) > 20 ? itemName.concat('...') : itemName}" />
                        <a href="${pageContext.request.contextPath}/products?productid=${item.id}">${itemName}</a>
                        <div>Quantity: ${item.quantity}</div>
                        <div>
                          Price:
                          <fmt:formatNumber
                            value="${item.getSubtotal()}"
                            type="number"
                            minFractionDigits="1"
                            maxFractionDigits="3"
                          />$
                        </div>
                      </li>
                    </c:forEach>
                    <!-- If cart is empty -->
                  </c:when>
                  <c:otherwise>
                  <li>
                    <span class="cart-content-count"></span>
                    <strong>
                      <a href="${pageContext.request.contextPath}/Cart">No items in cart right now</a>
                    </strong>
                  </li>
                  </c:otherwise>
                  </c:choose>
                </c:when>
                <c:otherwise>
                  <li>
                    <span class="cart-content-count"></span>
                    <strong>
                      <a
                        href="${pageContext.request.contextPath}/login"
                        style="text-decoration: underline;"
                        >You must login first!</a
                      >
                    </strong>
                  </li>
                </c:otherwise>
              </c:choose>

            </ul>
            <div class="text-right">
              <a
                href="${sessionScope.account != null ? pageContext.request.contextPath.concat('/Cart') : pageContext.request.contextPath.concat('/login')}"
                class="btn btn-primary"
                >View Cart</a
              >
            </div>
          </div>
        </div>
      </div>
    </c:if>
    <!-- END CART -->

    <!-- BEGIN NAVIGATION -->
    <div class="header-navigation">
      <ul>
        <li><a href="${sessionScope.account != null ? pageContext.request.contextPath.concat('/users/home') : pageContext.request.contextPath.concat('/home')}"> Home </a></li>
        <li><a href="${pageContext.request.contextPath}/search?categoryname=Kids"> Kids </a></li>
        <li><a href="${pageContext.request.contextPath}/search?categoryname=Men"> Men </a></li>
        <li><a href="${pageContext.request.contextPath}/search?categoryname=Women"> Women </a></li>
        <li><a href="${pageContext.request.contextPath}/search?categoryname=Unisex"> Unisex </a></li>
        <li><a href="${pageContext.request.contextPath}/search?categoryname=Outerwear"> Outerwear </a></li>
        <li><a href="${pageContext.request.contextPath}/search?categoryname=Business"> Business </a></li>

        <!-- BEGIN TOP SEARCH -->
        <li class="menu-search">
          <span class="sep"></span> <i class="fa fa-search search-btn"></i>
          <div class="search-box">
            <form action="${pageContext.request.contextPath}/search" method="get">
              <div class="input-group">
                <input type="text" name="query" placeholder="Search" class="form-control" required autofocus/>
                <span class="input-group-btn">
                  <button class="btn btn-primary" type="submit">Search</button>
                </span>
              </div>
            </form>
          </div>
        </li>
        <!-- END TOP SEARCH -->
      </ul>
    </div>
    <!-- END NAVIGATION -->
  </div>
</div>
<!-- Header END -->
