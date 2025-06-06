<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url value="/" var="URL"></c:url>

<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
<meta charset="utf-8">
<title>Group 1 Shop</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta content="Metronic Shop UI description" name="description">
<meta content="Metronic Shop UI keywords" name="keywords">
<meta content="keenthemes" name="author">

<meta property="og:site_name" content="-CUSTOMER VALUE-">
<meta property="og:title" content="-CUSTOMER VALUE-">
<meta property="og:description" content="-CUSTOMER VALUE-">
<meta property="og:type" content="website">
<meta property="og:image" content="-CUSTOMER VALUE-">
<!-- link to image for socio -->
<meta property="og:url" content="-CUSTOMER VALUE-">

<link rel="shortcut icon" href="favicon.ico">

<!-- Fonts START -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all"
	rel="stylesheet" type="text/css">
<!--- fonts for slider on the index page -->
<!-- Fonts END -->

<!-- Global styles START -->
<link
	href="${URL}assets/global/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="${URL}assets/global/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Global styles END -->

<!-- Page level plugin styles START -->
<link
	href="${URL}assets/global/plugins/fancybox/source/jquery.fancybox.css"
	rel="stylesheet">
<link
	href="${URL}assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.css"
	rel="stylesheet">
<link
	href="${URL}assets/global/plugins/slider-layer-slider/css/layerslider.css"
	rel="stylesheet">
<link href="${URL}assets/global/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin styles END -->

<!-- Theme styles START -->
<link href="${URL}assets/global/css/components.css" rel="stylesheet">
<link href="${URL}assets/global/css/star-rating.css" rel="stylesheet">

<link href="${URL}assets/frontend/layout/css/style.css" rel="stylesheet">
<link href="${URL}assets/frontend/pages/css/style-shop.css"
	rel="stylesheet" type="text/css">
<link href="${URL}assets/frontend/pages/css/style-layer-slider.css"
	rel="stylesheet">
<link href="${URL}assets/frontend/layout/css/style-responsive.css"
	rel="stylesheet">
<link href="${URL}assets/frontend/layout/css/themes/red.css"
	rel="stylesheet" id="style-color">
<link href="${URL}assets/frontend/layout/css/custom.css"
	rel="stylesheet">
<!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">
	<!-- header -->
	<div id="notification"></div>	
	<c:choose>
		<c:when test="${sessionScope.account.id == 2}">
			<%@ include file="/common/admin/header.jsp" %>
			<!-- Admin-specific controls -->
		</c:when>
		<c:otherwise>
			<%@ include file="/common/user/header.jsp" %>
			<!-- Normal user view -->
		</c:otherwise>
	</c:choose>
	<div class="main">
		<div class="container">
			<!-- content -->
			<sitemesh:write property="body" />
			<!-- content -->
		</div>
	</div>

	<br />
	<!-- footer -->
	<%@ include file="/common/web/footer.jsp"%>

	<script src="${URL}assets/global/plugins/jquery.min.js"
		type="text/javascript"></script>
	<script src="${URL}assets/global/plugins/jquery-migrate.min.js"
		type="text/javascript"></script>
	<script src="${URL}assets/global/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="${URL}assets/frontend/layout/scripts/back-to-top.js"
		type="text/javascript"></script>
	<script
		src="${URL}assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
	<script
		src="${URL}assets/global/plugins/fancybox/source/jquery.fancybox.pack.js"
		type="text/javascript"></script>
	<!-- pop up -->
	<script
		src="${URL}assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js"
		type="text/javascript"></script>
	<!-- slider for products -->
	<script
		src="${URL}assets/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js"
		type="text/javascript"></script>
	<script src="${URL}assets/global/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>
	<!-- Quantity -->

	<!-- BEGIN LayerSlider -->
	<script
		src="${URL}assets/global/plugins/slider-layer-slider/js/greensock.js"
		type="text/javascript"></script>
	<!-- External libraries: GreenSock -->
	<script
		src="${URL}assets/global/plugins/slider-layer-slider/js/layerslider.transitions.js"
		type="text/javascript"></script>
	<!-- LayerSlider script files -->
	<script
		src="${URL}assets/global/plugins/slider-layer-slider/js/layerslider.kreaturamedia.jquery.js"
		type="text/javascript"></script>
	<!-- LayerSlider script files -->
	<script src="${URL}assets/frontend/pages/scripts/layerslider-init.js"
		type="text/javascript"></script>
	<!-- END LayerSlider -->

	<script src="${URL}assets/frontend/layout/scripts/layout.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			Layout.init();
			Layout.initOWL();
			LayersliderInit.initLayerSlider();
			Layout.initTouchspin();
			Layout.initUniform();
			Layout.initTwitter();
			Layout.initFixHeaderWithPreHeader();
			Layout.initNavScrolling();
		});
	</script>
	<script
      src="${URL}assets/global/scripts/removeProduct.js"
      type="text/javascript"
    ></script>
    <script
      src="${URL}assets/global/scripts/checkoutValidate.js"
      type="text/javascript"
    ></script>
	<script
	  src="${URL}assets/global/scripts/notification.js"
	  type="text/javascript"
	></script>
	<script
      src="${URL}assets/global/scripts/bfCacheReload.js"
      type="text/javascript"
	></script>
	<script
      src="${URL}assets/global/scripts/updateCartPreview.js"
      type="text/javascript"
    ></script>
	<script
	  src="${URL}assets/global/scripts/loginNotification.js"
	  type="text/javascript"
	></script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>