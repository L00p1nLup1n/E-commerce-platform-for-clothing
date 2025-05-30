<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@include file="/common/taglib.jsp"%>

<div class="container product-detail-page margin-top-40">
  <div class="row">
    <div class="col-md-6">
      <div class="product-main-image">
        <c:choose>
          <c:when
            test="${product.image != null && product.image.length() >= 5 && product.image.substring(0,5) != 'https'}"
          >
            <c:url value="/image?fname=${product.image}" var="imgUrl"></c:url>
          </c:when>
          <c:otherwise>
            <c:url value="${product.image}" var="imgUrl"></c:url>
          </c:otherwise>
        </c:choose>
        <img src="${imgUrl}" class="img-responsive" style="max-width: 450px; max-height: 510px;" alt="${product.name}" />
      </div>
    </div>
    <!-- Product Details -->
    <div class="col-md-6">
      <h2>${product.name}</h2>
      <div class="text-muted">${product.categoryname}</div>
      <div class="product-rating margin-bottom-10">
        <fmt:formatNumber value="${product.avgRating}" type="number" maxFractionDigits="0" var="roundedRating"/>
          <c:forEach var="i" begin="1" end="${roundedRating}">
            <span class="fa fa-star" style="color: gold"></span>
          </c:forEach>
          <c:forEach var="i" begin="${roundedRating + 1}" end="5">
            <span class="fa fa-star-o" style="color: #dcdce6"></span>
          </c:forEach> 
          <span class="text-muted">(${roundedRating})</span>
      </div>
      <div class="goods-page-price" style="color: #e74c3c">
        <strong>Price:
        $<fmt:formatNumber
          value="${product.price}"
          type="number"
          maxFractionDigits="2"
        />
        </strong>
      </div>
      <div class="margin-top-20" id="product-short-desc">
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Deleniti
        itaque illum, vero, similique exercitationem at officiis sequi
        consectetur eligendi aspernatur, corporis quos nobis reiciendis nisi
        autem iusto quae consequuntur minima!
      </div>
      <form
        action="${pageContext.request.contextPath}/Cart"
        method="post"
        class="form-inline margin-top-20"
        onsubmit="return addToCart(event)"
      >
        <input type="hidden" name="action" value="add" />
        <input type="hidden" name="productId" value="${product.id}" />
        <input type="hidden" name="productName" value="${product.name}" />
        <input type="hidden" name="productPrice" value="${product.price}" />
        <div class="form-group">
          <label for="quantity">Quantity:</label>
          <input
            type="number"
            name="quantity"
            value="1"
            min="1"
            class="form-control input-sm"
            style="width: 80px; margin-left: 10px"
          />
        </div>
        <c:choose>
          <c:when test="${not empty sessionScope.account}">
            <button type="submit" class="btn btn-success margin-left-20">
              <i class="fa fa-shopping-cart"></i> Add to Cart
            </button>
          </c:when>
          <c:otherwise>
            <a
              href="${pageContext.request.contextPath}/login"
              class="btn btn-success margin-left-20 login-noti"
            >
              <i class="fa fa-shopping-cart"></i> Add to Cart
            </a>
          </c:otherwise>
        </c:choose>
      </form>
      <div class="margin-top-20">
        <button class="btn btn-default">
          <i class="fa fa-share" style="color: red"></i> Share
        </button>
      </div>
    </div>
  </div>
  <!-- Optional: Tabs for Description, Reviews, etc. -->
  <div class="row margin-top-40">
    <div class="col-md-12">
      <ul class="nav nav-tabs" role="tablist">
        <li class="active">
          <a href="#desc" role="tab" data-toggle="tab">Description</a>
        </li>
        <li>
          <a href="#reviews" role="tab" data-toggle="tab"
            >Reviews (${product.reviewcount})</a
          >
        </li>
      </ul>
      <div class="tab-content padding-20 border-top-none">
        <div class="tab-pane active" id="desc">
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Saepe
            voluptas, debitis deleniti eaque inventore corporis nulla facilis
            facere quaerat accusamus in veniam praesentium recusandae, rerum,
            similique consequuntur voluptatibus tempora? Dignissimos delectus
            cum quibusdam facilis incidunt voluptatum vitae necessitatibus nemo
            deserunt fugit temporibus consequatur minima dolorem ullam cumque at
            vel quasi assumenda, numquam libero! Qui reprehenderit adipisci et,
            assumenda dolorum nihil accusantium deserunt aliquid impedit,
            tenetur quas corporis quod in commodi maxime dignissimos pariatur
            facere dolor dolore veniam ipsum fugiat modi recusandae odit.
            Provident dignissimos minima atque sequi odit sed sint iusto nihil,
            neque illum est tempore sit repellat. Sit, ipsam?
          </p>
        </div>
        <div class="tab-pane" id="reviews">
          <c:forEach var="review" items="${reviews}">
            <div class="border-bottom margin-bottom-10 padding-bottom-10" style="display: flex; justify-content: space-between;">
              <div class="review-content" style="flex: 1">
              <strong>${review.username}</strong>
              <span class="text-muted">- ${review.reviewDate}</span>
              <div class="product-rating margin-bottom-10">
                <c:forEach var="i" begin="1" end="${review.rating}">
                  <span class="fa fa-star" style="color: gold"></span>
                </c:forEach>
                <c:forEach var="i" begin="${review.rating + 1}" end="5">
                  <span class="fa fa-star-o" style="color: #dcdce6"></span>
                </c:forEach> 
              </div>    
              <p>${review.comment}</p>
              </div>
              <div class="review-action" style="flex: 0 0 auto">
                <c:if test="${sessionScope.account.username == review.username}">
                  <form
                    action="${pageContext.request.contextPath}/products?productid=${product.id}"
                    method="post"
                    class="margin-top-10"
                    onsubmit="return confirm('Are you sure you want to delete this review?')"
                  >
                    <input type="hidden" name="action" value="deleteReview" />
                    <input type="hidden" name="reviewId" value="${review.id}" />
                    <button type="submit" class="btn btn-danger btn-xs">
                      <i class="fa fa-trash-o" aria-hidden="true"></i>
                    </button>
                  </form>
                </c:if>
              </div>
            </div>
          </c:forEach>
          <c:choose>
          <c:when test="${not empty sessionScope.account}">
            <hr style="color: black;">
            <h4>Write a Review</h4>
            <form
              action="${pageContext.request.contextPath}/products?productid=${product.id}"
              method="post"
              class="margin-top-20"
            >
              <input type="hidden" name="action" value="addReview" />
              <input type="hidden" name="reviewId" id="reviewId" value="${review.id}" />
              <input type="hidden" name="userId" value="${sessionScope.account.id}" />
              <input type="hidden" name="productId" value="${product.id}" />
              <div class="form-group">
                <textarea 
                  name="comment"
                  id="reviewComment"
                  class="form-control"
                  rows="3"
                  required
                  placeholder="Write your review here..."
                  style="resize: none; border: 1px solid #ccc; padding: 10px"
                ></textarea>
              </div> 
              <select class="star-rating" name="rating" id="reviewRating">
                  <option value="">Give us a rating!</option>
                  <option value="5">Excellent</option>
                  <option value="4">Very Good</option>
                  <option value="3">Average</option>
                  <option value="2">Poor</option>
                  <option value="1">Terrible</option>
              </select>
              <button type="submit" class="btn btn-primary margin-top-10">
                Submit Review
              </button>
            </form>
          </c:when>
          <c:otherwise>
            <hr style="color: black;">
            <p>If you would like to leave a review, please <a href="${pageContext.request.contextPath}/login">login.</a></p>
          </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  const contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${URL}assets/global/scripts/addToCart.js" type="text/javascript"></script>
<script src="${URL}assets/global/scripts/updateCartPreview.js" type="text/javascript"></script>
<script src="${URL}assets/global/scripts/star-rating.js"></script>
<script>
    var stars = new StarRating('.star-rating');
</script>