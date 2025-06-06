<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url value="/" var="URL"></c:url>
<!-- BEGIN PRE-FOOTER -->
<div class="pre-footer">
	<div class="container">
		<div class="row">
			<!-- BEGIN BOTTOM ABOUT BLOCK -->
			<div class="col-md-3 col-sm-6 pre-footer-col">
				<h2>About us</h2>
				<p>Group 1 is a dynamic e-commerce clothing platform dedicated to delivering stylish, high-quality apparel. 
				   Founded on a passion for design and community, we curate versatile collections that blend timeless elegance 
				   with contemporary trends. </p>
				<p>Our commitment to sustainability drives us to source eco-friendly materials and partner with ethical manufacturers. 
				   At Group 1, customer satisfaction is paramount: we offer intuitive browsing, fast shipping, and responsive support. 
				   Whether you’re looking for everyday essentials or statement pieces, our goal is to inspire confidence and individuality through fashion. 
				   Discover your next favorite outfit with Group 1 today.</p>
			</div>
			<!-- END BOTTOM ABOUT BLOCK -->
			<!-- BEGIN BOTTOM INFO BLOCK -->
			<div class="col-md-3 col-sm-6 pre-footer-col">
				<h2>Information</h2>
				<ul class="list-unstyled">
					<li><i class="fa fa-angle-right"></i> <a href="#">Delivery
							Information</a></li>
					<li><i class="fa fa-angle-right"></i> <a href="#">Customer
							Service</a></li>
					<li><i class="fa fa-angle-right"></i> <a href="#">Order
							Tracking</a></li>
					<li><i class="fa fa-angle-right"></i> <a href="#">Shipping
							&amp; Returns</a></li>
					<li><i class="fa fa-angle-right"></i> <a href="contacts.html">Contact
							Us</a></li>
					<li><i class="fa fa-angle-right"></i> <a href="#">Careers</a></li>
					<li><i class="fa fa-angle-right"></i> <a href="#">Payment
							Methods</a></li>
				</ul>
			</div>
			<!-- END INFO BLOCK -->

			<!-- BEGIN TWITTER BLOCK -->
			<div class="col-md-3 col-sm-6 pre-footer-col">
				<h2 class="margin-bottom-0">Latest Tweets</h2>
				<a class="twitter-timeline" href="https://twitter.com/twitterapi"
					data-tweet-limit="2" data-theme="dark" data-link-color="#57C8EB"
					data-widget-id="455411516829736961"
					data-chrome="noheader nofooter noscrollbar noborders transparent">Loading
					tweets by @keenthemes...</a>
			</div>
			<!-- END TWITTER BLOCK -->

			<!-- BEGIN BOTTOM CONTACTS -->
			<div class="col-md-3 col-sm-6 pre-footer-col">
				<h2>Our Contacts</h2>
				<address class="margin-bottom-40">
					35, Lorem Lis Street, Park Ave<br> California, US<br>
					Phone: 300 323 3456<br> Fax: 300 323 1456<br> Email: <a
						href="mailto:info@clothing.com">info@clothing.com</a><br>
					Skype: <a href="skype:clothing">clothing</a>
				</address>
			</div>
			<!-- END BOTTOM CONTACTS -->
		</div>
		<hr>
		<div class="row">
			<!-- BEGIN SOCIAL ICONS -->
			<div class="col-md-6 col-sm-6">
				<ul class="social-icons">
					<li><a class="rss" data-original-title="rss" href="#"></a></li>
					<li><a class="facebook" data-original-title="facebook"
						href="#"></a></li>
					<li><a class="twitter" data-original-title="twitter" href="#"></a></li>
					<li><a class="googleplus" data-original-title="googleplus"
						href="#"></a></li>
					<li><a class="linkedin" data-original-title="linkedin"
						href="#"></a></li>
					<li><a class="youtube" data-original-title="youtube" href="#"></a></li>
					<li><a class="vimeo" data-original-title="vimeo" href="#"></a></li>
					<li><a class="skype" data-original-title="skype" href="#"></a></li>
				</ul>
			</div>
			<!-- END SOCIAL ICONS -->
			<!-- BEGIN NEWLETTER -->
			<div class="col-md-6 col-sm-6">
				<div class="pre-footer-subscribe-box pull-right">
					<h2>Newsletter</h2>
					<form action="#">
						<div class="input-group">
							<input type="text" placeholder="youremail@mail.com"
								class="form-control"> <span class="input-group-btn">
								<button class="btn btn-primary" type="submit">Subscribe</button>
							</span>
						</div>
					</form>
				</div>
			</div>
			<!-- END NEWLETTER -->
		</div>
	</div>
</div>
<!-- END PRE-FOOTER -->

<!-- BEGIN FOOTER -->
<div class="footer">
	<div class="container">
		<div class="row">
			<!-- BEGIN COPYRIGHT -->
			<div class="col-md-6 col-sm-6 padding-top-10">2014 © Clothing platform UI. ALL Rights Reserved.</div>
			<!-- END COPYRIGHT -->
			<!-- BEGIN PAYMENTS -->
			<div class="col-md-6 col-sm-6">
				<ul class="list-unstyled list-inline pull-right">
					<li><img
						src="${URL}/assets/frontend/layout/img/payments/western-union.jpg"
						alt="We accept Western Union" title="We accept Western Union"></li>
					<li><img
						src="${URL}/assets/frontend/layout/img/payments/american-express.jpg"
						alt="We accept American Express"
						title="We accept American Express"></li>
					<li><img
						src="${URL}/assets/frontend/layout/img/payments/MasterCard.jpg"
						alt="We accept MasterCard" title="We accept MasterCard"></li>
					<li><img
						src="${URL}/assets/frontend/layout/img/payments/PayPal.jpg"
						alt="We accept PayPal" title="We accept PayPal"></li>
					<li><img
						src="${URL}/assets/frontend/layout/img/payments/visa.jpg"
						alt="We accept Visa" title="We accept Visa"></li>
				</ul>
			</div>
			<!-- END PAYMENTS -->
		</div>
	</div>
</div>
<!-- END FOOTER -->