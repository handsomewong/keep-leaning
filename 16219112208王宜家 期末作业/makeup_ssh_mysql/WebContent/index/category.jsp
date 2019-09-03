<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品分类</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="img/bullet1.png"/></span>商品分类</div>

		<div class="new_products">
		
			<c:forEach var="makeup" items="${makeupList}">
			
				<div class="new_prod_box"> <a href="details.htm">${makeup.name}</a>
					<div class="new_prod_bg">
						<c:if test="${makeup.special==true}"><span class="new_icon"><img src="img/special_icon.png"/></span></c:if>
						<c:if test="${makeup.news==true}"><span class="new_icon"><img src="img/new_icon.png"/></span></c:if>
						<c:if test="${makeup.sale==true}"><span class="new_icon"><img src="img/promo_icon.png"/></span></c:if>
						<a href="detail.action?makeupid=${makeup.id}"><img src="../${makeup.cover}" class="thumb" border="0" /></a>
					</div>
				</div>
				
			</c:forEach>
			
			<!-- 分页 -->
			${pageTool}
			
		</div>
		
		<div class="clear"></div>
	
	</div>
   
   	<jsp:include page="right.jsp"/>
   
	<div class="clear"></div>
	
</div>

<jsp:include page="footer.jsp"/>

</div>

</body>
</html>