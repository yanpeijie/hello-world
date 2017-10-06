<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询</title>

<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="plugins/bootstrap-table/bootstrap-table.css">

<!-- 编辑表格 -->
<link rel="stylesheet" href="plugins/bootstrap-table/extensions/editable/x-editable/bootstrap-editable.css">

</head>
<body>
<div class="container">
	<h1>员工查看</h1>
	<table id="table">
		<thead>
			<tr>
				<th data-checkbox="true"></th>
				<th data-field="id" >编号</th>
				<th data-field="age" data-sortable="true">年龄</th>
				<th data-field="realname" data-halign="center" data-editable="true" data-sortable="true">真实姓名</th>
				<th data-field="account" data-align="center" data-width="20%" data-sortable="true" data-editable="true">账号</th>
				<th data-field="sex" data-formatter="UserinfoList.sexFormatter">性别</th>
				<th data-field="photo">照片</th>
				<th data-field="dept.d_name">部门</th>
				<th data-field="stat" data-formatter="UserinfoList.statFormatter" data-cell-style="UserinfoList.statStyle">状态</th>
				<th data-formatter="UserinfoList.operateFormatter" data-events="UserinfoList.operateEvents" >操作</th>
			</tr>
		</thead>
	</table>
</div>



<script src="plugins/jquery/jquery.min.js"></script>
<!-- boootstrap需用 -->
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/bootstrap-table/bootstrap-table.js"></script>
<!-- 编辑表格 -->
<script src="plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.js"></script>
<script src="plugins/bootstrap-table/extensions/editable/x-editable/bootstrap-editable.js"></script>
<!-- 弹出框 -->
<script src="plugins/layer/layer.js"></script>

<script src="js/ShxtTable.js"></script>
<script src="modual/userinfo/list.js"></script>
<script type="text/javascript">$(function(){UserinfoList.init();});</script>

<script type="text/javascript">


</script>
</body>
</html>