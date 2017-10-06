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
	
	<style type="">
		.forminfo li i.aa {
		    color:red;
		}
	</style>
</head>

<body>


<form action="" method="post" id="myform">
	<input type="hidden" id="id" name="id"  value="${ u.id}"/>
	
	<div class="formbody">
		<div class="formtitle"><span>修改员工</span></div>
		<ul class="forminfo">
			<li>
				<label>账号  </label>
				<input id="account" name="account" type="text" class="dfinput" value="${u.account }"/>
			</li>
			<li>
				<label>真实姓名</label>
				<input id="realname" name="realname" type="text" class="dfinput" value="${u.realname }"/>
			</li>
			<li>
				<label>性别   </label>
				<cite> 
					<input name="sex" type="radio" value="1"/>男&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="sex" type="radio" value="0"/>女
				</cite>
			</li>
			<li>
				<label>部门   </label>
				<select id="dept" name="dept">
					<c:forEach items="${deptList }" var="d">
					<option value="${d.id }">${d.d_name }</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<label>&nbsp;</label>
				<input  name="" type="submit" class="btn" value="确认保存"/>
			</li>
		</ul>
	</div>
</form>


<script type="text/javascript" src="<%=basePath %>plugins/jquery/jquery.min.js"></script>
<!-- 弹出框 -->
<script src="plugins/layer/layer.js"></script>
<!-- 验证 -->
<script src="plugins/validate/jquery.validate.min.js"></script>
<script src="plugins/validate/messages_zh.js"></script>

<script type="text/javascript">

$(function(){
	//性别回显
	$(":radio[name='sex']").val(["${u.sex }"]);
	//部门回显
	$("#dept").val("${u.dept_id }");
	
	
	$("#myform").validate({
		errorClass: "aa",
		rules:{
			account: {
				required : true,
				maxlength:10
			} 
		},
		
		messages:{
			account : {
				required:"请输入账号",
				maxlength:"账号最多两位字符"
			}
		},
		
		
		//*****************指定使用什么标签标记错误。******************
	    errorElement: "i",
		
		submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
            alert("提交表单");   
            //form.submit();   //提交表单   
            
            edit();
        }
	});
	
	/*
	$("#btn").click(function(){
		edit();
	});
	*/
});


function edit() {
	//获取参数
	var param = {
		id : $("#id").val(),
		account : $("#account").val(),
		realname : $("#realname").val(),
		sex : $(":radio[name='sex']:checked").val(),
		dept: $("#dept").val()
	};
	
	
	$.post("userinfoUpdate.do", param, function(){
		parent.layer.msg("修改成功");
		parent.ShxtTable.refresh();
		//关闭当前弹出窗口
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭  
		
		
	});
}

/*//当你在iframe页面关闭自身时
var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
parent.layer.close(index); //再执行关闭  */
</script>
</body>
</html>


