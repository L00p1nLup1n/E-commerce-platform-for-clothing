<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@include file="/common/taglib.jsp"%>
<c:url value="/" var="URL"></c:url>
<%@ include file="/common/web/slider.jsp"%>
<!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
<div class="row margin-bottom-40">
  <!-- BEGIN SALE PRODUCT -->
  <div class="col-md-12 sale-product">
    <h2>New arrival</h2>
    <div class="owl-carousel owl-carousel5">
      <c:forEach var="product" items="${newArrivals}">
      <div>
        <a
          href="${pageContext.request.contextPath}/products?productid=${product.id}"
          style="text-decoration: none; color: inherit;"
        >
          <div class="product-item" style="cursor: pointer;">
            <div class="pi-img-wrapper uniform-wrapper">
              <c:choose>
                <c:when test="${product.image != null && product.image.length() >= 5 && product.image.substring(0,5) != 'https'}">
                   <c:url value="/image?fname=${product.image}" var="imgUrl"></c:url>
                </c:when>
                <c:otherwise>
                   <c:url value="${product.image}" var="imgUrl"></c:url>
                </c:otherwise>
              </c:choose>
              <img src="${imgUrl}" class="img-responsive "alt="${product.name}" style="max-height: 550px; max-width: 200px;">
            </div>
              <c:set var="productName" value="${fn:length(product.name) > 40 ? fn:substring(product.name, 0, 40) : product.name}" />
              <c:set var="productName" value="${fn:length(product.name) > 40 ? productName.concat('...') : productName}" />
              <h3>${productName}</h3>
            <div class="pi-price">${product.price}</div>
            <div class="sticker sticker-sale"></div>
          </div>
        </a>
      </div>
      </c:forEach>
    </div>
  </div>
  <!-- END SALE PRODUCT -->
</div>
<!-- END SALE PRODUCT & NEW ARRIVALS -->
<!-- BEGIN SIDEBAR & CONTENT -->
<div class="row margin-bottom-40">
  <!-- BEGIN SIDEBAR -->
    <div class="sidebar col-md-3 col-sm-4">
      <ul class="list-group margin-bottom-25 sidebar-menu" id="categoryList">
          <li class="list-group-item clearfix">
              <a href="javascript:void(0)">
                  <i class="fa fa-angle-right"></i>Kids
              </a>
          </li>
          <li class="list-group-item clearfix">
              <a href="javascript:void(0)">
                  <i class="fa fa-angle-right"></i>Men
              </a>
          </li>
          <li class="list-group-item clearfix">
              <a href="javascript:void(0)">
                  <i class="fa fa-angle-right"></i>Women
              </a>
          </li>
          <li class="list-group-item clearfix">
              <a href="javascript:void(0)">
                  <i class="fa fa-angle-right"></i>Unisex
              </a>
          </li>
          <li class="list-group-item clearfix">
              <a href="javascript:void(0)">
                  <i class="fa fa-angle-right"></i>Outerwear
              </a>
          </li>
          <li class="list-group-item clearfix">
              <a href="javascript:void(0)">
                  <i class="fa fa-angle-right"></i>Business
              </a>
          </li>
      </ul>
  </div>

  <!-- END SIDEBAR -->
  <!-- BEGIN CONTENT -->
  <div class="col-md-9 col-sm-8">
    <h2>Top Picks for you</h2>
    <div class="owl-carousel owl-carousel3">
      <c:forEach var="product" items="${randomSelect}">
      <div>
        <a
          href="${pageContext.request.contextPath}/products?productid=${product.id}"
          style="text-decoration: none; color: inherit;"
        >
          <div class="product-item" style="cursor: pointer;">
            <div class="pi-img-wrapper uniform-wrapper">
              <c:choose>
                <c:when test="${product.image != null && product.image.length() >= 5 && product.image.substring(0,5) != 'https'}">
                   <c:url value="/image?fname=${product.image}" var="imgUrl"></c:url>
                </c:when>
                <c:otherwise>
                   <c:url value="${product.image}" var="imgUrl"></c:url>
                </c:otherwise>
              </c:choose>
              <img src="${imgUrl}" class="img-responsive "alt="${product.name}" style="max-height: 550px; max-width: 200px;">
            </div>
              <c:set var="productName" value="${fn:length(product.name) > 40 ? fn:substring(product.name, 0, 40) : product.name}" />
              <c:set var="productName" value="${fn:length(product.name) > 40 ? productName.concat('...') : productName}" />
              <h3>${productName}</h3>
            <div class="pi-price">${product.price}</div>
            <div class="sticker sticker-sale"></div>
          </div>
        </a>
      </div>
      </c:forEach>
    </div>
  <!-- END CONTENT -->
</div>
</div>
<!-- END SIDEBAR & CONTENT -->
<!-- BEGIN TWO PRODUCTS & PROMO -->
<div class="row margin-bottom-35">
  <!-- BEGIN TWO PRODUCTS -->
  <div class="col-md-6 two-items-bottom-items">
    <h2>Promotions</h2>
    <div class="owl-carousel owl-carousel2">
      <c:forEach var="product" items="${promotions}">
      <div>
        <a
          href="${pageContext.request.contextPath}/products?productid=${product.id}"
          style="text-decoration: none; color: inherit;"
        >
          <div class="product-item" style="cursor: pointer;">
            <div class="pi-img-wrapper uniform-wrapper">
              <c:choose>
                <c:when test="${product.image != null && product.image.length() >= 5 && product.image.substring(0,5) != 'https'}">
                   <c:url value="/image?fname=${product.image}" var="imgUrl"></c:url>
                </c:when>
                <c:otherwise>
                   <c:url value="${product.image}" var="imgUrl"></c:url>
                </c:otherwise>
              </c:choose>
              <img src="${imgUrl}" class="img-responsive "alt="${product.name}" style="max-height: 250px; max-width: 200px;">
            </div>
              <c:set var="productName" value="${fn:length(product.name) > 40 ? fn:substring(product.name, 0, 40) : product.name}" />
              <c:set var="productName" value="${fn:length(product.name) > 40 ? productName.concat('...') : productName}" />
              <h3>${productName}</h3>
            <div class="pi-price">${product.price}</div>
            <div class="sticker sticker-sale"></div>
          </div>
        </a>
      </div>
      </c:forEach>
    </div>
  </div>
  <!-- END TWO PRODUCTS -->
  <!-- BEGIN PROMO -->
  <div class="col-md-6 shop-index-carousel">
    <div class="content-slider">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="item active">
            <img
              src="${URL}assets/frontend/pages/img/layerslider/slide2/bg.jpg"
              class="img-responsive"
            />
          </div>
          <div class="item">
            <img
              src="${URL}assets/frontend/pages/img/layerslider/slide3/bg.jpg"
              class="img-responsive"
            />
          </div>
          <div class="item">
            <img
              src="${URL}assets/frontend/pages/img/layerslider/slide5/bg.jpg"
              class="img-responsive"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- END PROMO -->
</div>
<!-- END TWO PRODUCTS & PROMO -->

<%@ include file="/common/web/brands.jsp"%> <%@ include
file="/common/web/steps.jsp"%>
<script>
  var contextPath = "${pageContext.request.contextPath}"
</script>



