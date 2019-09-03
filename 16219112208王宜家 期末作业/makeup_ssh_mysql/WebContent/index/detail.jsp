<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/makeup.js"></script>
<title>商品详情</title>
</head>
<body>

<div id="wrap">

<jsp:include page="header.jsp"/>

<div class="center_content">

	<div class="left_content">
	
		<div class="title"><span class="title_icon"><img src="img/bullet1.png"/></span>${makeup.name}</div>
		<div class="feat_prod_box_details">
			<div class="prod_img">
				<img src="../${makeup.cover}" class="thumb_big" border="0" />
			</div>
			<div class="prod_det_box">
				<div class="box_top"></div>
				<div class="box_center">
					<div class="prod_title">${makeup.name}</div>
					<p class="details">${makeup.intro}</p>
					<div class="price"><strong>价格:</strong> <span class="red">$${makeup.price}</span></div>
					<div style="text-align: right;margin-right:11px;margin-top:-20px">
						<a href="javascript:void(0);" onclick="buy(${makeup.id})">
							<img src="img/button.png" width="150px"/>
						</a>
					</div>
					<div class="clear"></div>
				</div>
				<div class="box_bottom"></div>
			</div>
			<div class="clear"></div>
		</div>
		
		<div id="demo" class="demolayout">
		
			<ul id="demo-nav" class="demolayout">
				<li><a class="active">详细介绍</a></li>
				<!-- <li><a class="" href="javascript:alert('暂未实现');">相关推荐</a></li> -->
			</ul>
			<div class="tabs-container">
				<div style="display: block;" class="tab" id="tab1">
					<p class="more_details">${makeup.intro}</p>
					<ul class="list">
						<li><a href="">品牌: ${makeup.press}</a></li>
						<li><a href="">出品日期: ${makeup.pubdate}</a></li>
						<li><a href="">商品分类: ${makeup.category.name}</a></li>
					</ul>
				</div>
				<div style="display: none;" class="tab" id="tab2">
				</div>
			</div>
        
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