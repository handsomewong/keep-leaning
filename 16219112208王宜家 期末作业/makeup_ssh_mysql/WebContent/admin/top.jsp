<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE2 {
	font-size: 12px;
	color: #333333;
}
-->
a:link {font-size:12px; color:#000000; text-decoration:none;}
a:visited {font-size:12px; color:#000000; text-decoration:none;}
a:hover {font-size:12px; color:#00CCFF;text-decoration:none;}
.STYLE4 {font-size: 12px}
</style></head>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="36" background="img/main_07.png"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
             <td width="282" height="52" background="img/main_05.png">
        	<span style="font-size:24px;font-weight:bolder;margin-left:60px;">
        		后台管理</span>
        </td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
	            <span class="STYLE1">
	            	<img src="images/home.gif" width="12" height="13"> 
	            </span>
	            <span class="STYLE4">
	            	<a href="../index/index.action"  target="_blank">网站首页</a>
	            </span>
	            <span class="STYLE1"> </span>
            </td>
          </tr>
        </table></td>
        <td width="247" background="img/main_08.png">&nbsp;</td>
        <td width="283" background="img/main_09.png"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
            	<img src="images/uesr.gif" width="14" height="14">
            	<span class="STYLE2"> 当前登录用户：${sessionScope.admin}</span>
            	<span class="STYLE1"> 
	            	<img src="images/quit.gif" width="16" height="13"> 
	            </span>
	            <span class="STYLE4">
	            	<a href="login.jsp" target=_top>退出</a>
	            </span>
            </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</html>
