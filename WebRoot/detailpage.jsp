<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<script src="js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
		<script src="AmazeUI/js/amazeui.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/swiper-3.4.2.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="AmazeUI/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="AmazeUI/css/app.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<link rel="stylesheet" type="text/css" href="css/swiper-3.4.2.min.css" />
		<title>详情页《${book.bname }》</title>
	</head>

	<body>
		<div class="cuntent">
			<div id="carousel-example-generic" class="carousel slide dingwei" data-ride="carousel">
				<div class="tututu">
					<div class="swiper-container top">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<a href="###"><img src="img/detailbanner_01.jpg"></a>
							</div>
							<div class="swiper-slide">
								<a href="###"><img src="img/detailbanner2.jpg"></a>
							</div>
							<div class="swiper-slide">
								<a href="###"><img src="img/detailbanner_01.jpg"></a>
							</div>
						</div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
				<!--轮播图的js-->
				<script>
					$(function() {
						var mySwiper = new Swiper('.swiper-container', {
							pagination: '.swiper-pagination', //当前位置的图片点
							speed: 1000,
							loop: true, //是够能够循环无缝滑动
							grabCursor: true,
							paginationClickable: true, //允许触摸
							autoplay: 2000 //一秒切换
						})
					});
				</script>
				<!--轮播图上的定位-->
				<div class="top-position am-cf am-padding">
					<div class="am-fl">
						<a href="index" class=""><em class="icon-img"></em></a>
					</div>
					<div class="am-fr">
						<span class="am-icon-heart-o am-icon-sm save"></span>
						<a href="" class="am-margin-left-sm"><span class="am-icon-share-square-o am-icon-sm save"></span></a>
					</div>
					<script type="text/javascript">
						$('.am-icon-heart-o').click(function() {
							if($(this).hasClass('color-r')) {
								$(this).removeClass('color-r')
							} else {
								$(this).addClass("color-r")

							}
						})
					</script>
				</div>
				<div class="details am-padding-sm bag-c">
					<!--加入收藏的样式-->
					<h2><em class="newicon am-margin-right-sm"></em>${book.bname }</h2>
					<p class="am-padding-xs am-text-lg"><span class="color-r">￥${book.bprice }</span><del class="am-margin-left-xs">￥${book.price }</del></p>
					<div class="am-cf am-padding-horizontal-sm border-c am-padding-bottom-xs">
						<span class="am-fl">销量:&nbsp;&nbsp;1781</span>
						<span class="border-all-c am-padding-xs am-fr">加入收藏</span>
						<script type="text/javascript">
							$('.border-all-c').click(function() {
								if($('.am-icon-heart-o').hasClass('color-r')) {
									$(this).html('加入收藏')
									$('.am-icon-heart-o').removeClass('color-r')
								} else {
									$(this).html('已收藏')
									$('.am-icon-heart-o').addClass("color-r")

								}
							})
						</script>
					</div>
					<ul class="am-cf am-text-xs">
						<li class="am-fl am-text-left am-margin-right-xs">•&nbsp;15天无忧退货</li>
						<li class="am-fl am-text-left  am-margin-right-xs">•&nbsp;48小时快速退款</li>
						<li class="am-fl am-text-left am-margin-right-xs">•&nbsp;满49元免邮费</li>
					</ul>

				</div>
				<div class="am-cf am-padding-sm bag-w">
					<a href="#">
						<p class="am-fl overflow">1个促销：全场满150减100 不含杂志期刊</p>
						<span class="am-icon-angle-right am-text-xs am-fr"></span>
					</a>
				</div>
				<p class="bag-c am-padding-bottom-xs"></p>
				<div class="am-cf am-padding-sm bag-w  guigeclick">
					<p class="am-fl overflow" id="yixuantaocan">已选套餐：套餐一： 赠送手绘明信片</p>
					<span class="am-icon-angle-right am-text-xs am-fr"></span>
				</div>
				<!--图书规格-->
				<div class="guige am-padding-sm bag-w">
					<div class="am-g">
						<div class="am-u-sm-3">
							<img src="img/g-1.jpg" />
						</div>
						<div class="am-u-sm-7">
							<h3>月童度河</h3>
							<span class="color-r">￥38.30</span>
							<p id="guige-text" class="color-c guige-text">已选套餐：套餐一</p>
						</div>
						<div class="am-u-sm-2">
							<span id="close" class="am-icon-close am-text-em"></span>
						</div>
					</div>
					<h3 class="am-padding-left-sm am-margin-top-sm">规格</h3>
					<div class="am-cf am-margin-top-sm guige-list">
						<p class="am-fl am-padding-sm border-all-c am-margin-right-sm border-color-r">套餐一：赠送手绘明信片</p>
						<p class="am-fl am-padding-sm border-all-c  am-margin-right-sm">套餐二：无赠品</p>
					</div>
					<h3 class="am-padding-left-sm am-margin-top-sm">规格</h3>
					<div class="am-cf am-margin-top-sm border-all-c border-ru width_35 am-margin-bottom-sm">
						<input id="min" class="am-fl am-padding-sm bag-n width_33 border-r" type="button" id="delete" value="-" />
						<input id="num" class="am-fl am-padding-sm bag-n width_33 " name="number" type="text" name="" id="" value="1" />
						<input id="add" class="am-fl am-padding-sm bag-n width_33 border-l" type="button" name="" id="increase" value="+" />
					</div>
					<!--加减的js-->
					<script type="text/javascript">
						$(function() {
							var _num = $('#num');
							$('#min').click(function() {
								if(_num.val()>0){
									_num.val(parseInt(_num.val()) - 1);
								}else{
								}
								setTotal();
							})
							$('#add').click(function() {
								_num.val(parseInt(_num.val())+ 1);
								setTotal();
							})
							setTotal();
						})
					</script>
					<!--图书规格显示隐藏的js-->
					<script type="text/javascript">
						$(function(){
							$('.guigeclick').click(function(){
								$('.guige').css({'display':'block'});
							})
							$('#close').click(function(){
								$('.guige').css({'display':'none'});
							})
							//选择规格的js
							$('.guige-list p').click(function(){
								var thtml=$(this).html()
								if($(this).hasClass('border-color-r')){
									
									$(this).removeClass('border-color-r')
								}else{
									$(this).addClass('border-color-r').siblings().removeClass('border-color-r')
									//将规格改成已选择的内容
									$('#guige-text').html(thtml)
									$('#yixuantaocan').html(thtml)
								}
							})
						})
					</script>
				</div>
				<!--评价-->
				<p class="bag-c am-padding-bottom-xs"></p>
				<div class="am-cf am-padding-sm bag-w">
					<a href="evluate.html">
						<p class="am-fl overflow">评价（676）</p>
						<span class="am-icon-angle-right am-text-xs am-fr"></span>
					</a>
				</div>
				<p class="bag-c am-padding-bottom-xs"></p>
				<div class="am-cf am-padding-sm bag-w">
					<a href="detailpage-tuwenxiangqing.html">
						<p class="am-fl overflow">图文详情</p>
						<span class="am-icon-angle-right am-text-xs am-fr"></span>
					</a>
				</div>
				<p class="bag-c am-padding-bottom-xs"></p>
			</div>
			<!--购买详情页底部-->
			<div class="bottom am-cf">
				<div class="am-padding-sm am-fl border-rigth-c width_15 am-text-center">
					<a href="#">
						<span class="am-icon-comments-o am-icon-sm"></span>
					</a>

				</div>
				<div class="am-padding-sm am-fl width_15 am-text-center">
					<a href="#">
						<span class="am-icon-shopping-cart am-icon-sm"></span>
					</a>
				</div>
				<div class="am-padding-sm am-fl width_35 am-text-center bg-j">
					<a href="addToCart?book.bid=${book.bid }" class="color-w">加入购物车</a>
				</div>
				<div class="am-padding-sm gouwuche am-fl  width_35 am-text-center bg-r">
					<a href="#" class="color-w">立即购买</a>
				</div>
			</div>
           
		</div>
	</body>

</html>