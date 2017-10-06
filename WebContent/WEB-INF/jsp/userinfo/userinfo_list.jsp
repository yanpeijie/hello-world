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
	<table id="table"></table>
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
<script src="modual/role/list.js"></script>
<script type="text/javascript">$(function(){RoleList.init();});</script>

<script type="text/javascript">
var RoleList = function(){
	return {
		init: function(){
			ShxtTable.init($("#table"), {
				url: "role/data",
				columns : [{
					field: "id"	,
					title:"主键"
				},
				{
					field: "name",
					title: "名称"
				},
				{
					title: "操作",
					formatter:RoleList.operateFormatter,
					events: RoleList.operateEvents
					
				}],
				sidePagination: "client"
			});
		},
		operateFormatter: function (){
			//按钮的几种颜色:  btn-default 白,  btn-primary 蓝，  btn-success 绿  
			// 					btn-info 浅蓝， btn-warning 橘黄 btn-danger 红  btn-link 连接
			//按钮的大小： .btn-lg btn-sm btn-xs
		    var s = [
		        '<button class="user btn-default btn btn-xs glyphicon glyphicon-info-sign" title="选择用户">查看部门员工</button>',
		        ' <button class="edit btn-default btn btn-xs  glyphicon glyphicon-edit"  title="编辑"></button>',
		        ' <button class="remove btn-default btn btn-xs glyphicon glyphicon-remove" title="删除"></button>'
		    ];
		    
		    return s.join('');
		},
		operateEvents: {
			'click .user': function (e, value, row, index) {
				location.href= "role/chooseUserinfoin?id="+ row.id;
				
		    },
		    'click .edit': function (e, value, row, index) {
		        layer.open({
				  type: 2,
				  title: "修改员工",
				  shadeClose: true,
				  skin: 'layui-layer-lan', //样式类名 layui-layer-lan layui-layer-molv
				  shade: 0.7,
				  area: ['80%', '90%'],
				  content: "UserinfoUpdateShow.do?id=" + row.id //iframe的url
				}); 
		    },
		    'click .remove': function (e, value, row, index) {
		    	var index = layer.msg("您确定删除么？", {
		    		btn:['确定','取消'],
		    		yes : function(){
		    			/* $table.bootstrapTable('remove', {
		    	            field: 'id',
		    	            values: [row.id]
		    	        }); */
		    			
		    			
		    	        ShxtTable.refresh();
		    			
		    			layer.close(index);
		    		}
		    	});
		    }
		}
	}
}();



</script>
</body>
</html>