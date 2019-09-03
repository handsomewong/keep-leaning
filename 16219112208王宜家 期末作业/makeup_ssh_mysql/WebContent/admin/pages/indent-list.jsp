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
			<span class="STYLE4">订单列表</span></td>
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
					<td width="5%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">订单编号</div></td>
					<td width="10%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">下单时间</div></td>
					<td width="5%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">下单用户</div></td>
					<td width="5%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">商品数量</div></td>
					<td width="5%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">订单总价</div></td>
					<td width="5%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">订单状态</div></td>
					<td width="5%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">收货人姓名</div></td>
					<td width="5%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">收货人电话</div></td>
					<td width="15%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">收货地址</div></td>
					<td width="15%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2">操作</div></td>
				</tr>
				
				<!-- 用struts的iterator标签遍历news集合, 并去处每一个name显示 -->
				<c:forEach var="indent" items="${indentList}">
	
					<tr>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${indent.id}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${indent.systime}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${indent.user.username}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${indent.amount}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${indent.total}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">
								<c:if test="${indent.status==1}">未处理</c:if>
								<c:if test="${indent.status==2}">已处理</c:if>
								<c:if test="${indent.status==3}">已删除</c:if>
							</div>
						</td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${indent.name}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${indent.phone}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${indent.address}</div></td>
								
						<td height="20" bgcolor="#FFFFFF">
							<div align="center">
								<img src="img/a1.png" width="9" height="9" /><span class="STYLE1">[</span><a href="itemList.action?id=${indent.id}">查看详情</a><span class="STYLE1">]</span>
								<c:if test="${indent.status==1}">
									<img src="img/037.png" width="9" height="9" /><span class="STYLE1">[</span><a href="indentDispose.action?id=${indent.id}&status=${status}&page=${page}">标记处理</a><span class="STYLE1">]</span>
								</c:if>
								<img src="img/083.png" width="9" height="9" /><span class="STYLE1">[</span><a href="indentDelete.action?id=${indent.id}&status=${status}&page=${page}">删除</a><span class="STYLE1">]</span>
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
