var UserinfoList = function(){
	return {
		init: function(){
			ShxtTable.init($("#table"),{
				url: "UserinfoList.do",
				rowStyle:UserinfoList.rowStyle,//行样式
				sortName: "age",	//[undefined] 定义排序列,通过url方式获取数据填写字段名，否则填写下标
				
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
		},
		sexFormatter: function (value, row, index){
			if(value == "0") {
				return "女";
			}else if(value == "1") {
				return "男";
			}else {
				return "";
			}
		},
		statFormatter:function (value, row, index){
			var v;
			if(value == '0') {
				v = "冻结";
			}else if(value == '1') {
				v = "正常";
			}
			
			return v;
		},
		
		//行样式 row: 行数据  index: 行下标
		rowStyle: function (row,index){
			var classes = ['active', 'success', 'info', 'warning', 'danger'];
			
			if(row.account == "liuchen") {
				return {
				  	css: {'color' :'blue'},
			  		classes : classes[4]
				}
			}else{
				return {}; 
			}
		},
		
		statStyle: function (value, row, index, field) {
			var classes = ['active', 'success', 'info', 'warning', 'danger'];
			if(value == '0') {
				 return {
					 css: {'color' :'red'}
				     //classes: classes[4]
				}; 
			}else{
				return {};
			}
		},
		
		operateFormatter: function (){
			//按钮的几种颜色:  btn-default 白,  btn-primary 蓝，  btn-success 绿  
			// 					btn-info 浅蓝， btn-warning 橘黄 btn-danger 红  btn-link 连接
			//按钮的大小： .btn-lg btn-sm btn-xs
		    var s = [
		        '<button class="like btn-default btn btn-xs glyphicon glyphicon-info-sign" title="测试"></button>',
		        ' <button class="edit btn-default btn btn-xs  glyphicon glyphicon-edit"  title="编辑"></button>',
		        ' <button class="remove btn-default btn btn-xs glyphicon glyphicon-remove" title="删除"></button>'
		    ];
		    
		    return s.join('');
		},
		
		operateEvents: {
			'click .like': function (e, value, row, index) {
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
		
	};
}();