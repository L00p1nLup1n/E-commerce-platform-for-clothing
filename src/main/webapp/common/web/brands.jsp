<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url value="/" var="URL"></c:url>
<!-- BEGIN BRANDS -->
<div class="brands">
	<div class="container">
		<div class="brands-gallery">
			<a href="shop-product-list.html"><img
				src="${URL}/assets/frontend/pages/img/brands/yss.png" alt="YSS"
				title="YSS"></a> <a href="shop-product-list.html"><img
				src="${URL}/assets/frontend/pages/img/brands/dna.png" alt="DNA"
				title="DNA"></a> <a href="shop-product-list.html"><img
				src="${URL}/assets/frontend/pages/img/brands/honda.png" alt="Honda"
				title="Honda"></a> <a href="shop-product-list.html"><img
				src="${URL}/assets/frontend/pages/img/brands/rcb.png" alt="RCB"
				title="RCB"></a> <a href="shop-product-list.html"><img
				src="${URL}/assets/frontend/pages/img/brands/liquimoly.png" alt="Liqui Moly"
				title="Liqui Moly"></a> <a href="shop-product-list.html"><img
				src="${URL}/assets/frontend/pages/img/brands/brembo.png" alt="Brembo"
				title="Brembo"></a>
		</div>
	</div>
</div>
<!-- END BRANDS -->

<style>
/* Style for the container */
.brands {
	padding: 20px 0;
	background-color: #f9f9f9;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
}

/* Flexbox layout for images */
.brands-gallery {
	display: flex;
	justify-content: space-between; /* Even spacing between images */
	align-items: center;
	flex-wrap: wrap;
	/* Allows images to wrap to the next row on small screens */
	gap: 20px; /* Adds consistent spacing between items */
}

/* Style for images */
.brands-gallery a img {
	max-width: 100px; /* Adjust the size of the images */
	height: auto; /* Maintain aspect ratio */
	transition: transform 0.3s ease; /* Smooth hover effect */
}

.brands-gallery a img:hover {
	transform: scale(1.1); /* Slight zoom effect on hover */
}
</style>
