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
				<th data-field="sex" data-formatter="sexFormatter">性别</th>
				<th data-field="photo">照片</th>
				<th data-field="dept.d_name">部门</th>
				<th data-field="stat" data-formatter="statFormatter" data-cell-style="statStyle">状态</th>
				<th data-formatter="operateFormatter" data-events="operateEvents" >操作</th>
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

<script type="text/javascript">
var $table;

$(function(){
	$table = $("#table");
	
	$table.bootstrapTable({
		/******************************【基本】****************************************************/
		url: "UserinfoList.do",
		//height : "350", 	//[undefined] 定义表格的高度。
		striped : true,		//[true] 设置为 true 会有隔行变色效果
		
		/******************************【数据请求】****************************************************/
		method : "post",//['get']服务器数据的请求方式 'get' or 'post'
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",//['application/json']发送到服务器的数据编码类型
		
		/*
		请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，例如 toolbar 中的参数 ，
		参数有：
		limit 显示的数据条数, offset 起始记录数, search 搜索, sort 排序, order 升降 
		返回false将会终止请求
		
		默认：function(params) { 
				return params;
			}
		*/
		//queryParams : queryParams, //Function
		
		/*****************************【显示】*****************************************************/
		undefinedText : "",	//['-'] 当数据为 undefined 时显示的字符
		rowStyle:rowStyle,//行样式
		
		/*****************************【单选多选按钮】*****************************************************/
		selectItemName: "id", //['btSelectItem'] radio or checkbox 的字段名
		clickToSelect: true, //[false] 设置true 将在点击行时，自动选择rediobox 和 checkbox
		
		/****************************【排序】******************************************************/
		sortName: "age",	//[undefined] 定义排序列,通过url方式获取数据填写字段名，否则填写下标
		sortOrder : "desc",	//['asc'] 定义排序方式 'asc' 或者 'desc'
		
		
		/****************************【分页】******************************************************/
		pagination: true, //[false] 设置为 true 会在表格底部显示分页条
		/*//['server']设置在哪里进行分页，可选值为 'client' 或者 'server'。设置 'server'时，
		必须设置 服务器数据地址（url）或者重写ajax方*/
		sidePagination: "server",
		pageSize: 5,//[10] 如果设置了分页，页面数据条数
		/*Array [10, 25, 50, 100, All]如果设置了分页，设置可供选择的页面数据条数。
			设置为All 则显示所有记录。*/
		pageList: [5, 10, 25, 50, 100, 'All'], 
		showPaginationSwitch: true,//[false] 是否显示数据条数(分页显示) 选择框
		
		
		/*****************************【搜索】*****************************************************/
		search: true,//[false]是否启用搜索框
		searchOnEnterKey: true,//[false] 设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
		//searchText: "哈哈",//[''] 初始化搜索文字
		
		/*****************************【下拉框】*****************************************************/
		showColumns: true,//[false]是否显示 内容列下拉框
	
		/*****************************【其它按钮】*****************************************************/
		showRefresh: true,//[false]是否显示 刷新按钮
		
		
		/*****************************【事件】*****************************************************/
		
		//编辑表格
		onEditableSave: function (field, row, oldValue, $el) {
			var url = "userinfoUpdate.do";
			console.log(row);
			var param = {
				id : row.id
			};
			if(field == "account") {
				param.account = row.account;
			}else if(field == "realname") {
				param.realname = row.realname;
			}
			
			//发送ajax请求
			$.post(url, param, function(){
				alert("修改成功");
			});
		},
		
		aa:""
	});
});


function sexFormatter(value, row, index){
	if(value == "0") {
		return "女";
	}else if(value == "1") {
		return "男";
	}else {
		return "";
	}
}

function statFormatter(value, row, index){
	var v;
	if(value == '0') {
		v = "冻结";
	}else if(value == '1') {
		v = "正常";
	}
	
	return v;
}


//行样式 row: 行数据  index: 行下标
function rowStyle(row,index){
	var classes = ['active', 'success', 'info', 'warning', 'danger'];
	
	if(row.account == "liuchen") {
		return {
		  	css: {'color' :'blue'},
	  		classes : classes[4]
		}
	}else{
		return {}; 
	}
}

function statStyle(value, row, index, field) {
	var classes = ['active', 'success', 'info', 'warning', 'danger'];
	if(value == '0') {
		 return {
			 css: {'color' :'red'}
		     //classes: classes[4]
		}; 
	}else{
		return {};
	}
}

function operateFormatter(){
	//按钮的几种颜色:  btn-default 白,  btn-primary 蓝，  btn-success 绿  
	// 					btn-info 浅蓝， btn-warning 橘黄 btn-danger 红  btn-link 连接
	//按钮的大小： .btn-lg btn-sm btn-xs
    var s = [
        '<button class="like btn-default btn btn-xs glyphicon glyphicon-info-sign" title="测试"></button>',
        ' <button class="edit btn-default btn btn-xs  glyphicon glyphicon-edit"  title="编辑"></button>',
        ' <button class="remove btn-default btn btn-xs glyphicon glyphicon-remove" title="删除"></button>'
    ];
    
    return s.join('');
}

//操作事件
window.operateEvents = {
    'click .like': function (e, value, row, index) {
    	//location.href="del.do?id=" +row.id; 
        //alert('You click like action, row: ' + JSON.stringify(row));
    },
    'click .edit': function (e, value, row, index) {
      //  alert('You click like action, row: ' + JSON.stringify(row));
        
        console.log(row);
        
        //js方式跳转
        //location.href="UserinfoUpdateShow.do?id=" + row.id;
        
        layer.open({
		  type: 2,
		  title: "修改员工",
		  shadeClose: true,
		  skin: 'layui-layer-lan', //样式类名 layui-layer-lan layui-layer-molv
		  shade: 0.7,
		  area: ['80%', '90%'],
		  content: "UserinfoUpdateShow.do?id=" + row.id //iframe的url
		}); 
        
        
        /*
        layer.open({
        	  type: 2,
        	  title: false,
        	  //closeBtn: 0, //不显示关闭按钮
        	  shade: 0.8,
        	  area: ['800px', '515px'],
        	  anim: 2,
        	  content: ["UserinfoUpdateShow.do?id=" + row.id], //iframe的url，no代表不显示滚动条 , 'no'
        });
        */
    },
    'click .remove': function (e, value, row, index) {
    	var index = layer.msg("您确定删除么？", {
    		btn:['确定','取消'],
    		yes : function(){
    			/* $table.bootstrapTable('remove', {
    	            field: 'id',
    	            values: [row.id]
    	        }); */
    			
    			
    			refreshTable();
    			
    			layer.close(index);
    		}
    	});
    	
    	
    }
};


//刷新表格
function refreshTable(){
	$table.bootstrapTable('refresh');
}

</script>
</body>
</html>