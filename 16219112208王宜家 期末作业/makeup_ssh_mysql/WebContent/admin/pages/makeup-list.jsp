<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/wyj.css"/>
</head>

<body>

<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td width="15" height="30"><img src="img/tab_03.png" width="15" height="30" /></td>
		  <td background="img/tab_05.png"><img src="img/311.gif" width="16" height="16" /> 
			<span class="STYLE4">商品列表</span></td>
		  <td width="14"><img src="img/tab_07.png" width="14" height="30" /></td>
		</tr>
	  </table>
	</td>
  </tr>
  <tr>
    <td>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="9" background="img/tab_12.png">&nbsp;</td>
          <td bgcolor="e5f1d6">
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CECECE">
				<tr>
					<td width="5%" height="26"  class="STYLE1" bgcolor="#fff">
						<div align="center" class="STYLE2 STYLE1">编号</div></td>
					<td width="10%" height="26"  class="STYLE1" bgcolor="#fff">
						<div align="center" class="STYLE2 STYLE1">图片</div></td>
					<td width="10%" height="26"  class="STYLE1" bgcolor="#fff">
						<div align="center" class="STYLE2 STYLE1">商品名</div></td>
					<td width="5%" height="26"  class="STYLE1" bgcolor="#fff">
						<div align="center" class="STYLE2 STYLE1">价格</div></td>
					<td width="20%" height="26"  class="STYLE1" bgcolor="#fff">
						<div align="center" class="STYLE2 STYLE1">介绍</div></td>
<!-- 			        <td width="10%" height="26" background="images/tab_14.gif" class="STYLE1">  -->
<!-- 					<div align="center" class="STYLE2 STYLE1">作者</div></td>  -->
					<td width="10%" height="26"  class="STYLE1" bgcolor="#fff">
						<div align="center" class="STYLE2 STYLE1">品牌</div></td>
					<td width="10%" height="26"  class="STYLE1" bgcolor="#fff">
						<div align="center" class="STYLE2 STYLE1">出品日期</div></td>
					<td width="20%" height="26"  class="STYLE1" bgcolor="#fff">
						<div align="center" class="STYLE2">操作</div></td>
				</tr>
				
				<!-- 用struts的iterator标签遍历news集合, 并去处每一个name显示 -->
				<c:forEach var="makeup" items="${makeupList}">
	
					<tr>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${makeup.id}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1"><a href="../index/detail.action?makeupid=${makeup.id}" target="_blank"><img src="../${makeup.cover}" width="150px" height="150px"></a></div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1"><a href="../index/detail.action?makeupid=${makeup.id}" target="_blank">${makeup.name}</a></div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${makeup.price}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${makeup.intro}</div></td>
<!-- 						<td height="20" bgcolor="#FFFFFF"> -->
<%-- 							<div align="center" class="STYLE2 STYLE1">${makeup.auther}</div></td> <img src="images/010.gif" width="9" height="9" />--%>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${makeup.press}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${makeup.pubdate}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center">
								<c:if test="${!makeup.special}"><span class="STYLE1">[</span><a href="makeupSet.action?id=${makeup.id}&flag=11&status=${status}&page=${page}">设为推荐</a><span class="STYLE1">]</span></c:if>
								<c:if test="${makeup.special}"><span class="STYLE1">[</span><a href="makeupSet.action?id=${makeup.id}&flag=10&status=${status}&page=${page}">取消推荐</a><span class="STYLE1">]</span></c:if>
								<c:if test="${!makeup.news}"><span class="STYLE1">[</span><a href="makeupSet.action?id=${makeup.id}&flag=21&status=${status}&page=${page}">设为最新</a><span class="STYLE1">]</span></c:if>
								<c:if test="${makeup.news}"><span class="STYLE1">[</span><a href="makeupSet.action?id=${makeup.id}&flag=20&status=${status}&page=${page}">取消最新</a><span class="STYLE1">]</span></c:if>
								<c:if test="${!makeup.sale}"><span class="STYLE1">[</span><a href="makeupSet.action?id=${makeup.id}&flag=31&status=${status}&page=${page}">设为促销</a><span class="STYLE1">]</span></c:if>
								<c:if test="${makeup.sale}"><span class="STYLE1">[</span><a href="makeupSet.action?id=${makeup.id}&flag=30&status=${status}&page=${page}">取消促销</a><span class="STYLE1">]</span></c:if>
								<br>
								<img src="img/037.gif" width="9" height="9" /><span class="STYLE1">[</span><a href="makeupUp.action?id=${makeup.id}&page=${page}">修改</a><span class="STYLE1">]</span>
								<img src="img/083.gif" width="9" height="9" /><span class="STYLE1">[</span><a href="makeupDelete.action?makeup.id=${makeup.id}&page=${page}">删除</a><span class="STYLE1">]</span>
							</div>
						</td>
					</tr>
					
				</c:forEach>
				
			</table>
		  </td>
		  <td width="9" background="img/tab_16.png">&nbsp;</td>
		</tr>
	  </table>
	</td>
  </tr>
  <tr>
    <td height="29">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td width="15" height="29"><img src="img/tab_20.png" width="15" height="29" /></td>
			<td background="img/tab_21.png">${pageTool}</td>
			<td width="14"><img src="img/tab_22.png" width="14" height="29" /></td>
		  </tr>
		</table>
	</td>
  </tr>
</table>

</body>
</html>
