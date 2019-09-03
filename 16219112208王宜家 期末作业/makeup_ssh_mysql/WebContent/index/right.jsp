<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

<div class="right_content">
	
	<c:if test="${sessionScope.indent!=null}">
		<div class="cart">
			<div class="title">
				<a href="cart.action"><img src="img/cart.gif" alt="购物车" title="购物车"/></a>
			</div>
			<div class="home_cart_content">
				<span>共${sessionScope.indent.amount}件 | 总价: ${sessionScope.indent.total}</span>
			</div>
			<a href="cart.action" class="view_cart">查看购物车</a> 
		</div>
	</c:if>

	
	<div class="title"><span class="title_icon"><img src="img/bullet3.png"/></span>护肤顺序</div>
	<div class="about">
		<p> 
			日常护肤最全步骤分早上护肤和晚上护肤<br>
这个顺序基本上是最全的步骤，如果是懒人可以简化步骤，或者根据自己肤质简化，总之记住：<br>
早上护肤：洁面，爽肤水，精华，防晒不能少<br>
晚上护肤：卸妆，洁面，爽肤水，精华，乳液或面霜<br>
		</p>
	</div>
	
	
	<div class="right_box">
	
		<div class="title"><span class="title_icon"><img src="img/bullet4.png"/></span>优惠促销</div>
		
		<c:forEach var="makeup" items="${saleList}">
			<div class="new_prod_box"> <a href="detail.action?makeupid=${makeup.id}">${makeup.name}</a>
				<div class="new_prod_bg">
					<span class="new_icon"><img src="img/promo_icon.png"/></span> 
					<a href="detail.action?makeupid=${makeup.id}"><img src="../${makeup.cover}" class="thumb" border="0" /></a>
				</div>
			</div>
		</c:forEach>

	</div>


	<div class="right_box">
	
		<div class="title"><span class="title_icon"><img src="img/bullet5.png"/></span>商品分类</div>
		<ul class="list">
			<c:forEach var="category" items="${categoryList}">
				<li><a href="category.action?categoryid=${category.id}">${category.name}</a></li>
			</c:forEach>
		</ul>
		
	</div>
</div>
    
</body>
</html>