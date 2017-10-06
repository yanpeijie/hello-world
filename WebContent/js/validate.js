$(function(){
	$("form.validate input").keyup(function(){
		validateElement($(this));
	}).blur(function(){
		validateElement($(this));
	});
});

//验证表单
function validateForm(myform){
	var flag = true;
	$(myform).find("input").each(function(){
		if(!validateElement($(this))){
			flag = false;
		}
	});
	return flag;
}

/**
 * 验证表单控件
 * */
function validateElement($element){
	//必填项
	if($element.hasClass("required")){
		if($.trim($element.val()) != ""){//过验证，移除错误信息
			removeError($element,"required");
		}else {//没通过验证,设置错误信息
			addError($element, "必填字段", "required");
			return false;
		}
	}
	
	//无输入，不验证
	if($.trim($element.val()) == "") {
		removeError($element,"all");
		return true;
	}
	
	//邮箱
	if($element.hasClass("email")){
		if(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test($element.val())){
			removeError($element, "email");
		}else {
			addError($element,"请输入正确格式的电子邮件", "email");
			return false;
		}
	}
	
	//浮点数
	if($element.hasClass("number")){
		if(/^-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/.test($element.val())){
			removeError($element, "number");
		}else {
			addError($element,"请输入合法的数字", "number");
			return false;
		}
	}
	
	//网址
	if($element.hasClass("url")){
		if(/^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test($element.val())){
			removeError($element, "url");
		}else {
			addError($element,"请输入合法的网址", "url");
			return false;
		}
	}
	
	//整数
	if($element.hasClass("digits")){
		if(/^\d+$/.test($element.val())){
			removeError($element, "digits");
		}else {
			addError($element,"只能输入整数", "digits");
			return false;
		}
	}
	
	//信用卡
	if($element.hasClass("creditcard")){
		
	}
	
	//最小长度
	if($element.attr("minlength")){
		
		//又有最大长度
		if($element.attr("maxlength") != -1){
			if($element.val().length > $element.attr("maxlength") || $element.val().length < $element.attr("minlength")){
				addError($element,"长度介于 " + $element.attr("minlength") + " 和 " + $element.attr("maxlength") + "之间的字符串", "minmaxlength");
				return false;
			}else {
				removeError($element, "minmaxlength");
				
			}
		}
		
		//只有最小长度
		if($element.val().length >= $element.attr("minlength")){
			removeError($element, "minlength");
		}else {
			addError($element,"长度最少是 " + $element.attr("minlength") + "的字符串", "minlength");
			return false;
			
		}
	}
	
	//最小值
	if($element.attr("min")){
		//又有最大值
		if($element.attr("max")){
			if(($element.val() <= Number($element.attr("max")) && $element.val() >= Number($element.attr("min")) )){ 
				removeError($element, "minmax");
			}else {
				addError($element,"请输入介于 " + $element.attr("min") + " 和 " + $element.attr("max") + "之间的值", "minmax");
				return false;
			}
		}
		
		//只有最小值
		if($element.val() >= Number($element.attr("min"))){ 
			removeError($element, "min");
		}else {
			addError($element,"请输入不小于 " + $element.attr("min") + "的值", "min");
			return false;
		}
	}
	
	//最大值
	if($element.attr("max")){
		if($element.val() <= Number($element.attr("max"))){ 
			removeError($element, "max");
		}else {
			addError($element,"请输入不大于 " + $element.attr("max") + "的值", "max");
			return false;
		}
	}
	
	//字母、数字、下划线
	if($element.hasClass("alphanumeric")){
		if(/^\w+$/i.test($element.val())){
			removeError($element, "alphanumeric");
		}else {
			addError($element,"只能输入字母、数字、下划线", "alphanumeric");
			return false;
		}
	}
	
	//字母
	if($element.hasClass("lettersonly")){
		if(/^[a-z]+$/i.test($element.val())){
			removeError($element, "lettersonly");
		}else {
			addError($element,"只能输入字母", "lettersonly");
			return false;
		}
	}
	
	//电话
	if($element.hasClass("phone")){
		if(/^[0-9 \(\)]{7,30}$/.test($element.val())){
			removeError($element, "phone");
		}else {
			addError($element,"请输入正确的电话号", "phone");
			return false;
		}
	}
	
	return true;
}

/**
 * 添加错误信息
 * */
function addError($element, message, type){
	var $errorSpan = $element.next();
	if($errorSpan.hasClass("inputerror")){
		$errorSpan.html(message)
		.css("display","inline")
		.attr("errorType", type);
	}else {
		$element.after("<i class='inputerror' errorType='" + type + "'>" +  message + "</i>");
	}
}

/**
 * 移除错误信息
 * */
function removeError($element, type){
	var $errorSpan = $element.next();
	if($errorSpan.hasClass("inputerror") && ($errorSpan.attr("errorType") == type || type == "all")){
		$errorSpan.css("display","none");
	}
}