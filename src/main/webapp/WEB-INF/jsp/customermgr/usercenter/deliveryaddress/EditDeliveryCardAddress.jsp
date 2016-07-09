<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImportJs.jsp"%>
<script src="${pageContext.request.contextPath }/static/usercenter/js/king-elements.js"></script>
	<script src="${pageContext.request.contextPath }/static/usercenter/js/jQuery-shopping.js"></script>
<script src="${pageContext.request.contextPath }/static/usercenter/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath }/static/usercenter/js/validation/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/static/customermgr/usercenter/aebiz.validate.expand.js"></script>
<div class="modal-dialog modal-760" id="editDiv">
	<div class="modal-content">
		<form id="editForm" action="${pageContext.servletContext.contextPath}/usercenter/customeraddress/doCardEdit"  class="form-horizontal y_setpassd form-validate" method="post">
			<input type="hidden" name="uuid" value="${m.uuid}">
			<input type="hidden" name="index" value="${index}">
			<input type="hidden" name="orderMainUuid" id="orderMainUuid" value="${m.orderMainUuid }">
			<input type="hidden" name="regionName" value="${m.regionName }">
			<input type="hidden" name="area" value="">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3>编辑配送地址</h3>
			</div>
			
			<div class="modal-body">
				<div class="form-group">
					<label for="consignee" class="col-mi-2 control-label"><span class="text2-color">
						*</span><aebiz:showTitle titleId="ucenter_deliveryAddress_consignee"/>:
					</label>
					<div class="col-mi-4">
						<input type="text" name="name" value="${m.name}" class="form-control"/>
					</div>
				</div>
				
				<div class="form-group y_addresarea">
					<label for="province" class="col-mi-2 control-label">
						<span class="text2-color">*</span>
						<aebiz:showTitle titleId="ucenter_deliveryAddress_area"/>:
					</label>
					
					<div class="col-mi-10">
						<aebiz:deliveryAddress checkProvince="${m.province}" checkCity="${m.city}" checkRegion="${m.region}"></aebiz:deliveryAddress>
					</div>
				</div>
				
				<div class="form-group">
					<label for="address" class="col-mi-2 control-label">
						<span class="text2-color">*</span> 
						<aebiz:showTitle titleId="ucenter_deliveryAddress_detailAddress"/>:
					</label>
					
					<div class="y_areashow"></div>
					
					<div class="col-mi-6">
						<input type="text" name="address" value="${m.address}" class="form-control"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="mobile" class="col-mi-2 control-label">
						<span class="text2-color">*</span> 
						<aebiz:showTitle titleId="ucenter_deliveryAddress_mobile"/>:
					</label>
					
					<div class="col-mi-4">
						<input type="text" name="mobile" value="${m.mobile}" class="form-control mobilezh phoneEmpty" maxlength="11" placeholder="手机号、电话号码必填一项"/>
					</div>
					
					<p class="fl control-label">
						<aebiz:showTitle titleId="ucenter_deliveryAddress_or"/> 
						<aebiz:showTitle titleId="ucenter_deliveryAddress_phone"/>
					</p>
					
					<div class="col-mi-4">
						<input type="text" name="tel" value="${m.tel}" class="form-control telephone" maxlength="13" placeholder="区号-电话号码"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="zipcode" class="col-mi-2 control-label">
						<aebiz:showTitle titleId="ucenter_deliveryAddress_zipcode"/>:
					</label>
					
					<div class="col-mi-4">
						<input type="text" name="postCode" value="${m.postCode}" class="form-control isZipCode"/>
					</div>
				</div>
				
				<div class="form-group">
					<label for="zipcode" class="col-mi-2 control-label">
						地址别名:
					</label>
					
					<div class="col-mi-4">
						<input type="text" name="alias" value="${m.alias}" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label for="zipcode" class="col-mi-2 control-label">
						配送日期:
					</label>
					
					<div class="col-mi-4">
					<input class="form-control  datepicker" type="text" name="deliveryTime" value="${m.deliveryTime}" id="deliveryTime">
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
function isNotEmpty(strVal) {
	if (strVal == '' || strVal == null || strVal == undefined) {
		return false;
	} else {
		return true;
	}
}

$().ready(function() {
	jQuery.validator.addMethod("phoneEmpty", function(value, element) {  
	    var mobile = $.trim($("input[name='mobile']").val());
	    var telephone = $.trim($("input[name='telephone']").val());
	    return isNotEmpty(mobile) || isNotEmpty(telephone);
	}, "手机号、电话号码必填一项");
	
	 $("#editForm").validate({
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
				alias:{
					maxlength: 20
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
        		var province = $.trim($("#provinceId option:selected").text());
        		var city = $.trim($("#cityId option:selected").text());
        		var region = $.trim($("#regionId option:selected").text());
        		$("input[name='area']:hidden").val(province+city+region);
        		var nextDate = $.trim($("#deliveryTime").val()) ;
        		var uuid = $.trim($("#orderMainUuid").val()) ;
        		$.post("${pageContext.servletContext.contextPath}/usercenter/customeraddress/checkDate",{"orderuuid":uuid,"nextDate":nextDate,"ranNum":Math.random()},function(data){
        			if("time_noupdate" == data){
        				alert("现在已不允许修改下一次配送时间");
        				return ;
        			}else if("time_toolate" == data){
        				alert("您选择的配送时间太晚了");
        				return ;
        			}else if("time_tooEarly" == data){
        				alert("配送时间不能早于明日");
        				return ;
        			}else{
        				form.submit();
        			}
        		});
	        }  
	 });
});
</script>