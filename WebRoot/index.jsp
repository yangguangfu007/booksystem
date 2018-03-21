<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="AmazeUI/js/amazeui.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/swiper-3.4.2.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="css/swiper-3.4.2.min.css" />
		<link rel="stylesheet" type="text/css" href="AmazeUI/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="AmazeUI/css/app.css" />
		<link rel="stylesheet" type="text/css" href="css/top.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<link rel="stylesheet" type="text/css" href="css/foot.css" />
		<title>鲜书网首页推荐</title>
	</head>

	<body>
		<div class="cuntent am-center">
			<div class="top width_full am-cf am-padding-top-sm">
				<div class="logo am-text-middle am-fl">
					<a href="landing1.html">
						<em><img style="width: 25px; height: 25px;" src="img/logo.png"/></em>
						<span class="fontsize-15 am-text-middle">鲜书</span>
					</a>
				</div>
				<div class="selected am-text-center am-fl">
					<a class="" href="select.html">
						<em></em>
						<input type="text" name="" id="" value="" placeholder="搜索好书" />
					</a>
				</div>
			</div>
			<!--以上是头部-->
			<!--推荐的主体-->
			<!--导航栏-->
			<ul class="list am-cf am-center">
				<li class="list1 am-fl">
					<a href="#" class="color-r">推荐</a>
				</li>
				<li class="list2 am-fl">
					<a href="literatureart.html">文艺</a>
				</li>
				<li class="list3 am-fl">
					<a href="booklist.html">书单</a>
				</li>
				<li class="list4 am-fl">
					<a href="eatfood.html">谈吃</a>
				</li>
			</ul>
			<!--轮播图-->
			<div class="banner1">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<a href="detailpage2.html"><img src="img/banner1.jpg" /></a>
						</div>
						<div class="swiper-slide">
							<a href="detailpage2.html"><img src="img/shouyebanner.jpg"/></a>
						</div>
						<div class="swiper-slide">
							<a href="detailpage2.html"><img src="img/shouyebanner-3.jpg"/></a>
						</div>
						<div class="swiper-slide">
							<a href="detailpage2.html"><img src="img/shouyebanner-4.jpg"/></a>
						</div>
						<div class="swiper-slide">
							<a href="detailpage2.html"><img src="img/shouyebanner-5.jpg"/></a>
						</div>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>
				<!--轮播图的js-->
				<script>
					var swiper = new Swiper('.swiper-container', {
						pagination: '.swiper-pagination',
						paginationClickable: true,
						spaceBetween: 30,
					});
				</script>
				<!--轮播图结束-->
				<div class="am-g banner1-txt">
					<h2 class="ad-title am-u-sm-3 color-b">鲜书Lief</h3>
					<span class="ad-text am-u-sm-9">最美阅读：不可错过的文艺书单</span>
				</div>
			</div>
			<!--新书发布-->
			<div class="new-book">
				<h1 class=" am-text-center new-book-titil"><a class="color-b" href="newbook.html">新书 · 首发    ></a></h1>
				<ul class="am-avg-sm-2 am-thumbnails new-book-list am-text-center">
			    <s:iterator value="list" var="b">
				  <li>
					<!-- <a href="detailpage2.html"> -->
					<s:if test="#b.type==0">
					<a href="showBookDetail?book.bid=${b.bid }">
						<div class="img-h am-thumbnail">
				  			<img class="" src="${b.url}" />
						</div>
						<p>${b.bname}</p>
						<span class="color-r">¥${b.bprice}</span>
						<del>￥${b.price}</del>
					</a>
					</s:if>
				  </li>
		       </s:iterator>
			   </ul>
			 </div>
			<!--人气推荐-->
			<div class="tuijian">
				<h1 class=" am-text-center new-book-titil border-c"><a class="color-b" href="renqituijian.html">人气推荐&nbsp; &nbsp;   ></a></h1>
			<s:iterator value="list" var="b">
				<s:if test="#b.isRecommend==1">
				<div class="am-g magin-top ad-title border-d">
				 <a href="showBookDetail?book.bid=${b.bid }">
				   <div class="am-u-sm-4">
				  	<img src="${b.url }"/>
				   </div>
				  <div class="am-u-sm-8">
				  	<h4 class="color-b">${b.bname}</h4>
				  	<p>${b.bbrief }</p>
				  	<span class="color-r">¥${b.bprice}</span>
				  	<del>￥${b.price}</del>
				  </div>
				 </a>
				</div>
				</s:if>
				</s:iterator>
		    </div>
			<!--文学艺术-->
			<div class="new-book">
				<h1 class=" am-text-center new-book-titil border-c"><a class="color-b" href="#">文学 · 艺术</a></h1>
				<ul class="am-avg-sm-2 am-thumbnails new-book-list am-text-center border-d">
				<s:iterator value="list" var="b">
				<s:if test="#b.type==1">
				  <li>
				  	 <a href="showBookDetail?book.bid=${b.bid }">
				  		<div class="img-h am-thumbnail">
				  		<img class="" src="${b.url }" />
					</div>
					<p>${b.bname }</p>
					<span class="color-r">¥${b.bprice}</span>
					<del>￥${b.bprice}</del>
				  	</a>
				  </li>
				</s:if>
			    </s:iterator>
				</ul>
			</div>
				
			<!--底部-->
			<div>
			<ul class="footer am-cf  am-text-center">
				<li class="footer1 footerlist color-r">
					<span class="am-icon-home am-icon-md"></span>
					<em>首页</em>
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

<%-- <body>
	<s:if test="#session.user==null">
    	${msg }
    	<s:form action="UserAction_login" method="post">
				<s:textfield label="%{getText('username')}" name="user.username"></s:textfield>
				<s:password label="%{getText('userpass')}" name="user.userpass"></s:password>
				<s:submit value="%{getText('login')}"></s:submit>
		</s:form>
		<div>没有账户？<a href="register.jsp">立即注册</a></div>
		</s:if> 
		<!--如果是管理员  -->
		<s:elseif test="#session.user.userlimit==1">
			<h3>欢迎您！${user.username }</h3>
			<a href="addBook.jsp">增加图书</a>
			<a href="OrderAction_findOrder1">查看所有订单</a>
			<a href="UserAction_exitLogin">退出登录</a>
		</s:elseif>
		 <s:else>
			<h3>欢迎您！${user.username }</h3>
			<a href="showCart">我的购物车</a>
			<a href="OrderAction_findOrder">查看我的订单</a>
			<a href="UserAction_exitLogin">退出登录</a>
		</s:else>
		<table>
			<s:iterator value="list" var="b">
				<tr>
					<td><img alt="${b.bname }" src="${b.url}"></td>
					<td><a href="showBookDetail?book.bid=${b.bid }">${b.bname}</a></td>
				</tr>
			</s:iterator>
		</table> 
		<a href="index?currPage=1">首页</a>&nbsp; 
		<a href="index?currPage=${currPage-1 }">上一页</a>&nbsp; 
		<a>当前页：${currPage }</a>&nbsp;
		<a href="index?currPage=${currPage+1 }">下一页</a>&nbsp; 
		<a href="index?currPage=${maxPage }">末页</a><br>
</body>
 --%>