<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/validation/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/static/customermgr/usercenter/aebiz.validate.expand.js"></script>
<div class="modal-dialog modal-760" id="addDiv">
	<div class="modal-content">
		<form id="addForm" class="form-horizontal y_setpassd form-validate" action="${pageContext.servletContext.contextPath}/usercenter/customeraddress/addAddress" method="post">
			<input type="hidden" name="customerUuid" value="${webModel.customerUuid}">
			<input type="hidden" name="area">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3><aebiz:showTitle titleId="ucenter_deliveryAddress_add"/></h3>
			</div>
			
			<div class="modal-body">
				<div class="form-group">
					<label for="consignee" class="col-mi-2 control-label">
						<span class="text2-color">*</span>
						<aebiz:showTitle titleId="ucenter_deliveryAddress_consignee"/>:
					</label>
					<div class="col-mi-4">
						<input type="text" name="consignee" class="form-control" >
					</div>
				</div>
				
				<div class="form-group y_addresarea">
					<label for="province" class="col-mi-2 control-label">
						<span class="text2-color">*</span>
						<aebiz:showTitle titleId="ucenter_deliveryAddress_area"/>:
					</label>
					
					<div class="col-mi-10 ku_col">
						<aebiz:myarea checkProvince="" checkCity="" checkRegion="" checkStreet=""></aebiz:myarea>
					</div>
				</div>
				
				<div class="form-group">
					<label for="address" class="col-mi-2 control-label">
						<span class="text2-color">*</span>
						<aebiz:showTitle titleId="ucenter_deliveryAddress_detailAddress"/>:
					</label>
					<div class="y_areashow"></div>
					<div class="col-mi-6">
						<input type="text" name="address" class="form-control" >
					</div>
				</div>
				
				<div class="form-group">
					<label for="mobile" class="col-mi-2 control-label">
						<span class="text2-color">*</span>
						<aebiz:showTitle titleId="ucenter_deliveryAddress_mobile"/>:
					</label>
					
					<div class="col-mi-4">
						<input type="text" name="mobile" class="form-control mobilezh phoneEmpty" maxlength="11" placeholder="手机号、电话号码必填一项" >
					</div>
					
					<p class="fl control-label ku_label">
						<aebiz:showTitle titleId="ucenter_deliveryAddress_or"/> 
						<aebiz:showTitle titleId="ucenter_deliveryAddress_phone"/>
					</p>
					
					<div class="col-mi-4">
						<input type="text" name="telephone" class="form-control telephone" maxlength="13" placeholder="区号-电话号码" >
					</div>
				</div>
				
				
				<div class="form-group">
					<label for="identityCard" class="col-mi-2 control-label">
						身份证号:
					</label>
					
					<div class="col-mi-4">
						<input type="text" name="identityCard" class="form-control" >
						<input type="hidden" id="identityCardError" value="true" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="zipcode" class="col-mi-2 control-label">
						<aebiz:showTitle titleId="ucenter_deliveryAddress_zipcode"/>:
					</label>
					
					<div class="col-mi-4">
						<input type="text" name="zipcode" class="form-control isZipCode" >
					</div>
				</div>
				
				<div class="form-group">
					<label for="alias" class="col-mi-2 control-label">
						<aebiz:showTitle titleId="ucenter_deliveryAddress_alias"/>:
					</label>
					
					<div class="col-mi-4">
						<input type="text" name="alias" class="form-control" >
					</div>
					
					<p class="fl control-label text-999 ku_control"><aebiz:showTitle titleId="ucenter_deliveryAddress_aliasTip"/></p>
				</div>
				
				<div class="form-group">
					<div class="col-mi-offset-2 col-mi-10">
						<div class="simple-checkbox">
							<input type="checkbox" id="isDefault" name="isDefault" value="1">
							<label for="isDefault"><aebiz:showTitle titleId="ucenter_deliveryAddress_setDefault"/></label>
						</div>	
					</div>
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary"><aebiz:showTitle titleId="basebusiness.showmessage.save"/></button>
			</div>
		</form>
	</div>
</div>

<script>
	/*验证身份证是否可用*/
	$('input[name="identityCard"]').blur(function() {
		//每次都把span的内容清空
		$("span[name='namespan']").remove();
		var identityCard = "";
		identityCard = $("input[name='identityCard']").val();
		if (identityCard != '') {
			var len = parseInt(identityCard.length);
			var idCode1 = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/;
			var idCode2 = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
			var officerCode = /^\d{8}$/;
			if (idCode1.test(identityCard)||idCode2.test(identityCard)||idCode2.test(identityCard)) {
							$('input[name="identityCard"]').after("<span  name='namespan'><font color='green'>身份证号可以使用</font></span>");
							$("#identityCardError").val("true");
			} else {
				$("input[name='identityCard']").after("<span name='namespan'><font color='red'>请输入正确的身份证号</font></span>");
				$("#identityCardError").val("false");
			}
			}else{
				$("#identityCardError").val("true");
				$("span[name='namespan']").remove();
			} 
	});
	
	
function isNotEmpty(strVal) {
	if (strVal == '' || strVal == null || strVal == undefined) {
		return false;
	} else {
		return true;
	}
}

$(function(){
	jQuery.validator.addMethod("phoneEmpty", function(value, element) {  
	    var mobile = $.trim($("input[name='mobile']").val());
	    var telephone = $.trim($("input[name='telephone']").val());
	    return isNotEmpty(mobile) || isNotEmpty(telephone);
	}, "手机号、电话号码必填一项");
	
	 $("#addForm").validate({
	        rules: {
	  		 	consignee: {
					required : true,
					maxlength: 10
				},
				address:{
					required : true,
					maxlength: 40
				},
				province :{
					required : true
				},
				city :{
					required : true
				},
				region :{
					required : true
				},
				zipcode :{
					required : true
				},
				alias:{
					maxlength: 10
				}
	  		},
	        messages: {
	   			consignee: {
					required : "请输入收件人姓名",
					maxlength: "姓名长度不超过10个字符"
				},
				address:{
					required : "请输入详细收货地址",
					maxlength: jQuery.format("收货地址长度不能超过{0}个字符")
				},
				province :{
					required : "请选择省"
				},
				city :{
					required : "请选择市"
				},
				region :{
					required : "请选择区/县"
				},
				zipcode :{
					required : "请输入邮政编码"
				},
				alias:{
					maxlength: jQuery.format("地址别名不能超过{0}个字符")
				}
	  		},
	
	 		errorElement: 'span',  //输入错误时的提示标签
     		errorClass: 'help-block has-error',  //输入错误时的提示标签类名
	 		errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
	            element.after(error);
     		},
     		
		    highlight: function(label) {   //输入错误时执行的事件
		        $(label).closest('.form-group').removeClass('has-error has-success').addClass('has-error');
		    },
     
     		success: function(label) {   //输入正确时执行的事件
         		label.addClass('valid').closest('.form-group').removeClass('has-error has-success').addClass('has-success');
     		},
	
			onkeyup: function(element) {   //验证元素输入值时按钮松开执行的事件
        		$(element).valid();
    		},
    		
    		onfocusout: function(element) {   //验证元素失去焦点时进行验证
       	 		$(element).valid();
    		},
    		submitHandler:function(form){
        		debugger;
        		var province = $.trim($("#provinceId option:selected").text());
        		var city = $.trim($("#cityId option:selected").text());
        		var region = $.trim($("#regionId option:selected").text());
        		$("input[name='area']:hidden").val(province+city+region);
	          if($("#identityCardError").val()=="true"){  
							form.submit();
						}
	        }  
	 });
});
</script>
