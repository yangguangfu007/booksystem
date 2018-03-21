<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'addBook.jsp' starting page</title>
   
  </head>
  
  <body>
  <h3>添加图书</h3>
  <s:form action="BookAction_addBook" method="post" enctype="multipart/form-data"> 
  	<s:textfield name="book.bname" label="书名"></s:textfield>
  	<s:textfield name="book.bauthor" label="作者"></s:textfield>
  	<s:textfield name="book.bbrief" label="简介"></s:textfield>
  	<s:textfield name="book.bnum" label="库存量"></s:textfield>
  	<s:textfield name="book.bprice" label="价格"></s:textfield>
  	<s:textfield name="book.bdate" label="出版日期"></s:textfield>
  	<s:file name="uploadimg" label="上传图片"></s:file>
  	<s:submit value="上传"></s:submit>
  </s:form>
  </body>
</html>
