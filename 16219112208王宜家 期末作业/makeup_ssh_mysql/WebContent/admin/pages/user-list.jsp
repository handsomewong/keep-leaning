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
			<span class="STYLE4">顾客列表</span></td>
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
					<td width="10%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">编号</div></td>
					<td width="10%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">用户</div></td>
					<td width="20%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">姓名</div></td>
					<td width="20%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">电话</div></td>
					<td width="20%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2 STYLE1">地址</div></td>
					<td width="20%" height="26" bgcolor="#fff" class="STYLE1">
						<div align="center" class="STYLE2">操作</div></td>
				</tr>
				
				<!-- 用struts的iterator标签遍历news集合, 并去处每一个name显示 -->
				<c:forEach var="user" items="${userList}">
	
					<tr>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${user.id}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${user.username}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${user.name}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${user.phone}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE2 STYLE1">${user.address}</div></td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center">
								<img src="img/037.gif" width="9" height="9" /><span class="STYLE1">[</span><a href="userRe.action?id=${user.id}&page=${page}">重置密码</a><span class="STYLE1">]</span>
								<img src="img/037.gif" width="9" height="9" /><span class="STYLE1">[</span><a href="userUp.action?id=${user.id}&page=${page}">修改</a><span class="STYLE1">]</span>
								<img src="img/083.gif" width="9" height="9" /><span class="STYLE1">[</span><a href="userDelete.action?id=${user.id}&page=${page}">删除</a><span class="STYLE1">]</span>
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
			<td background="img/tab_21.png">
				<a href="pages/user-add.jsp">添加顾客</a>${pageTool}
			</td>
			<td width="14"><img src="img/tab_22.png" width="14" height="29" /></td>
		  </tr>
		</table>
	</td>
  </tr>
</table>

</body>
</html>
