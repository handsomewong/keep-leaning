<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="js/jqueryui/css/jquery-ui-1.10.2.css" />
<script src="js/jqueryui/js/jquery-1.9.1.js"></script>
<script src="js/jqueryui/js/jquery-ui-1.10.2.js"></script>
<script src="js/jqueryui/js/datepicker-zh-CN.js"></script>
</head>
<body>
	
	<form action="makeupUpdate.action" method="post" enctype="multipart/form-data">

		<input type="hidden" name="page" value="${param.page}"/>
		
		<input type="hidden" name="makeup.id" value="${makeup.id}"/>
		<input type="hidden" name="makeup.cover" value="${makeup.cover}"/>

		图片：<img src="../${makeup.cover}" width="150px" height="150px">
		<br>
		修改: <input type="file" name="photo" size="12"/><br>
		商品名：<input type="text" name="makeup.name" value="${makeup.name}" required="required"/><br>
		价格：<input type="text" name="makeup.price" value="${makeup.price}" required="required"/><br>
		介绍：<input type="text" name="makeup.intro" value="${makeup.intro}" required="required"/><br>
<%-- 		作者：<input type="text" name="makeup.auther" value="${makeup.auther}"/><br> --%>
		品牌：<input type="text" name="makeup.press" value="${makeup.press}"/><br>
		出品日期：<input type="text" id="datepicker" name="makeup.pubdate" value="${makeup.pubdate}"/><br>
		商品分类:  <select name="makeup.category.id">
						<c:forEach var="category" items="${categoryList}">
							<c:if test="${makeup.category.id==category.id}">
								<option value="${category.id}" selected="selected">${category.name}</option>
							</c:if>
							<c:if test="${makeup.category.id!=category.id}">
								<option value="${category.id}">${category.name}</option>
							</c:if>
						</c:forEach>
				   </select>
		<input type="submit" value="修改"/>
		
	</form>
		
	${msg}
	
</body>
</html>
