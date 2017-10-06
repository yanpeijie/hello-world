var ShxtTable = function(){
	var $table;
	return {
		init:function($t, o){
			$table = $t;
			
			/******************************【基本】****************************************************/
			//[true] 设置为 true 会有隔行变色效果
			if(o.striped == undefined) o.striped = true;
			
			//[undefined] 定义表格的高度。
			//if(o.height == undefined) o.height = "350";
			
			/******************************【数据请求】****************************************************/
			
			//['get']服务器数据的请求方式 'get' or 'post'
			if(o.method == undefined) o.method = "post";
			
			//['application/json']发送到服务器的数据编码类型
			if(o.contentType == undefined) o.contentType = "application/x-www-form-urlencoded; charset=UTF-8";
			
			
			/*****************************【显示】*****************************************************/
			//['-'] 当数据为 undefined 时显示的字符
			if(o.undefinedText == undefined) o.undefinedText = "";
			
			
			/*****************************【单选多选按钮】*****************************************************/
			//['btSelectItem'] radio or checkbox 的字段名
			if(o.selectItemName == undefined) o.selectItemName = "id";
			
			//[false] 设置true 将在点击行时，自动选择rediobox 和 checkbox
			if(o.clickToSelect == undefined) o.clickToSelect = true;
			
			
			/****************************【排序】******************************************************/
			//['asc'] 定义排序方式 'asc' 或者 'desc'
			if(o.sortOrder == undefined) o.sortOrder = "desc";
			
			
			/****************************【分页】******************************************************/
			//[false] 设置为 true 会在表格底部显示分页条
			if(o.pagination == undefined) o.pagination = true;
			
			/*//['server']设置在哪里进行分页，可选值为 'client' 或者 'server'。设置 'server'时，
			必须设置 服务器数据地址（url）或者重写ajax方*/
			if(o.sidePagination == undefined) o.sidePagination = "server";
			
			//[10] 如果设置了分页，页面数据条数
			if(o.pageSize == undefined) o.pageSize = 5;
			
			/*Array [10, 25, 50, 100, All]如果设置了分页，设置可供选择的页面数据条数。
			设置为All 则显示所有记录。*/
			if(o.pageList == undefined) o.pageList = [5, 10, 25, 50, 100, 'All'];
			
			//[false] 是否显示数据条数(分页显示) 选择框
			if(o.showPaginationSwitch == undefined) o.showPaginationSwitch = true;
			
			/*****************************【搜索】*****************************************************/
			//[false]是否启用搜索框
			if(o.search == undefined) o.search = true;
			//[false] 设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
			if(o.searchOnEnterKey == undefined) o.searchOnEnterKey = true;
			
			/*****************************【下拉框】*****************************************************/
			//[false]是否显示 内容列下拉框
			if(o.showColumns == undefined) o.showColumns = true;
			
			/*****************************【其它按钮】*****************************************************/
			//[false]是否显示 刷新按钮
			if(o.showRefresh == undefined) o.showRefresh = true;
			
			$table.bootstrapTable(o);
		},
		
		refresh: function(){
			$table.bootstrapTable('refresh');
		}
		
	};
}();