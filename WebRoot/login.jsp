<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title>My JSP 'login.jsp' starting page</title>

  </head>
  
  <body>
  <h3>用户登录</h3>
  	${msg}
   		<s:form action="UserAction_login1" method="post">
			<s:textfield label="%{getText('username')}" name="user.username"></s:textfield>
			<s:password label="%{getText('userpass')}" name="user.userpass"></s:password>
			<s:submit value="%{getText('login')}"></s:submit>
		</s:form>
  </body>
</html>
