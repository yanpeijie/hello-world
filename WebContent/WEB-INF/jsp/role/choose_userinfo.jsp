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
	<title>角色选择用户</title>
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

<form action="role/editUser" method="post">
	<input type="hidden" name="role_id" value="${role.id }"/>
	<div class="formbody">
		<div class="formtitle"><span>选择用户--  ${role.name }</span></div>
		<ul class="forminfo">
			<li>
				<label>已有用户</label>
				<c:forEach items="${havList }" var="d">
					<input type="checkbox" name="ids" value="${d.id }" checked="checked"/>  ${d.realname }
				</c:forEach>
			</li>
			<li>
				<label>未有用户</label>
				<c:forEach items="${notList }" var="d">
					<input type="checkbox" name="ids" value="${d.id }"/>  ${d.realname }
				</c:forEach>
			</li>
			<li>
				<label>&nbsp;</label>
				<input name="" type="submit" class="btn" value="确认保存"/>
			</li>
		</ul>
	</div>
</form>


<script type="text/javascript" src="<%=basePath %>plugins/jquery/jquery.min.js"></script>
</body>
</html>
	