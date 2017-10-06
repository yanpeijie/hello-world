<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<base href="<%=basePath%>" target="leftFrame"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>

<body style="background:url(<%=basePath %>images/topbg.gif) repeat-x;">

<div class="topleft">
	<a href="main.html" target="_parent"><img src="<%=basePath %>images/logo.png" title="系统首页" /></a>
</div>
    
<ul class="nav">
	<li><a href="showMenu"><img src="<%=basePath%>images/icon01.png" title="工作台" /><h2>菜单示例</h2></a></li>
	<li><a href="index/left2.jsp" class="selected"><img src="<%=basePath%>images/icon02.png" title="模板管理" /><h2>模板管理</h2></a></li>
	<li><a href="javascript:;" ><img src="<%=basePath%>images/icon03.png" title="模块设计" /><h2>模块设计</h2></a></li>
	<li><a href="javascript:;" ><img src="<%=basePath%>images/icon04.png" title="常用工具" /><h2>常用工具</h2></a></li>
	<li><a href="javascript:;"><img src="<%=basePath%>images/icon05.png" title="文件管理" /><h2>文件管理</h2></a></li>
	<li><a href="javascript:;" ><img src="<%=basePath%>images/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li>
</ul>
        
<div class="topright">    
	<ul>
	<li><span><img src="<%=basePath%>images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
	<li><a href="#">关于</a></li>
	<li><a href="login.html" target="_parent">退出</a></li>
	</ul>
	<div class="user">
		<span>admin</span>
		<i>消息</i>
		<b>5</b>
	</div>    
</div>
    
<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript">
	$(function(){	
		//顶部导航切换
		$(".nav li a").click(function(){
			$(".nav li a.selected").removeClass("selected")
			$(this).addClass("selected");
		})	
	});	
</script>
</body>
</html>

