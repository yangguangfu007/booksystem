<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="AmazeUI/js/amazeui.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="js/swiper-3.4.2.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/swiper-3.4.2.min.css" />
		<link rel="stylesheet" type="text/css" href="AmazeUI/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="AmazeUI/css/app.css" />
		<link rel="stylesheet" type="text/css" href="css/top.css" />
		<link rel="stylesheet" href="css/Life.css" />
		<link rel="stylesheet" type="text/css" href="css/foot.css" />
		<title>Life</title>
	</head>

	<body>
		<div class="cuntent am-center">
			<div class="list-top am-padding-sm am-text-center border-c">
				<em class="list-top-logo"></em>
				<span class="am-margin-left-sm am-text-lg">Life</span>
			</div>
			<!--拨动轮播-->
			<div class="lunbo am-margin-top-sm">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<a href="">
								<img src="img/l-1.jpg" />
							</a>
						</div>
						<div class="swiper-slide">
							<a href="">
								<img src="img/l-2.jpg" />
							</a>
						</div>
						<div class="swiper-slide">
							<a href="">
								<img src="img/l-3.jpg" />
							</a>
						</div>
						<div class="swiper-slide">
							<a href="">
								<img src="img/l-3.jpg" />
							</a>
						</div>
						<div class="swiper-slide">
							<a href="">
								<img src="img/l-2.jpg" />
							</a>
						</div>
						<div class="swiper-slide">
							<a href="">
								<img src="img/l-3.jpg" />
							</a>
						</div>
						<div class="swiper-slide">
							<a href="">
								<img src="img/l-2.jpg" />
							</a>
						</div>
						<div class="swiper-slide">
							<a href="">
								<img src="img/l-2.jpg" />
							</a>
						</div>
						<div class="swiper-slide">
							<a href="">
								<img src="img/l-3.jpg" />
							</a>
						</div>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>
				<p class="bag-c am-margin-top-sm"></p>
			</div>
			<!--拨动轮播的js-->
			<script>
				var swiper = new Swiper('.swiper-container', {
					pagination: '.swiper-pagination',
					slidesPerView: 3,
					paginationClickable: true,
					spaceBetween: 30
				});
			</script>
			<!--Life分类-->
			<div class="am-padding-vertical-sm am-text-center">
				<a href="Life-deta.html">
					<h3 class="am-text-lg am-padding-top-sm">Life推荐</h3>
					<span class="am-text-sm"><em class="color-c am-padding-right-sm">————</em>1 <em class="am-padding-left-sm color-c">————</em></span>
					<div class="width_full am-padding-vertical-sm">
						<img src="img/l_4.jpg" />
					</div>
					<h2 class="color-6 am-text-lg">张嘉佳：电台是我的一个小世界</h2>
					<p class="width_50 am-tetx-sm am-center am-padding-sm am-text-left">“生活中的经历随时间的流逝， 你不想经历都不行，除非把你关在精神病院”</p>
				</a>
			</div>
			<div class="am-padding-vertical-sm am-text-center">
				<a href="#">
					<span class="am-text-sm"><em class="color-c am-padding-right-sm">————</em>2 <em class="am-padding-left-sm color-c">————</em></span>
					<div class="width_full am-padding-vertical-sm">
						<img src="img/l-5.jpg" />
					</div>
					<h2 class="color-6 am-text-lg">食之有味002：夜幕下也不散场</h2>
					<p class="width_50 am-tetx-sm am-center am-padding-sm am-text-left">“毕业几年，提起夏天，提起晚上八九点，最馋的不过几位好友谈笑风生中的夜市小吃摊”</p>
				</a>
			</div>
			<div class="bgcolor-c am-text-center am-padding">
				<a href=""><i class="am-icon-spinner am-icon-spin"></i>点击更多</a>
			</div>
			<!--底部-->
			<ul class="footer am-cf  am-text-center">
				<li class="footer1 footerlist color-r">
				   <a href="index">
					<span class="am-icon-home am-icon-md"></span>
					<em>首页</em>
					</a>
				</li>
				<li class="footer2 footerlist">
					<a href="#">
						<span class="am-icon-yelp am-icon-md"></span>
						<em>Life</em>
					</a>
				</li>
				<li class="footer3 footerlist">
					<a href="classify.jsp">
						<span class="am-icon-lemon-o am-icon-md"></span>
						<em>分类</em>
					</a>
				</li>
				<s:if test="#session.user!=null">
				<li class="footer4 footerlist">
					<!-- <a href="shopingcar.html"> -->
					<a href="showCart">
						<span class="am-icon-shopping-cart am-icon-md"></span>
						<em>购物车</em>
					</a>
				</li>
				</s:if>
				<li class="footer5 footerlist">
				<!--用户没有登录  -->
				<s:if test="#session.user==null">
					<a href="register.html">
						<span class="am-icon-user am-icon-md"></span>
						<em>个人</em>
					</a>
				</s:if>
				<!--用户已经登录  -->
				<s:else>
				    <a href="personalcenter.jsp">
						<span class="am-icon-user am-icon-md"></span>
						<em>个人</em>
					</a>
				</s:else>
				</li>
			</ul>
		</div>
	</body>

</html>