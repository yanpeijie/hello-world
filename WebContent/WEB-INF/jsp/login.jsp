<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>欢迎登录后台管理系统</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=basePath %>plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/cloud.js" ></script>
	<script language="javascript">
		$(function() {
			$('.loginbox').css( {
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
			$(window).resize(function() {
				$('.loginbox').css( {
					'position' : 'absolute',
					'left' : ($(window).width() - 692) / 2
				});
			});
		});
	</script>
</head>

<body style="background-color: #1c77ac; background-image: url(images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">

	<!-- 漂浮云效果 开始-->
	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>
	<!-- 漂浮云效果 结束-->

	<!-- 顶部导航 -->
	<div class="logintop">
		<span>欢迎登录后台管理界面平台</span>
		<ul>
			<li>
				<a href="javascript:void(0)">帮助</a>
			</li>
			<li>
				<a href="javascript:void(0)">关于</a>
			</li>
		</ul>
	</div>
	<!-- 顶部导航 -->
	
	<form action="login" method="post">
	<div class="loginbody">
		<span class="systemlogo"></span>
		<div class="loginbox">
			<ul>
				<li>
					<input name="account" id="account" type="text" class="loginuser"
						placeholder="请输入账号" />
				</li>
				<li>
					<input name="password" id="password" type="text" class="loginpwd"
						placeholder="请输入密码" />
				</li>
				<li>
					<input type="submit" class="loginbtn" value="登录" />
					${m }
					<label>
						<!-- 可以用于错误提示功能 -->
						<a href="zhuce"><input type="button" class="loginbtn" value="注册" /></a>
						
						<!--
                       <input name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a href="#">忘记密码？</a>
                       -->
					</label>
				</li>
			</ul>
		</div>
	</div>
	</form>
</body>

</html>
