<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@include file="/common/taglib.jsp"%>
<c:url value="/" var="URL"></c:url>
<%@ include file="/common/web/slider.jsp"%>
<!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
<div class="row margin-bottom-40">
  <!-- BEGIN SALE PRODUCT -->
  <div class="col-md-12 sale-product">
    <h2>New arrival</h2>
    <div class="owl-carousel owl-carousel5">
      <c:forEach var="product" items="${products}">
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
              <img src="${imgUrl}" class="img-responsive "alt="${product.name}" style="max-height: 150px; max-width: 200px;">
            </div>
            <h3>${product.name}</h3>
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
    <ul class="list-group margin-bottom-25 sidebar-menu">
      <li class="list-group-item clearfix">
        <a href="shop-product-list.html"
          ><i class="fa fa-angle-right"></i> Filters</a
        >
      </li>
      <li class="list-group-item clearfix">
        <a href="shop-product-list.html"
          ><i class="fa fa-angle-right"></i> Suspensions</a
        >
      </li>
      <li class="list-group-item clearfix">
        <a href="shop-product-list.html"
          ><i class="fa fa-angle-right"></i> Brakes</a
        >
      </li>
      <li class="list-group-item clearfix">
        <a href="shop-product-list.html"
          ><i class="fa fa-angle-right"></i> Accessories</a
        >
      </li>
      <li class="list-group-item clearfix">
        <a href="shop-product-list.html"
          ><i class="fa fa-angle-right"></i> Tires</a
        >
      </li>
      <li class="list-group-item clearfix">
        <a href="shop-product-list.html"
          ><i class="fa fa-angle-right"></i> Spark Plugs</a
        >
      </li>
    </ul>
  </div>
  <!-- END SIDEBAR -->
  <!-- BEGIN CONTENT -->
  <div class="col-md-9 col-sm-8">
    <h2>Top Picks for you</h2>
    <div class="owl-carousel owl-carousel3">
      <div>
        <div class="product-item">
          <div class="pi-img-wrapper uniform-wrapper">
            <img
              src="${URL}assets/frontend/pages/img/products/gsport.jpg"
              class="img-responsive"
              alt="YSS"
            />
          </div>
          <h3>
            <a href="shop-item.html">YSS G-Sport</a>
          </h3>
          <div class="pi-price">$129</div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-default add2cart"
            >Add to cart</a
          >
          <div class="sticker sticker-new"></div>
        </div>
      </div>
      <div>
        <div class="product-item">
          <div class="pi-img-wrapper uniform-wrapper">
            <img
              src="${URL}assets/frontend/pages/img/products/dna.jpg"
              class="img-responsive"
              alt="DNA"
            />
          </div>
          <h3>
            <a href="shop-item.html">DNA Filters</a>
          </h3>
          <div class="pi-price">$60</div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-default add2cart"
            >Add to cart</a
          >
        </div>
      </div>
      <div>
        <div class="product-item">
          <div class="pi-img-wrapper uniform wrapper">
            <img
              src="${URL}assets/frontend/pages/img/products/rcb.jpg"
              class="img-responsive"
              alt="RCB pump"
            />
          </div>
          <h3>
            <a href="shop-item.html">RCB S1 Master Brake Pump</a>
          </h3>
          <div class="pi-price">$60</div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-default add2cart"
            >Add to cart</a
          >
        </div>
      </div>
      <div>
        <div class="product-item">
          <div class="pi-img-wrapper uniform-wrapper">
            <img
              src="${URL}assets/frontend/pages/img/products/honda.jpg"
              class="img-responsive"
              alt="Berry Lace Dress"
            />
          </div>
          <h3>
            <a href="shop-item.html">Honda Spark Plugs</a>
          </h3>
          <div class="pi-price">$7</div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-default add2cart"
            >Add to cart</a
          >
          <div class="sticker sticker-sale"></div>
        </div>
      </div>
      <div>
        <div class="product-item">
          <div class="pi-img-wrapper uniform-wrapperr">
            <img
              src="${URL}assets/frontend/pages/img/products/rcbdisc.jpg"
              class="img-responsive"
              alt="Berry Lace Dress"
            />
          </div>
          <h3>
            <a href="shop-item.html">RCB Brake Rotor</a>
          </h3>
          <div class="pi-price">$50</div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-default add2cart"
            >Add to cart</a
          >
        </div>
      </div>
      <div>
        <div class="product-item">
          <div class="pi-img-wrapper uniform-wrapper">
            <img
              src="${URL}assets/frontend/pages/img/products/liqui.jpg"
              class="img-responsive"
              alt="Liqui"
            />
          </div>
          <h3>
            <a href="shop-item.html">Liqui Moly Motor Oil 1L</a>
          </h3>
          <div class="pi-price">$15</div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-default add2cart"
            >Add to cart</a
          >
        </div>
      </div>
    </div>
  </div>
  <!-- END CONTENT -->
