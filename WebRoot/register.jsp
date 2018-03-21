<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'register.jsp' starting page</title>

  </head>
  <script type="text/javascript" src="js/jquery-2.1.1.js"></script>
  <script type="text/javascript">
  		document.getElementsByName('user.userlimit')[0].checked=true;
  </script>
  
  <body>
   <h3>用户注册</h3>
   <s:form action="UserAction_register" method="post">
				<s:textfield label="%{getText('username')}" name="user.username"></s:textfield>
				<s:password label="%{getText('userpass')}" name="user.userpass"></s:password>
				<s:password label="%{getText('userpass1')}" name="userpass1"></s:password>
				<s:radio name="user.userlimit" list="%{#{'1':'管理员','0':'用户'}}" value="1"></s:radio>
				<s:submit value="%{getText('register')}"></s:submit>
		</s:form>
  </body>
</html>
