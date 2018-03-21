<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
	<style>
    input{width: 20px;}
    .text_box{width: 40px;}/*输入数量框长度  */
    th,td{width: 100px;text-align: center;}
  </style>
  <script type="text/javascript" src="js/jquery-2.1.1.js"></script>


  <script type="text/javascript">
    $(function(){
      //输入框失去焦点，判断值,不能小于1，不能为字符
      $(".text_box").blur(function () {
      	 //获得商品数量
          var num=$(this).val();
          if(isNaN(parseInt(num))){
            alert("请输入数字！");
          	$(this).select();
          }
          if(parseInt(num)<1){
            $(this).val(1);
            alert("亲，不能再少了！哭");
          }
            //获得该商品的id
          var bid=$(this).next().next().val();
          num=$(this).val();
          $.ajax({
				   type: "POST",
				   url: "BookAction_upateCart",
				   data: "book.bid="+bid+"&book.num="+num,
				   dataType: "text",
				   success: function(msg){
				   	/* 	if(msg=="ok"){
				   			alert("修改数量成功！");
				   		} */
				   }
				});
        //变化单价
        amount();
        //变化总价
        setTotal();
        });
        
      //删除商品
      $(".delete").click(function () {
      	var bid=$(this).parent().prev().prev(".num").find("input[class='bid']").val();
      	 $.ajax({
				   type: "POST",
				   url: "BookAction_upateCart",
				   data: "book.bid="+bid,
				   dataType: "text",
				   success: function(msg){
				   		if(msg=="ok"){
				   			alert("删除成功！");
				   		}
				   }
				});
        $(this).parent().parent().remove();
        amount();
        setTotal();
      });
	  //增加数量
      $(".add").click(function(){
        var t=$(this).parent().find('input[class*=text_box]');
        t.val(parseInt(t.val())+1);
        var num=t.val();
        var bid=$(this).next().val();
         $.ajax({
				   type: "POST",
				   url: "BookAction_upateCart",
				   data: "book.bid="+bid+"&book.num="+num,
				   dataType: "text",
				   success: function(msg){
				   	/* 	if(msg=="ok"){
				   			alert("修改数量成功！");
				   		} */
				   }
				});
        amount();
        setTotal();
      });
	  //减少数量
      $(".min").click(function(){
        var t=$(this).parent().find('input[class*=text_box]');
        t.val(parseInt(t.val())-1);
        if(parseInt(t.val())<=0){
          t.val(1);
          alert("亲，不能再少了！哭");
        }
        var bid=$(this).parent().find('input[class*=bid]').val();
        var num=t.val();
        $.ajax({
				   type: "POST",
				   url: "BookAction_upateCart",
				   data: "book.bid="+bid+"&book.num="+num,
				   dataType: "text",
				   success: function(msg){
				   		/* if(msg=="ok"){
				   			alert("修改数量成功！");
				   		} */
				   }
				});
        amount();
        setTotal();
      });
	  //单个商品总价
      function amount() {
        var s=0.0;
        //each 循环
        $("#tab .price").each(function(){
          s=parseFloat($(this).text())*parseInt($(this).parent().next(".num").find('input[class*=text_box]').val());
          $(this).parent().next().next(".amount").html(s+"元");
        });
      }
	  //商品总价
      function setTotal(){
        var s=0.0;
        $("#tab .price").each(function(){
          s+=parseFloat($(this).text())*parseInt($(this).parent().next(".num").find('input[class*=text_box]').val());
        });
        $("#total").html(s+"元");
      }
    	
   	 });
  </script>
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
				
  	<table id="tab">
	    <tr>
	      <th>商品名称</th>
	      <th>商品单价</th>
	      <th>商品数量</th>
	      <th>小计</th>
	    </tr>
  	<s:iterator value="list" var="b">
  		<tr>
  			<td>${b.bname }</td>
      		<td><span class="price">${b.bprice }</span></td>
      		<td class="num">
        		<input class="min" name="" type="button" value="-" />
        		<input class="text_box" name="" type="text" value="${b.num }"/>
        		<input class="add" name="" type="button" value="+" />
        		<input class="bid" type="hidden" name="" value="${b.bid }" >
      		</td>
      		<td class="amount">${b.num*b.bprice}元</td>
      		<td><button class="delete">删除此商品</button></td>
  		</tr>
  	</s:iterator>
  	</table>
  	 <h3>总金额：<label id="total">${totalMoney }元</label></h3>
  	 <h2><a href="Usercheck">结算</a></h2>
  	 </div>
  	 <div class="">
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
					<a href="#" class="color-r">
						<span class="am-icon-shopping-cart am-icon-md"></span>
						<em>购物车</em>
					</a>
				</li>
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
