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

jQuery.validator.addMethod("isPrice", function(value, element) {  
	var storeDomain =/^(?!0+(?:\.0+)?$)\d+(?:\.\d{1,2})?$/;    
	return this.optional(element) || (storeDomain.test(value));
}, "请输入正确的价格");

jQuery.validator.addMethod("storeDomain", function(value, element) {  
	var storeDomain =/^[a-z0-9]{2,15}$/;    
	return this.optional(element) || (storeDomain.test(value));
}, "请输入2-15位字符(数字、字母)");
jQuery.validator.addMethod("integernum", function(value, element) {  
    var integernum = /^[1-9]\d*$/;
    return this.optional(element) || (integernum.test(value));
}, "请输入正整数");
jQuery.validator.addMethod("float", function(value, element) {  
	var float =/^[0-9]+([.]{1}[0-9]+){0,1}$/;    
	return this.optional(element) || (float.test(value));
}, "请输入小数");
jQuery.validator.addMethod("nonnegativenum", function(value, element) {  
    var nonnegativenum = /^(([1-9]\d*)|0)(\.\d{0,2})?$/;
    return this.optional(element) || (nonnegativenum.test(value));
}, "请输入最多2位小数的非负数");

jQuery.validator.addMethod("enBrand", function(value, element) {  
    var loginname =/^[\w\.\_]{2,50}$/;    
    return this.optional(element) || (loginname.test(value));
}, "请输入2-50位字符(数字、字母、.和_)");

jQuery.validator.addMethod("isEnglish", function(value, element) {  
	var storeDomain =/^[a-zA-Z]+$/;    
	return this.optional(element) || (storeDomain.test(value));
}, "请输入英文字母");
jQuery.validator.addMethod("mobileOrPhone", function(value, element) {  
    var mobile = /^1\d{10}$/;
    var phone = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/; 
    return this.optional(element) || (mobile.test(value)) || (phone.test(value));
}, "请填写正确的手机号或电话号码");
jQuery.validator.addMethod("numberGE100", function(value, element) { 
	var backPercent =/^(([1-9]\d*)|0)(\.\d{0,2})?$/;
    return this.optional(element) || ((backPercent.test(value)) && (value　>0 && value <= 100));
}, "请输入大于0并且不大于100的数字");
jQuery.validator.addMethod("LtTo", function(value, element,params) { 
		var end = $(params).val();
    return this.optional(element) || (parseFloat(value) <= parseFloat(end));
}, "请输入不大于后面数字的值。");
jQuery.validator.addMethod("LtShopPrice", function(value, element,params) { 
	var end = $(params).val();
return this.optional(element) || (parseFloat(value) <= parseFloat(end));
}, "请输入不大于零售价的值。");
jQuery.validator.addMethod("LtDealerPrice", function(value, element,params) { 
	var end = $(params).val();
return this.optional(element) || (parseFloat(value) <= parseFloat(end));
}, "请输入不大于门店采购价的值。");
jQuery.validator.addMethod("LtListPrice", function(value, element,params) { 
	var end = $(params).val();
return this.optional(element) || (parseFloat(value) <= parseFloat(end));
}, "请输入不大于市场价的值。");
jQuery.validator.addMethod("LtEndTime", function(value, element,params) { 
	var end = $(params).val();
return this.optional(element) || (value < end);
}, "开始时间必须小于结束时间");
jQuery.validator.addMethod("GtStartTime", function(value, element,params) { 
	var end = $(params).val();
return this.optional(element) || (value > end);
}, "结束时间必须大于开始时间");
jQuery.validator.addMethod("notChinese", function(value, element) {
	var patrn=/[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/gi
	return this.optional(element) || !patrn.exec(value);
}, "请不要输入中文。");
