<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'showOrderDetail.jsp' starting page</title>
<style type="text/css">
td {
	text-align: center;
	width: 100px;
}
</style>
</head>

<body>
	<h3>订单详情</h3>
	<table>
		<tr>
			<td>商品名称</td>
			<td>商品数量</td>
			<td>商品单价</td>
			<td>商品总价</td>
		</tr>
		<s:iterator value="list" var="d">
			<tr>
				<td>${d.name }</td>
				<td>${d.num }</td>
				<td>${d.price }</td>
				<td>${d.amount}</td>
			</tr>
		</s:iterator>
	</table>
	<a href="index">返回首页</a>
</body>
</html>
