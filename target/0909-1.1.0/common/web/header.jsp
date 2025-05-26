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
                <a href="${pageContext.request.contextPath }/member/myaccount"
                  >${sessionScope.account.fullname }</a
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
    <a class="site-logo" href="${pageContext.request.contextPath}/home"
      ><img
        src="${URL}/assets/frontend/layout/img/logos/iu_store_logo.png"
        alt="IU SHOP UI"
    /></a>
    <a href="javascript:void(0);"></a>
    <a href="javascript:void(0);" class="mobi-toggler"
      ><i class="fa fa-bars"></i
    ></a>

    <!-- BEGIN CART -->
    <div class="top-cart-block">
      <div class="top-cart-info">
        <a
          href="#"
          class="top-cart-info-count"
        >
          <c:choose>
            <c:when test="${sessionScope.cart == null}">0</c:when>
            <c:otherwise>${sessionScope.cartItems}</c:otherwise>
          </c:choose>
          item(s)
        </a>
        <a href="javascript:void(0);" class="top-cart-info-value">
          <c:choose>
            <c:when
              test="${sessionScope.cart == null || sessionScope.cartItems == 0}"
              >$0</c:when
            >
            <c:otherwise
              >$<fmt:formatNumber
                value="${sessionScope.cartPrice}"
                type="number"
                maxFractionDigits="2"
            /></c:otherwise>
          </c:choose>
        </a>
      </div>
      <i class="fa fa-shopping-cart"></i>
      <div class="top-cart-content-wrapper">
        <div class="top-cart-content">
          <ul class="scroller" style="height: 250px">
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
                    <a href="shop-item.html">${item.name}</a>
                    <div>Quantity: ${item.quantity}</div>
                    <div>
                      Price:
                      <fmt:formatNumber
                        value="${item.getSubtotal()}"
                        type="number"
                        maxFractionDigits="2"
                      />$
                    </div>
                  </li>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <li>
                  <span class="cart-content-count"></span>
                  <strong>
                    <a href="${pageContext.request.contextPath}/login" style="text-decoration: underline;";">You must login first!</a>
                  </strong>
                </li>
              </c:otherwise>
            </c:choose>
          </ul>
          <div class="text-right">
            <a
              href="#"
              class="btn btn-primary"
              >View Cart</a
            >
          </div>
        </div>
      </div>
    </div>
    <!--END CART -->

    <!-- BEGIN NAVIGATION -->
    <div class="header-navigation">
      <ul>
        <li><a> Home </a></li>
        <li><a> Suspensions </a></li>
        <li><a> Filters </a></li>
        <li><a> Spark plugs </a></li>
        <li><a> Tires </a></li>
        <li><a> Brakes </a></li>
        <li><a> Services </a></li>

        <!-- BEGIN TOP SEARCH -->
        <li class="menu-search">
          <span class="sep"></span> <i class="fa fa-search search-btn"></i>
          <div class="search-box">
            <form action="#">
              <div class="input-group">
                <input type="text" placeholder="Search" class="form-control" />
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
