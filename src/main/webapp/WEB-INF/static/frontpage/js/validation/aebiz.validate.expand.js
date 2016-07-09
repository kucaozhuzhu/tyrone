jQuery.validator.addMethod("isZipCode", function(value, element) {  
    var tel = /^[0-9]{6}$/;
    return this.optional(element) || (tel.test(value));
}, "请正确填写您的邮政编码");

jQuery.validator.addMethod("mobilezh", function(value, element) {
    var mobile = /^1\d{10}$/;
    return this.optional(element) || (mobile.test(value));
}, "请正确填写您的手机号");

jQuery.validator.addMethod("loginname", function(value, element) {  
    var loginname =/^[\w\.\_]{4,20}$/;    
    return this.optional(element) || (loginname.test(value));
}, "请输入4-20位字符(数字、字母、.、_)");
jQuery.validator.addMethod("positivenum", function(value, element) {  
    var positivenum = /^(0|[1-9]\d*)$/;
    return this.optional(element) || (positivenum.test(value));
}, "请输入非负整数");

jQuery.validator.addMethod("storeDomain", function(value, element) {  
	var storeDomain =/^[a-z0-9]{2,15}$/;    
	return this.optional(element) || (storeDomain.test(value));
}, "请输入2-15位字符(数字、字母)");

jQuery.validator.addMethod("float", function(value, element) {  
	var float =/^[0-9]+([.]{1}[0-9]+){0,1}$/;    
	return this.optional(element) || (float.test(value));
}, "请输入正数");

jQuery.validator.addMethod("phone", function(value, element) {  
	var phone =/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/; 
	return this.optional(element) || (phone.test(value));
}, "请输入正确的电话号");

jQuery.validator.addMethod("fax", function(value, element) {  
	var fax =/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/; 
	return this.optional(element) || (fax.test(value));
}, "请输入正确的传真号");

jQuery.validator.addMethod("isPrice", function(value, element) {  
	var storeDomain =/^[0-9]+([.]{1}[0-9]{0,2}){0,1}$/;    
	return this.optional(element) || (storeDomain.test(value));
}, "请输入正确的价格");

jQuery.validator.addMethod("nonnegativenum", function(value, element) {  
    var nonnegativenum = /^(([1-9]\d*)|0)(\.\d{0,2})?$/;
    return this.optional(element) || (nonnegativenum.test(value));
}, "请输入最多2位小数的非负数");
jQuery.validator.addMethod("integernum", function(value, element) {  
    var integernum = /^[1-9]\d*$/;
    return this.optional(element) || (integernum.test(value));
}, "请输入正整数");

jQuery.validator.addMethod("isEnglish", function(value, element) {  
	var storeDomain =/^[a-zA-Z]+$/;    
	return this.optional(element) || (storeDomain.test(value));
}, "请输入英文字母");

jQuery.validator.addMethod("productNo", function(value, element) {  
	var storeDomain =/^[a-zA-Z0-9]+$/;    
	return this.optional(element) || (storeDomain.test(value));
}, "请输入正确的商品编号");

jQuery.validator.addMethod("invoiceNo", function(value, element) {  
	var storeDomain =/^[a-zA-Z0-9]+$/;    
	return this.optional(element) || (storeDomain.test(value));
}, "请输入正确的发票编号");
jQuery.validator.addMethod("mobileOrPhone", function(value, element) {  
    var mobile = /^1\d{10}$/;
    var phone = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/; 
    return this.optional(element) || (mobile.test(value)) || (phone.test(value));
}, "请填写正确的手机号或电话号码");
jQuery.validator.addMethod("phoneEmpty", function(value, element) {  
    var mobile = $.trim($("input[name='mobile']").val());
    var telephone = $.trim($("input[name='telephone']").val());
    return isNotEmpty(mobile) || isNotEmpty(telephone);
	}, "手机号、电话号码必填一项");

jQuery.validator.addMethod("checkIdCard", function(value, element) { 
	var isCard = true;
	if (value.length == 15) {   
		if(!isValidityBrithBy15IdCard(value)){
			isCard = false; 
		}
	} else if (value.length == 18) {   
		var a_idCard = value.split("");// 得到身份证数组   
		if(!isValidityBrithBy18IdCard(value) || !isTrueValidateCodeBy18IdCard(a_idCard)){ 
			isCard = false; 
		}   
	} else {   
		isCard = false; 
	}
    return this.optional(element) || isCard;
}, "请输入正确的身份证号");

//验证身份证
var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];// 加权因子   
var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];// 身份证验证位值.10代表X   

/**  
 * 判断身份证号码为18位时最后的验证位是否正确  
 * @param a_idCard 身份证号码数组  
 * @return  
 */  
function isTrueValidateCodeBy18IdCard(a_idCard) {   
	var sum = 0; // 声明加权求和变量   
	if (a_idCard[17].toLowerCase() == 'x') {   
		a_idCard[17] = 10;// 将最后位为x的验证码替换为10方便后续操作   
	}   
	for ( var i = 0; i < 17; i++) {   
		sum += Wi[i] * a_idCard[i];// 加权求和   
	}   
	valCodePosition = sum % 11;// 得到验证码所位置   
	if (a_idCard[17] == ValideCode[valCodePosition]) {   
		return true;   
	} else {   
		return false;   
	}   
}


 /**  
  * 验证18位数身份证号码中的生日是否是有效生日  
  * @param idCard 18位书身份证字符串  
  * @return  
  */  
function isValidityBrithBy18IdCard(idCard18){   
	var year =  idCard18.substring(6,10);   
	var month = idCard18.substring(10,12);   
	var day = idCard18.substring(12,14);   
	var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
	// 这里用getFullYear()获取年份，避免千年虫问题   
	if(temp_date.getFullYear()!=parseFloat(year)   
		  ||temp_date.getMonth()!=parseFloat(month)-1   
		  ||temp_date.getDate()!=parseFloat(day)){   
			return false;   
	}else{   
		return true;   
	}   
}   
  /**  
   * 验证15位数身份证号码中的生日是否是有效生日  
   * @param idCard15 15位书身份证字符串  
   * @return  
   */  
  function isValidityBrithBy15IdCard(idCard15){   
	  var year =  idCard15.substring(6,8);   
	  var month = idCard15.substring(8,10);   
	  var day = idCard15.substring(10,12);   
	  var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
	  // 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法   
	  if(temp_date.getYear()!=parseFloat(year)   
			  ||temp_date.getMonth()!=parseFloat(month)-1   
			  ||temp_date.getDate()!=parseFloat(day)){   
				return false;   
		}else{   
			return true;   
		}   
  }   
//去掉字符串头尾空格   
function trim(str) {   
	return str.replace(/(^\s*)|(\s*$)/g, "");   
}
function isNotEmpty(strVal) {
	if (strVal == '' || strVal == null || strVal == undefined) {
		return false;
	} else {
		return true;
	}
}