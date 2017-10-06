<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">首页</a></li>
		<li><a href="#">表单</a></li>
	</ul>
</div>

<form action="">
	<div class="formbody">
		<div class="formtitle"><span>修改员工</span></div>
		<ul class="forminfo">
			<li>
				<label>账号  </label>
				<input name="account" type="text" class="dfinput" value="${u.account }"/>
				<i>标题不能超过30个字符</i>
			</li>
			<li>
				<label>真实姓名</label>
				<input name="realname" type="text" class="dfinput" value="${u.realname }"/>
				<i>多个关键字用,隔开</i>
			</li>
			<li>
				<label>性别   </label>
				<cite> 
					<input name="sex" type="radio" value="1"    <c:if test="${u.sex == '1' }">checked="checked"</c:if>   />男&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="sex" type="radio" value="0" <c:if test="${u.sex == '0' }">checked="checked"</c:if> />女
				</cite>
			</li>
			<li>
				<label>引用地址</label>
				<input name="" type="text" class="dfinput" value="" /><i class="inputerror">多个关键字用,隔开</i>
			</li>
			<li>
				<label>文章内容</label>
				<textarea name="" cols="" rows="" class="textinput"></textarea>
			</li>
			<li>
				<label>&nbsp;</label>
				<input name="" type="submit" class="btn" value="确认保存"/>
			</li>
		</ul>
	</div>
</form>


<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
</body>
</html>
	