<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="AmazeUI/js/amazeui.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="js/swiper-3.4.2.min.js"></script>
		<script src="js/shopingcar.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="css/select.css" />
		<link rel="stylesheet" type="text/css" href="css/swiper-3.4.2.min.css" />
		<link rel="stylesheet" type="text/css" href="AmazeUI/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="AmazeUI/css/app.css" />
		<link rel="stylesheet" type="text/css" href="css/top.css" />
		<link rel="stylesheet" type="text/css" href="css/personalcenter.css" />
		<link rel="stylesheet" type="text/css" href="css/foot.css" />
		<title>个人中心</title>
	</head>

	<body>
		<div class="cuntent">
			<div class="personal-top">
				<div class="bg-img">
					<img src="img/personnel-1_01.jpg" />
				</div>
				<a href="personalcenter-myorder.html">
					<div class="headimg am-cf am-padding">
						<div class="headimg-img am-fl width_20 am-margin-right">
							<img src="img/headimg.jpg" class="am-round" />
						</div>
						<h3 class="am-fl color-b am-margin-top">我们去抓企鹅吧</h3>
					</div>
				</a>
			</div>
		<s:if test="#session.user!=null">
			<!--如果是管理员  -->
			<s:if test="#session.user.userlimit==1">
				<h3>欢迎您！${user.username }</h3>
				<a href="addBook.jsp">增加图书</a>
				<a href="OrderAction_findOrder1">查看所有订单</a>
				<a href="UserAction_exitLogin">退出登录</a>
			</s:if>
			 <s:elseif test="#session.user.userlimit==0">
			<%-- <h3>欢迎您！${user.username }</h3>
			<a href="UserAction_exitLogin">退出登录</a> --%>
			<div class="personal-box bag-b">
				<!-- <a href="personalcenter-myorder.html"> -->
				<a href="OrderAction_findOrder">
					<div class="bag-w am-cf am-padding fontsize-16 border-bottom-d">
						<span class="am-fl">我的订单</span>
						<span class="am-icon-angle-right am-fr"></span>
					</div>
				</a>
				<div class="am-g bag-w am-padding">
					<div class="am-u-sm-3 border-right-c am-text-center">
						<a href="personalcenter-myorder.html">
							<em class="display display1 am-center"></em>
							<span>待付款</span>
						</a>
					</div>
					<div class="am-u-sm-3 border-right-c am-text-center">
						<a href="#">
							<em class="display display2 am-center"></em>
							<span>待发货</span>
						</a>
					</div>
					<div class="am-u-sm-3 border-right-c am-text-center">
						<a href="personalcenter-myorder.html">
							<em class="display display3 am-center"></em>
							<span>待收货</span>
						</a>
					</div>
					<div class="am-u-sm-3 am-text-center">
						<a href="personalcenter-myorder.html">
							<em class="display display4 am-center"></em>
							<span>待收货</span>
						</a>
					</div>

				</div>
				<!--优惠券等等-->
				<div class="am-margin-top-sm bag-w">
					<div class="am-cf am-padding  fontsize-16 border-bottom-d">
						<a href="personalcenter-youhuiquan.html">
							<em class="display youhuiquan am-fl"></em>
							<span class="am-fl am-margin-left-sm">优惠券</span>
							<i class="am-icon-angle-right am-fr"></i>
						</a>
					</div>
					<div class="am-cf am-padding  fontsize-16 border-bottom-d">
						<a href="personalcenter-save.html">
							<i class="am-icon-heart-o am-fl"></i>
							<span class="am-fl am-margin-left-sm">我的收藏</span>
							<i class="am-icon-angle-right am-fr"></i>
						</a>
					</div>
					<div class="am-cf am-padding  fontsize-16 border-bottom-d">
						<a href="personalcenter-add.html">
							<i class="am-icon-map-marker am-fl"></i>
							<span class="am-fl am-margin-left-sm">地址管理</span>
							<i class="am-icon-angle-right am-fr"></i>
						</a>
					</div>
				</div>
				<!--档案管理-->
				<div class="am-margin-top-sm bag-w">
					<div class="am-cf am-padding  fontsize-16 border-bottom-d">
						<em class="display kefu am-fl"></em>
						<span class="am-fl am-margin-left-sm">在线客服</span>
						<i class="am-icon-angle-right am-fr"></i>
					</div>
					<div class="am-cf am-padding  fontsize-16 border-bottom-d">
						<i class="display bangzhu am-fl"></i>
						<span class="am-fl am-margin-left-sm">帮助中心</span>
						<i class="am-icon-angle-right am-fr"></i>
					</div>
					<div class="am-cf am-padding  fontsize-16 border-bottom-d">
						<i class="am-icon-gear am-fl"></i>
						<span class="am-fl am-margin-left-sm">系统设置</span>
						<i class="am-icon-angle-right am-fr"></i>
					</div>
					<div class="am-cf am-padding  fontsize-16 border-bottom-d">
						<a href="UserAction_exitLogin">
						<i class="am-icon-gear am-fl"></i>
						<span class="am-fl am-margin-left-sm">退出</span>
						<i class="am-icon-angle-right am-fr"></i>
						</a>
					</div>
				</div>
			</div>
		   </s:elseif>
		</s:if>
		<s:else>
		   <h3>请先登录</h3>
		</s:else>
			<!--底部-->
			<ul class="footer am-cf  am-text-center">
				<li class="footer1 footerlist">
					<a href="index">
						<span class="am-icon-home am-icon-md"></span>
						<em>首页</em>
					</a>
				</li>
				<li class="footer2 footerlist">
					<a href="Life.jsp">
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
				<li class="footer4 footerlist">
					<a href="showCart">
						<span class="am-icon-shopping-cart am-icon-md"></span>
						<em>购物车</em>
					</a>
				</li>
				<li class="footer5 footerlist">
					<a href="#" class="color-r">
						<span class="am-icon-user am-icon-md"></span>
						<em>个人</em>
					</a>
				</li>
			</ul>
		</div>
	</body>

</html>