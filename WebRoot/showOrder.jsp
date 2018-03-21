<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'showOrder.jsp' starting page</title>
<style type="text/css">
td {
	text-align: center;
	width: 100px;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<h3>订单列表</h3>
	<table>
		<tr>
			<td>订单号</td>
			<td>用户id</td>
			<td>收件人</td>
			<td>电话</td>
			<td>地址</td>
			<td>详情</td>
		</tr>
		<s:iterator value="OrderList" var="o">
			<tr>
				<td>${o.orderid }</td>
				<td>${o.user.userid }</td>
				<td>${o.name }</td>
				<td>${o.phone }</td>
				<td>${o.address }</td>
				<td><a
					href="OrderAction_findOrderDetail?order.orderid=${o.orderid }">查看订单详情</a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>