</div>
<!-- END SIDEBAR & CONTENT -->
<!-- BEGIN TWO PRODUCTS & PROMO -->
<div class="row margin-bottom-35">
  <!-- BEGIN TWO PRODUCTS -->
  <div class="col-md-6 two-items-bottom-items">
    <h2>Promotions</h2>
    <div class="owl-carousel owl-carousel2">
      <div>
        <div class="product-item">
          <div class="pi-img-wrapper uniform-wrapper">
            <img
              src="${URL}assets/frontend/pages/img/products/gsport.jpg"
              class="img-responsive"
              alt="Berry Lace Dress"
            />
          </div>
          <h3>
            <a href="shop-item.html">YSS G-Sport</a>
          </h3>
          <div class="pi-price">$129</div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-default add2cart"
            >Add to cart</a
          >
        </div>
      </div>
      <div>
        <div class="product-item">
          <div class="pi-img-wrapper uniform-wrapper">
            <img
              src="${URL}assets/frontend/pages/img/products/dna.jpg"
              class="img-responsive"
              alt="Berry Lace Dress"
            />
          </div>
          <h3>
            <a href="shop-item.html">DNA Filters</a>
          </h3>
          <div class="pi-price">$60</div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-default add2cart"
            >Add to cart</a
          >
        </div>
      </div>
      <div>
        <div class="product-item">
          <div class="pi-img-wrapper uniform wrapper">
            <img
              src="${URL}assets/frontend/pages/img/products/rcb.jpg"
              class="img-responsive"
              alt="RCB pump"
            />
          </div>
          <h3>
            <a href="shop-item.html">RCB S1 Master Brake Pump</a>
          </h3>
          <div class="pi-price">$60</div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-default add2cart"
            >Add to cart</a
          >
        </div>
      </div>
      <div>
        <div class="product-item">
          <div class="pi-img-wrapper uniform-wrapper">
            <img
              src="${URL}assets/frontend/pages/img/products/honda.jpg"
              class="img-responsive"
              alt="Berry Lace Dress"
            />
          </div>
          <h3>
            <a href="shop-item.html">Honda Spark Plugs</a>
          </h3>
          <div class="pi-price">$7</div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-default add2cart"
            >Add to cart</a
          >
          <div class="sticker sticker-sale"></div>
        </div>
      </div>
      <div>
        <div class="product-item">
          <div class="pi-img-wrapper uniform-wrapperr">
            <img
              src="${URL}assets/frontend/pages/img/products/rcbdisc.jpg"
              class="img-responsive"
              alt="Berry Lace Dress"
            />
          </div>
          <h3>
            <a href="shop-item.html">RCB Brake Rotor</a>
          </h3>
          <div class="pi-price">$50</div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-default add2cart"
            >Add to cart</a
          >
        </div>
      </div>
      <div>
        <div class="product-item">
          <div class="pi-img-wrapper uniform-wrapper">
            <img
              src="${URL}assets/frontend/pages/img/products/liqui.jpg"
              class="img-responsive"
              alt="Liqui"
            />
          </div>
          <h3>
            <a href="shop-item.html">Liqui Moly Motor Oil 1L</a>
          </h3>
          <div class="pi-price">$15</div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-default add2cart"
            >Add to cart</a
          >
        </div>
      </div>
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
              src="${URL}assets/frontend/pages/img/index-sliders/yssbanner.jpg"
              class="img-responsive"
              alt="Berry Lace Dress"
            />
          </div>
          <div class="item">
            <img
              src="${URL}assets/frontend/pages/img/index-sliders/hondabanner.jpg"
              class="img-responsive"
              alt="Berry Lace Dress"
            />
          </div>
          <div class="item">
            <img
              src="${URL}assets/frontend/pages/img/index-sliders/rcbbanner.jpg"
              class="img-responsive"
              alt="Berry Lace Dress"
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

