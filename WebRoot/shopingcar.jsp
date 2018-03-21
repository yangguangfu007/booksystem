<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

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
		<link rel="stylesheet" type="text/css" href="css/shopingcar.css" />
		<link rel="stylesheet" type="text/css" href="css/foot.css" />
		<title>购物车</title>
	</head>

	<body>
		<div class="cuntent">
			<div class="am-padding am-g border-bottom-d am-text-middle">
				<a href="#" onclick="javascript :history.back(-1);" class="am-u-sm-3 color-6 am-text-default am-padding-em"><span>返回</span></a>
				<span class="am-u-sm-6 color-b am-text-lg am-text-center">购物车</span>
				<a href="" class="am-u-sm-3  am-text-default color-6"><span>完成</span></a>
			</div>
			<ul class="am-padding bag-c border-bottom-d am-text-em am-cf">
				<li class="am-fl width_33 am-text-center">•15天无忧退货</li>
				<li class="am-fl width_33 am-text-center">•48小时快速退款</li>
				<li class="am-fl width_33 am-text-center">•满49元免邮费</li>
			</ul>
			<!--购物车盒子-->
			<div class="shangpin_list goods">
				<div class="shangpin_box bg_color am-g btn_cost border-bottom-d am-padding-vertical-sm">
					<div class="shangpin_left am-u-sm-2">
						<input type="checkbox" class="check command buton" />
					</div>
					<div class="shangpin_center am-u-sm-4">
						<div class="left_img am-center">
							<img src="img/gouwuche-1.jpg" />
						</div>
					</div>
					<div class="shangpin_right am-u-sm-6">
						<h4 class="fontsize-16 color-b">阿勒泰的角落（四色典藏版）</h4>
						<span class="fontsize-14">已选：赠品四季手绘书签典藏套装</span>
						<div class="price_shuliang am-cf">
							<span class="color-r am-fl">￥</span>
							<span class="color-r price cost am-fl">148.00</span>
							<div class="shuliang am-fr">
								<button type="button" class="radius subtract">-</button>
								<input type="text" value="1" class="num in_put" />
								<button type="button" class="radius plus">+</button>
							</div>
						</div>
					</div>
				</div>
				<!--二-->
				<div class="shangpin_box bg_color am-g btn_cost border-bottom-d am-padding-vertical-sm">
					<div class="shangpin_left am-u-sm-2">
						<input type="checkbox" class="check command buton" />
					</div>
					<div class="shangpin_center am-u-sm-4">
						<div class="left_img am-center">
							<img src="img/gouwuche-1.jpg" />
						</div>
					</div>
					<div class="shangpin_right am-u-sm-6">
						<h4 class="fontsize-16 color-b">阿勒泰的角落（四色典藏版）</h4>
						<span class="fontsize-14">已选：赠品四季手绘书签典藏套装</span>
						<div class="price_shuliang am-cf">
							<span class="color-r am-fl">￥</span>
							<span class="color-r price cost am-fl">148.00</span>
							<div class="shuliang am-fr">
								<button type="button" class="radius subtract">-</button>
								<input type="text" value="1" class="num in_put" />
								<button type="button" class="radius plus">+</button>
							</div>
						</div>
					</div>
				</div>
				<div class="shopcarfooter border-bottom-d fontsize-16">
					<div class="footer_all am-g">
						<div class="am-u-sm-3">
							<input type="checkbox" class="check  all buton" />
							<span class="all_select">全选</span>
						</div>
						<div class="am-u-sm-6">
							<span>合计：
								<strong class="total_price">0</strong>
							</span>
						</div>
						<div class="am-u-sm-3 am-text-center">
							<a href="" class="jiesuan color-r">下单</a>
						</div>
					</div>
				</div>
			</div>
			<!--js-->
			<script>
				//减
				$('.subtract').click(function() {
					var t = $(this).parent().find('.in_put');
					t.val(parseInt(t.val()) - 1); //parseInt 转化为10进制的数字
					if(t.val() <= 1) {
						t.val(1);
					}
					//点击一下运行钱数
					sum();
				});
				//加
				$(".plus").click(function() {
					var t = $(this).parent().find('.in_put');
					t.val(parseInt(t.val()) + 1);
					if(t.val() <= 1) {
						t.val(1);
					}
					//点击一下运行钱数
					sum();
				});
				//点击商品按钮command
				$('.command').click(function() {
					var oMycommand = $(this).closest('.goods').find('.command'); //找到这个商品的
					var oAllcommand = $(this).closest('.goods').find('.command:checked'); //选中所有的复选框
					var oAll = $(this).closest('.goods').find('.all');
					if(oMycommand.length == oAllcommand.length) {
						oAll.prop('checked', true);
						//运行钱数
						sum();
					} else {
						oAll.prop('checked', false);
						//运行钱数
						sum();
					};
				});
				//点击全选按钮
				$('.all').click(function() {
					if($(this).prop('checked') == true) {
						$(this).closest('.goods').find('.buton').prop('checked', true); //让算所有的按钮都为true选中
						//运行钱数
						sum();
					} else {
						$(this).closest('.goods').find('.buton').prop('checked', false);
						//运行钱数
						sum();
					};
				});
				//总价
				function sum() {
					$(".goods").each(function() {
						var price = 0;
						$(this).find(".command").each(function() { //循环店铺里面的商品
							if($(this).is(":checked")) { //如果该商品被选中
								console.log($(this).closest(".btn_cost").find(".cost"));
								var num = parseInt($(this).parents(".btn_cost").find(".in_put").val()); //得到商品的数量
								var oPrice = parseFloat($(this).parents(".btn_cost").find(".cost").text()); //得到商品的单价
								var total = oPrice * num; //计算单个商品的总价
								price += total;
							}
							$(this).closest('.goods').find('.total_price').text(price.toFixed(2));
						})
					})
				}
			</script>

		</div>
		<div class="">
			<!--底部-->
			<ul class="footer am-cf  am-text-center margin-top">
				<li class="footer1 footerlist">
					<a href="index.html">
						<span class="am-icon-home am-icon-md"></span>
						<em>首页</em>
					</a>
				</li>
				<li class="footer2 footerlist">
					<a href="Life.html">
						<span class="am-icon-yelp am-icon-md"></span>
						<em>Life</em>
					</a>
				</li>
				<li class="footer3 footerlist">
					<a href="classify.html">
						<span class="am-icon-lemon-o am-icon-md"></span>
						<em>分类</em>
					</a>
				</li>
				<li class="footer4 footerlist">
					<a href="" class="color-r">
						<span class="am-icon-shopping-cart am-icon-md"></span>
						<em>购物车</em>
					</a>
				</li>
				<li class="footer5 footerlist">
					<a href="register.html">
						<span class="am-icon-user am-icon-md"></span>
						<em>个人</em>
					</a>
				</li>
			</ul>
		</div>
	</body>

</html>