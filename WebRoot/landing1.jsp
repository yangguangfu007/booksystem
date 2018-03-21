<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="AmazeUI/js/amazeui.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="js/swiper-3.4.2.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/swiper-3.4.2.min.css" />
		<link rel="stylesheet" type="text/css" href="AmazeUI/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="AmazeUI/css/app.css" />
		<link rel="stylesheet" type="text/css" href="css/landing.css" />
		<title>用户登录</title>
	</head>

	<body>
		<div class="cuntent am-text-center padding-top">
			<div class="top am-center"></div>
			${msg}
			<div class="am-padding zhuce">
				<form action="UserAction_login" class="am-form" method="post" >
					<fieldset>
						<div class="am-form-group am-padding-horizontal">
							 <input type="text" name="user.username" id="doc-vld-528" class="js-pattern-mobile" placeholder="输入手机号"  required />
						</div>

						<div class="am-form-group am-padding-horizontal">
							<input type="password" name="user.userpass" id="doc-vld-pwd-2" placeholder="密码 " data-equal-to="#doc-vld-pwd-1" required/>
						</div>
					</fieldset>
					<div class="margin-top">
					    <input type="submit" class="denglu am-center" value="登录"/>
						<!-- <a href="personalcenter.html"><em class="denglu am-center"></em></a> -->
					</div>
				</form>
				<div class="am-padding">
					<a href="index">先逛逛</a>
				</div>
			</div>
		</div>
	</body>

</html>