<!-- POP UP view of YSS G-Sport -->
<div id="product-pop-up1" style="display: none; width: 700px">
  <div class="product-page product-pop-up">
    <div class="row">
      <div class="col-md-6 col-sm-6 col-xs-3">
        <div class="product-main-image">
          <img
            src="${URL}assets/frontend/pages/img/products/gsport.jpg"
            alt="YSS G-Sport"
            class="img-responsive"
          />
        </div>
      </div>
      <div class="col-md-6 col-sm-6 col-xs-9">
        <h2>Cool green dress with red bell</h2>
        <div class="price-availability-block clearfix">
          <div class="price">
            <strong><span>$</span>129.99</strong>
          </div>
          <div class="availability">
            Availability: <strong>In Stock</strong>
          </div>
        </div>
        <div class="description">
          <p>
            The YSS G-Sport Suspension is engineered for performance and
            reliability, making it the perfect choice for riders seeking
            improved handling and comfort. With precision tuning and advanced
            materials, it delivers superior road grip and shock absorption,
            enhancing your riding experience across all terrains. Elevate your
            motorcycle's stability and style with this premium suspension
            solution, designed to meet the demands of enthusiasts and
            professionals alike.
          </p>
        </div>
        <div class="product-page-options">
          <div class="pull-left">
            <label class="control-label">Color:</label>
            <select class="form-control input-sm">
              <option>Red</option>
              <option>Silver</option>
              <option>Black</option>
            </select>
          </div>
        </div>
        <div class="product-page-cart">
          <div class="product-quantity">
            <input
              id="product-quantity"
              type="text"
              value="1"
              readonly
              name="product-quantity"
              class="form-control input-sm"
            />
          </div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-primary"
            type="submit"
            >Add to cart</a
          >
          <a href="shop-item.html" class="btn btn-default">More details</a>
        </div>
      </div>

      <div class="sticker sticker-sale"></div>
    </div>
  </div>
</div>
<!-- POP UP view of a product -->
<div id="product-pop-up2" style="display: none; width: 700px">
  <div class="product-page product-pop-up">
    <div class="row">
      <div class="col-md-6 col-sm-6 col-xs-3">
        <div class="product-main-image">
          <img
            src="${URL}assets/frontend/pages/img/products/model7.jpg"
            alt="Cool green dress with red bell"
            class="img-responsive"
          />
        </div>
        <div class="product-other-images">
          <a href="#" class="active"
            ><img
              alt="Berry Lace Dress"
              src="${URL}assets/frontend/pages/img/products/model3.jpg"
          /></a>
          <a href="#"
            ><img
              alt="Berry Lace Dress"
              src="${URL}assets/frontend/pages/img/products/model4.jpg"
          /></a>
          <a href="#"
            ><img
              alt="Berry Lace Dress"
              src="${URL}assets/frontend/pages/img/products/model5.jpg"
          /></a>
        </div>
      </div>
      <div class="col-md-6 col-sm-6 col-xs-9">
        <h2>Cool green dress with red bell</h2>
        <div class="price-availability-block clearfix">
          <div class="price">
            <strong><span>$</span>47.00</strong> <em>$<span>62.00</span></em>
          </div>
          <div class="availability">
            Availability: <strong>In Stock</strong>
          </div>
        </div>
        <div class="description">
          <p>
            Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh
            sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis
            molestie at dolore.
          </p>
        </div>
        <div class="product-page-options">
          <div class="pull-left">
            <label class="control-label">Size:</label>
            <select class="form-control input-sm">
              <option>L</option>
              <option>M</option>
              <option>XL</option>
            </select>
          </div>
          <div class="pull-left">
            <label class="control-label">Color:</label>
            <select class="form-control input-sm">
              <option>Red</option>
              <option>Blue</option>
              <option>Black</option>
            </select>
          </div>
        </div>
        <div class="product-page-cart">
          <div class="product-quantity">
            <input
              id="product-quantity"
              type="text"
              value="1"
              readonly
              name="product-quantity"
              class="form-control input-sm"
            />
          </div>
          <a
            href="${pageContext.request.contextPath }/login"
            class="btn btn-primary"
            type="submit"
            >Add to cart</a
          >
          <a href="shop-item.html" class="btn btn-default">More details</a>
        </div>
      </div>

      <div class="sticker sticker-sale"></div>
    </div>
  </div>
</div>
