<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    <title>My JSP 'order.jsp' starting page</title>
  
  </head>
  <body>
  <h3>填写收件人信息</h3>
    <s:form action="orderSubmit" method="post">
			<s:textfield label="%{getText('name')}" name="order.name"></s:textfield>
			<s:textfield label="%{getText('phone')}" name="order.phone"></s:textfield>
		    <s:textfield label="%{getText('address')}" name="order.address"></s:textfield>
			<s:submit value="%{getText('submitOrder')}"></s:submit>
		</s:form>
  </body>
</html>
