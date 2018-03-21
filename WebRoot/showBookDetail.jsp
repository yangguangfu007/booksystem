<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'showBookDetail.jsp' starting page</title>


</head>

<body>
<h3>${book.bname }</h3>
<img alt="${book.bname }" src="${book.url }">
	<table>
	    <tr>
			<td>价格：</td>
			<td>${book.bprice } RMB</td>
		</tr>
		<tr>
			<td>作者：</td>
			<td>${book.bauthor }</td>
		</tr>
		<tr>
			<td>简介：</td>
			<td>${book.bbrief }</td>
		</tr>
		<tr>
			<td>库存：</td>
			<td>${book.bnum }本</td>
		</tr>
		<tr>
			<td>出版日期：</td>
			<td><s:date name="book.bdate" format="yyyy/MM/dd"/></td>
		</tr>
	</table>
	<a href="index">返回</a>&nbsp;<a href="addToCart?book.bid=${book.bid }">加入购物车</a>
</body>
</html>
