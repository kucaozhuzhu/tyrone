<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!doctype html>
<html>

<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ include file="/WEB-INF/jsp/basebusiness/common/import/ListImport.jsp" %>
<%-- <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/icheck/all.css">
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/icheck/jquery.icheck.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.checkbox.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.validate.expand.js"></script>   --%>
</head>

<body>
	<div class="container-fluid">	
		<div class="page-header">
			<div class="pull-left">
				<h1><aebiz:showTitle titleId="customer.moduleName_CN"/><aebiz:showTitle titleId="basebusiness.showmessage.manager"/></h1>
			</div>
		</div>
		
		<div class="breadcrumbs">
			<ul>
				<li><span><aebiz:showTitle titleId="customer.menuOne"/></span><i class="fa fa-angle-right"></i></li>
				<li><span><aebiz:showTitle titleId="customer.menuTwo"/></span><i class="fa fa-angle-right"></i></li>							
				<li><span><aebiz:showTitle titleId="customer.moduleName_CN"/><aebiz:showTitle titleId="basebusiness.showmessage.manager"/></span></li>						
			</ul>				
		</div>				
			
		<div class="row">
			<div class="col-sm-12">
				<div class="box">
					<div class="box-content nopadding y_tableser">
						<div class="y_clear">
							<div class="form-inline table_formnew">
								<div class="form-group">
									<label class="control-label"><aebiz:showTitle titleId="customer.qmf.customerName"/>：</label>
									<input type="text" name="customerName" id="customerName" class="form-control">
									<input type="hidden" name="customerName_q" id="customerName_q" class="form-control" value="Like">
								</div>
								
							 	<div class="form-group">
							 		<label class="control-label"><aebiz:showTitle titleId="customer.m.mobile"/>：</label>
									<input type="text" name="mobile" id="mobile" class="form-control">
									<input type="hidden" name="mobile_q" id="mobile_q" value="Like">
								</div>
						
								 <div class="form-group">
								 	<label class="control-label"><aebiz:showTitle titleId="customer.m.email"/>：</label>
									<input type="text" name="email" id="email" class="form-control">
									<input type="hidden" name="email_q" id="email_q" value="Like">
								</div>

								<div class="form-group">
									<button class="btn btn-primary search" title="<aebiz:showTitle titleId="basebusiness.showmessage.query"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.query"/></button>
									<button class="btn" onclick="javascript:clearSearch();" title="<aebiz:showTitle titleId="basebusiness.showmessage.clear"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.clear"/></button>
								</div>
							</div>
							
							<!--<div class="y_tablebtn">
								<button class="btn" onclick="javascript:exports('');" title="<aebiz:showTitle titleId="basebusiness.showmessage.export"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.export"/></button>
								
								<a class="btn" href="${pageContext.servletContext.contextPath}/sysback/customer/toAdd" title="<aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/></a>
								<button class="btn" onclick="javascript:removes('');" title="<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.delete"/></button>
									
								<button class="btn" title="<aebiz:showTitle titleId="customer.m.import"/>" rel="tooltip"><aebiz:showTitle titleId="customer.m.import"/></button>
								<button class="btn" title="<aebiz:showTitle titleId="customer.m.export"/>" rel="tooltip"><aebiz:showTitle titleId="customer.m.export"/></button>
								
							</div> -->
						</div>
					
						<table class="table table-bordered table-hover table-nomargin table-striped dataTable dataTable-reorder">
							<thead>		
								<tr>
									<th class='with-checkbox'><input type="checkbox" name="check_all" id="check_all"></th>
									<th><aebiz:showTitle titleId="customer.m.customerName"/></th>
									<th><aebiz:showTitle titleId="customer.m.mobile"/></th>
									<th><aebiz:showTitle titleId="customer.m.email"/></th>
									<th><aebiz:showTitle titleId="customer.m.frozenState"/></th>
									<th><aebiz:showTitle titleId="customer.m.activeState"/></th>
									<th><aebiz:showTitle titleId="customer.m.createTime"/></th>
									<%-- <th><aebiz:showTitle titleId="customer.m.customerLevel"/></th> --%>
									<th class='hidden-480'><aebiz:showTitle titleId="basebusiness.showmessage.operate"/></th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>		
				</div>
			</div>	
		</div>
	</div>
	
	<!--高级搜索-->
	<div id="modal-user" class="modal fade y_highserch">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 id="user-infos"><aebiz:showTitle titleId="basebusiness.showmessage.seniorQuery"/></h4>
				</div>
				
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-6">
						 	<div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.customerName"/></label>
								<input type="text" name="customerName_s" id="customerName_s" class="form-control">
								<input type="hidden" name="customerName_q" id="customerName_q" value="Like">
							</div>
						</div>
						
						<div class="col-sm-6">
						 	<div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.mobile"/></label>
								<input type="text" name="mobile_s" id="mobile_s" class="form-control">
								<input type="hidden" name="mobile_q" id="mobile_q" value="EQ">
							</div>
						</div>
					</div>
						
					<div class="row">
						<div class="col-sm-6">
							 <div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.email"/></label>
								<input type="text" name="email_s" id="email_s" class="form-control">
								<input type="hidden" name="email_q" id="email_q" value="EQ">
							</div>
						</div>
					
						<div class="col-sm-6">
							 <div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.customerLevel"/></label>
								<select name="customerShopLevelUuid_s" id="customerShopLevelUuid_s" class='form-control'>								
									<option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</option>
									<c:forEach items="${levelList}" var="level">
										<option value="${level.uuid}">${level.levelName}</option>
									</c:forEach>											
								</select>
								<input type="hidden" name="customerShopLevelUuid_q" id="customerShopLevelUuid_q" value="EQ">
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.createTime"/></label>				
								<div class="y_twoiptbx y_clear">
									<div class="y_twoipt">
										<input type="text" name="createTime_s" id="createTime_s" class="form-control datepick" >
										<input type="hidden" name="createTime_q" id="createTime_q" value="GE">
									</div>
									<div class="y_twosp">-</div>
									<div class="y_twoipt">
										<input type="text" name="createTime2_s" id="createTime2_s" class="form-control datepick" >
										<input type="hidden" name="createTime2_q" id="createTime2_q" value="LT">							
									</div>
								</div>
							</div>
						</div>
					</div>
						
					<div class="row">
						<div class="col-sm-6">
							 <div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.frozenState"/></label>
								<select name="frozenState_s" id="frozenState_s" class='form-control'>
									<option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</option>
									<option value="1"><aebiz:showTitle titleId="customer.m.frozened"/></option>
									<option value="0"><aebiz:showTitle titleId="customer.m.unfrozened"/></option>
								</select>
								<input type="hidden" name="frozenState_q" id="frozenState_q" value="EQ">
							</div>
						</div>
						
						<div class="col-sm-6">
							 <div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.frozenType"/></label>
								<select name="frozenType_s" id="frozenType_s" class='form-control'>								
									<option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</option>
									<c:forEach items="${frozenTypeList}" var="dpp">	
										<option value="${dpp.name}" <c:if test="${m.frozenType==dpp.name}"> selected </c:if> >${dpp.value}</option>
									</c:forEach>											
								</select>
								<input type="hidden" name="frozenType_q" id="frozenType_q" value="EQ">
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6">
							 <div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.activeState"/></label>
								<select name="activeState_s" id="activeState_s" class='form-control'>
									<option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</option>
									<option value="1"><aebiz:showTitle titleId="customer.m.actived"/></option>
									<option value="0"><aebiz:showTitle titleId="customer.m.unactived"/></option>
								</select>
								<input type="hidden" name="activeState_q" id="activeState_q" value="EQ">
							</div>
						</div>
					
						<%-- <div class="col-sm-6">
							 <div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.authState"/></label>
								<select name="authState_s" id="authState_s" class='form-control'>
									<option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</option>
									<c:forEach items="${authStateList}" var="dpp">	
										<option value="${dpp.name}" <c:if test="${m.frozenType==dpp.name}"> selected </c:if> >${dpp.value}</option>
									</c:forEach>	
								</select>
								<input type="hidden" name="authState_q" id="authState_q" value="EQ">
							</div>
						</div> --%>
					</div>
				</div>	
																
				<div class="modal-footer">
					<button class="btn moresearch btn-primary" data-dismiss="modal"><aebiz:showTitle titleId="basebusiness.showmessage.query"/></button>
					<button class="btn clearMoreSearch" ><aebiz:showTitle titleId="basebusiness.showmessage.clear"/></button>
				</div>
			</div>
		</div>
	</div>
	<!--高级搜索-->
	
	<!-- 账户冻结  -->
	<div id="modal-frozen" class="modal fade y_highserch">
		<form id="frozenForm" action="" method="post" class='form-validate1'>
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 id="user-infos"><aebiz:showTitle titleId="customer.m.frozen"/></h4>
					</div>
					
					<div class="modal-body">
						<div class="form-group">
							<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.frozenType" /></label>
							<select id="frozenType" name="frozenType" class='form-control' data-rule-required="true">								
								<option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</option>
								<c:forEach items="${frozenTypeList}" var="dpp">	
									<option value="${dpp.name}" <c:if test="${m.frozenType==dpp.name}"> selected </c:if> >${dpp.value}</option>
								</c:forEach>											
							</select>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label"><aebiz:showTitle titleId="customerfrozenlog.m.note" /></label>
							<textarea id="frozenNote" name="frozenNote" rows="3" cols="" class="form-control" data-rule-required="true"  data-rule-minlength="2" data-rule-maxlength="150"></textarea>
						</div>
						
						<div class="modal-footer" style="text-align: right;">
							<input type="submit" class="btn frozen btn-primary" value='<aebiz:showTitle titleId="basebusiness.showmessage.confirm"/>'>
							<button class="btn" data-dismiss="modal">
								<aebiz:showTitle titleId="basebusiness.showmessage.cancel" />
							</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>	
	<!-- 账户冻结 -->
	
	<input type="hidden" id="customerUuid">
	
	<!-- 账户解冻  -->
	<div id="modal-unfrozen" class="modal fade y_highserch">
		<form id="unFrozenForm" action="" method="get" class='form-validate2'>
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 id="user-infos"><aebiz:showTitle titleId="customer.m.unfrozen"/></h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="textfield" class="control-label"><aebiz:showTitle titleId="customerfrozenlog.m.note" /></label>
							<textarea id="unFrozenNote" name="unFrozenNote" rows="3" cols="" class="form-control" data-rule-required="true" data-rule-maxlength="150"></textarea>
						</div>
						
						<div class="modal-footer" style="text-align: right;">
							<input type="submit" class="btn unFrozen btn-primary" value='<aebiz:showTitle titleId="basebusiness.showmessage.confirm"/>'>
							<button class="btn" data-dismiss="modal">
								<aebiz:showTitle titleId="basebusiness.showmessage.cancel" />
							</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>	
	<!-- 账户解冻 -->
	
	<!--重置密码  -->
	<div id="modal-resetPwd" class="modal fade y_highserch">
		<form id="resetPwdForm" action="" method="get" class='form-validate3'>
			<div class="modal-dialog r_resetpwdmodal">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 id="user-infos">
							<aebiz:showTitle titleId="customer.m.resetpassword"/>
						</h4>
					</div>
					
					<div class="modal-body">
						<div class="form-group y_clear">
							<div class="col-sm-10">
								<div class="y_validatainput y_clear mb_10">
									<div class="col-xs-6 check-line nopadding" id="oldMobileDiv">
										<input type="radio" id="oldmobile" name="mobile" class='icheck-me' data-skin="square" data-color="blue" value="0" checked/>
										<label class='inline' for="oldmobile" id="mobileLabel"><aebiz:showTitle titleId="customer.m.regmobile"/></label>
									</div>
									
									<div class="col-xs-6 check-line nopadding">
										<input type="radio" id="newmobile" name="mobile" class='icheck-me' data-skin="square" data-color="blue" value="1"/>
										<label class='inline' for="newmobile"><aebiz:showTitle titleId="customer.m.newmobile"/></label> 
									</div>
								</div>	
								<input type="hidden" id="customerMobile">				
								<input type="text"  id="confirmMobile" name="confirmMobile" class='form-control' disabled data-rule-required="true" maxlength="11" data-rule-mobilezh="true"/>
							</div>
						</div>
					</div>
					
					<div class="modal-footer">
						<input type="submit" class="btn resetPwd btn-primary" value='<aebiz:showTitle titleId="basebusiness.showmessage.confirm"/>'>
						<button class="btn" data-dismiss="modal" aria-hidden="true">
							<aebiz:showTitle titleId="basebusiness.showmessage.cancel" />
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!--重置密码  -->
	
	<!-- 发送礼包 -->
	<div id="modal-giftPackage" class="modal fade y_highserchs">
		<form id="giftPackageForm" action="${pageContext.servletContext.contextPath}/sysback/customer/sendGiftPackage" method="post" class='form-validate'>
			<input type="hidden" name="customerUuid">
			<input type="hidden" name="giftPackageUuid">
			
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 id="user-infos"><aebiz:showTitle titleId="customer.m.sendGiftPackage"/></h4>
					</div>
					
					<div class="modal-body">
						<div class="form-group">
							<label for="giftPackage" class="control-label col-sm-2" style="margin-top:5px">选择礼包</label>
							<div class="col-sm-10">
								<div class="col-sm-6">
									<select name="giftPackage" id="giftPackage" class='select2-me form-control'>
										<option id="0" value="">-请选择-</option>
										<c:forEach items="${giftPackageModels}" var="giftPackage" varStatus="index">
											<option id="${giftPackage.packageCount}" value="${giftPackage.uuid}">${giftPackage.packageName}</option>
										</c:forEach>
									</select>
									
								</div>
								<div class="col-sm-4">
									<div id="limitTip" class="y_sjjjd"></div>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="count" class="control-label col-sm-2" style="margin-top:5px">发送数量</label>
							<div class="col-sm-10">
								<div class="col-sm-12 y_saleleng">
									<a href="javascript:void(0);" onclick="javascript:reduce();">-</a>
										<input type="text" id="count" name="count" value="1" class="form-control">
									<a href="javascript:void(0);" onclick="javascript:add();">+</a>
									<div></div>
								</div>
							</div>
						</div>
					</div>	
																	
					<div class="modal-footer">
						<button class="btn sendGiftPackage btn-primary"><aebiz:showTitle titleId="basebusiness.showmessage.confirm"/></button>
						<button class="btn" data-dismiss="modal" aria-hidden="true">
							<aebiz:showTitle titleId="basebusiness.showmessage.cancel" />
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- 发送礼包 -->
	
<script>
jQuery.validator.addMethod("limitCount", function(value, element) {  
	var limitCount = parseInt($("#giftPackage").find("option:selected").attr("id"));
	if(limitCount==0){
		return true;
	}
	if(value > limitCount){
		return false;
	}else{
		return true;
	}
}, "不能超过剩余礼包数量");

//增加数量
function add(){
	var count=parseInt($("#count").val());
	var limitCount=parseInt($("#giftPackage").find("option:selected").attr("id"));
	if(isNaN(count)){
		$("#count").val(1);
		return;
	}
	if(limitCount==0){
		$("#count").val(count+1);
		return;
	}
	if(count+1 > limitCount){
		$("#count").val(limitCount);
	}else{
		$("#count").val(count+1);
	}
}
// 减去数量
function reduce(){
	var count=parseInt($("#count").val());
	if(isNaN(count)){
		$("#count").val(1);
		return;
	}
	if(count==1){
		return;
	}else{
		$("#count").val(count-1);
	}
}

$("#giftPackage").change(function(){
	if($(this).find("option:selected").val()!=""){
		$("#limitTip").text("( 剩余 "+$(this).find("option:selected").attr("id")+" 张 )");
		$("#count").val("1");
	}else{
		$("#limitTip").text("");
		$("#count").val("1");
	}
});

function toSendGifgPackage(uuid){
	$("#customerUuid").val(uuid);
}

$("#giftPackageForm").validate({
	rules: {
		giftPackage:{
			required : true
		},
  		count: {
			required : true,
			digits : true,
			limitCount:function(){
				var limitCount = parseInt($("#giftPackage").find("option:selected").attr("id"));
				return limitCount;
			}
		}
  	},
    messages: {
		giftPackage:{
			required : "请选择礼包类型",
		},
   		count: {
			required : "请输入发送礼包的数量", 
			digits : "请输入正整数",
			limitCount:"不能超过{0}"
		}
  	},
	errorElement: 'span',  //输入错误时的提示标签
	errorClass: 'help-block has-error',  //输入错误时的提示标签类名
	errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
		if(element.parents(".y_saleleng").find("div").length>0){
			element.parents(".y_saleleng").find("div").append(error);
		}else{
            element.after(error);
		}
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
		$("input[name='customerUuid']:hidden").val($("#customerUuid").val());
		$("input[name='giftPackageUuid']:hidden").val($("#giftPackage").find("option:selected").val());
        form.submit();
		$("#modal-giftPackage").modal('hide');
    }  
});


function retrieveData(sSource,aoData,fnCallback) { 
	var searchParam = new Array() ;
	searchParam.push({ "name": "customerName", "value": $.trim($("#customerName").val())});
	searchParam.push({ "name": "customerName_s", "value": $.trim($("#customerName_s").val())});
	searchParam.push({ "name": "customerName_q", "value": $.trim($("#customerName_q").val())});
	searchParam.push({ "name": "mobile", "value": $.trim($("#mobile").val())});
	searchParam.push({ "name": "mobile_s", "value": $.trim($("#mobile_s").val())});
	searchParam.push({ "name": "mobile_q", "value": $.trim($("#mobile_q").val())});
	searchParam.push({ "name": "email", "value": $.trim($("#email").val())});
	searchParam.push({ "name": "email_s", "value": $.trim($("#email_s").val())});
	searchParam.push({ "name": "email_q", "value": $.trim($("#email_q").val())});
	searchParam.push({ "name": "frozenState_s", "value": $.trim($("#frozenState_s").val())});
	searchParam.push({ "name": "frozenState_q", "value": $.trim($("#frozenState_q").val())});
	searchParam.push({ "name": "frozenType_s", "value": $.trim($("#frozenType_s").val())});
	searchParam.push({ "name": "frozenType_q", "value": $.trim($("#frozenType_q").val())});
	searchParam.push({ "name": "activeState_s", "value": $.trim($("#activeState_s").val())});
	searchParam.push({ "name": "activeState_q", "value": $.trim($("#activeState_q").val())});
	/* searchParam.push({ "name": "authState_s", "value": $.trim($("#authState_s").val())});
	searchParam.push({ "name": "authState_q", "value": $.trim($("#authState_q").val())}); */
	searchParam.push({ "name": "createTime_s", "value": $.trim($("#createTime_s").val())});
	searchParam.push({ "name": "createTime_q", "value": $.trim($("#createTime_q").val())});
	searchParam.push({ "name": "createTime2_s", "value": $.trim($("#createTime2_s").val())});
	searchParam.push({ "name": "createTime2_q", "value": $.trim($("#createTime2_q").val())});
	searchParam.push({ "name": "customerShopLevelUuid_s", "value": $.trim($("#customerShopLevelUuid_s").val())});
	searchParam.push({ "name": "customerShopLevelUuid_q", "value": $.trim($("#customerShopLevelUuid_q").val())});
   $.ajax({    	        
  	"dataType": 'json', 
	  "type": "POST", 
	  "url": sSource, 
	  "data": {aoData:JSON.stringify(aoData),searchParam:JSON.stringify(searchParam)}, 
	  "success": fnCallback
  });    
} 
    
var oTable = null; 
function doSearch(operact) {
	if(oTable == null) {		 
    if ($('.dataTable').length > 0) {
        $('.dataTable').each(function() {            
                var opt = {
				            "sPaginationType": "full_numbers",
				            "oLanguage": {
				            		"sProcessing": "<aebiz:showTitle titleId="basebusiness.showmessage.loading"/>",
				                "sSearch": "<span><aebiz:showTitle titleId="basebusiness.showmessage.query"/>:</span> ",
				                "sInfo": "<aebiz:showTitle titleId="basebusiness.showmessage.pageFrom"/> <span>_START_</span> <aebiz:showTitle titleId="basebusiness.showmessage.pageTo"/> <span>_END_</span> <aebiz:showTitle titleId="basebusiness.showmessage.pageItem"/>，<aebiz:showTitle titleId="basebusiness.showmessage.totalCount"/>： <span>_TOTAL_</span> <aebiz:showTitle titleId="basebusiness.showmessage.pageItem"/>",
				                "sLengthMenu": "_MENU_ <span><aebiz:showTitle titleId="basebusiness.showmessage.pageShow"/></span>" ,
				                "oPaginate": {
				                 	"sFirst": "<aebiz:showTitle titleId="basebusiness.showmessage.firstPage"/>",
				                  "sPrevious": "<aebiz:showTitle titleId="basebusiness.showmessage.prePage"/>",
				                  "sNext": "<aebiz:showTitle titleId="basebusiness.showmessage.nextPage"/>",
				                  "sLast": "<aebiz:showTitle titleId="basebusiness.showmessage.lastPage"/>"
				                }
				            },
				            'sDom': "rtlip",
				            'aoColumnDefs': [{
				                'bSortable': false,
				                'aTargets': [0,1,2,3,4,5,7]                
				            }],
				            "bSort": true, //排序功能            
					         	"aoColumns": [
										    {
										  	 "mDataProp":"checkbox" ,
										  	 "sDefaultContent":"",
										    "sWidth":"5%",
										  	 "fnRender": function(obj) {
												      var sReturn = "<input type='checkbox' name='check' value='"+obj.aData.uuid+"' />";						      
												      return sReturn;
										 	          }
										    },
											{"mDataProp":"customerName" ,"sWidth":"12%","sTitle": "<aebiz:showTitle titleId="customer.m.customerName"/>"},
											{"mDataProp":"mobile" ,"sWidth":"17%","sWidth":"8%","sTitle": "<aebiz:showTitle titleId="customer.m.mobile"/>"},
											{"mDataProp":"email" ,"sWidth":"17%","sTitle": "<aebiz:showTitle titleId="customer.m.email"/>"},
											/* {"mDataProp":"customerLevel" ,"sWidth":"8%","sTitle": "<aebiz:showTitle titleId="customer.m.customerLevel"/>"}, */
											{
											  	"mDataProp":"frozenState",
											  	"sDefaultContent":"",
											  	"sWidth":"10%",
											  	"sTitle": "<aebiz:showTitle titleId="customer.m.frozenState"/>" ,
											 	"fnRender": function(obj) {	
												  		var sReturn ="";
												  		if(obj.aData.frozenState==1){
												  			sReturn="<aebiz:showTitle titleId="customer.m.frozened"/>";
												  		}else if(obj.aData.frozenState==0){
												  			sReturn="<aebiz:showTitle titleId="customer.m.unfrozened"/>";
												  		}else{
												  			sReturn="";
												  		}
												       	return sReturn;
												 }			
											},
											{
											  	"mDataProp":"activeState",
											  	"sDefaultContent":"",
											  	"sTitle": "<aebiz:showTitle titleId="customer.m.activeState"/>" ,
											  	"sWidth":"10%",
											 	"fnRender": function(obj) {	
												  		var sReturn ="";
												  		if(obj.aData.activeState==1){
												  			sReturn="<aebiz:showTitle titleId="customer.m.actived"/>";
												  		}else{
												  			sReturn="<aebiz:showTitle titleId="customer.m.unactived"/>";
												  		}
												      return sReturn;
												 }			
											 },
											{"mDataProp":"createTime" ,"sWidth":"14%","sTitle": "<aebiz:showTitle titleId="customer.m.createTime"/>"},
										    {
											 "mDataProp":"operate",
											 "sWidth":"12%",
											 "sDefaultContent":"",
											 "sTitle": "<aebiz:showTitle titleId="basebusiness.showmessage.operate"/>" ,
											 "fnRender": function(obj) {	
											 		var sReturn = "";
											  		<shiro:hasPermission name="customercomb:button:view or sysback:button:*">
											  			sReturn = "<a href='${pageContext.servletContext.contextPath}/sysback/customercomb/toView/"+obj.aData.uuid+"' class='btn' rel='tooltip' title='<aebiz:showTitle titleId="basebusiness.showmessage.view"/>'><aebiz:showTitle titleId="basebusiness.showmessage.view"/></a>" ;
										  			</shiro:hasPermission>
											  			/* sReturn +="<a href='${pageContext.servletContext.contextPath}/sysback/customercomb/toUpdateCustomer/"+obj.aData.uuid+"' class='btn' rel='tooltip' title='<aebiz:showTitle titleId="basebusiness.showmessage.edit"/>'><aebiz:showTitle titleId="basebusiness.showmessage.edit"/></a>"; */
											  			/* if(obj.aData.frozenState=="<aebiz:showTitle titleId="customer.m.frozened"/>"){
											  				sReturn +="<a onclick='javascript:toUnFrozen(\""+obj.aData.uuid+"\")' class='btn' rel='tooltip' data-toggle='modal' data-target='#modal-unfrozen' title='<aebiz:showTitle titleId="customer.m.unfrozen"/>'><aebiz:showTitle titleId="customer.m.unfrozen"/></a>";
											  			}else{
											  				sReturn +="<a onclick='javascript:toFrozen(\""+obj.aData.uuid+"\")' class='btn' rel='tooltip' data-toggle='modal' data-target='#modal-frozen' title='<aebiz:showTitle titleId="customer.m.frozen"/>'><aebiz:showTitle titleId="customer.m.frozen"/></a>";
											  			}
											  			sReturn +="<a onclick='javascript:toReset(\""+obj.aData.uuid+"\",\""+obj.aData.mobile+"\")' class='btn' rel='tooltip' data-toggle='modal' data-target='#modal-resetPwd' title='<aebiz:showTitle titleId="customer.m.resetpassword"/>'><aebiz:showTitle titleId="customer.m.resetpassword"/></a>" ; */
											  			/* sReturn +="<a onclick='javascript:toSendGifgPackage(\""+obj.aData.uuid+"\")' class='btn' rel='tooltip' data-toggle='modal' data-target='#modal-giftPackage' title='<aebiz:showTitle titleId="customer.m.sendGiftPackage"/>'><aebiz:showTitle titleId="customer.m.sendGiftPackage"/></a>" ; */
											      return sReturn;
											 }			
										   }
										 ],
				            'oTableTools': {
				                "sSwfPath": "${pageContext.servletContext.contextPath}/static/sysback/js/plugins/datatable/swf/copy_csv_xls_pdf.swf"
				            },
				            "bRetrieve":true ,
				            "bProcessing":true,
				           	"bServerSide":true,                    //指定从服务器端获取数据
				            "sAjaxSource":"${pageContext.servletContext.contextPath}/sysback/customer/queryList" ,
										"fnServerData":retrieveData           //获取数据的处理函数  
				        };
				        
                		if ($(this).hasClass("dataTable-reorder")) {
		                    opt.sDom = "R" + opt.sDom;
		                }
		                oTable = $(this).dataTable(opt);
        	});
   		}         
	}
		
	//刷新Datatable，会自动激发retrieveData  		
  	if('inittable' != operact) {  			
		oTable.fnDraw(); 	
	}  
}

//清空普通搜索
function clearSearch() {
	$("#customerName").val("") ;
	$("#mobile").val("");
	$("#email").val("");
}

$(".search").click(function(){	
	//普通搜索需要清空高级搜索的选项
	//clearMoreSearch();
	doSearch('search') ;  
})

//删除
function removes(delId) {
		var checkIds="";
		if( $.trim(delId) != "") {
			checkIds = delId ;
		}else{
			$("input[name='check']:checkbox").each(function(){				
		        if($(this).is(":checked")){        	
		            checkIds += $(this).val()+"," ;  
		        }
    		});	
		}
		
		if($.trim(checkIds) == "") {
				//提示为空
				bootbox.alert("<aebiz:showTitle titleId="basebusiness.showmessage.chooseDeleteData"/>") ;
				return ;
		} 
		
		bootbox.confirm("<aebiz:showTitle titleId="basebusiness.showmessage.confirmDelete"/>", function(r){
        	if(r) {
        		//删除
				$.post(
			    	"${pageContext.servletContext.contextPath}/sysback/customer/deletes",
			    	{"selectOne":checkIds,ranNum:Math.random()},	
				    function(data) {
				       var result = eval("("+data+")") ;	       
				       if(result.rsp) {
				  			//刷新
							doSearch('search') ;     	
				       }else{
				       		bootbox.alert('<aebiz:showTitle titleId="basebusiness.showmessage.opeFailed"/>') ;
				       }
				    }
				);		
        	}   
    });   
}

function toReset(uuid,mobile){
	$("#customerUuid").val(uuid);
	
	if(mobile==""){
		$("#oldMobileDiv").hide();
		$("#newmobile").iCheck('check');
	}else{
		$("#oldMobileDiv").show();
		$("#customerMobile").val(mobile);
		$("#confirmMobile").val(mobile);
		$("#oldmobile").iCheck('check');
		$("#newmobile").iCheck('uncheck');
	}
}

function toFrozen(uuid){
	$("#customerUuid").val(uuid);
}

function toUnFrozen(uuid){
	$("#customerUuid").val(uuid);
}

// Validation 调用表单验证插件的js
$(function(){
  if ($('.form-validate1').length > 0) {
      $('.form-validate1').each(function() {
          var id = $(this).attr('id');  //获取表单的id
          $("#" + id).validate({   //验证表单
              errorElement: 'span',  //输入错误时的提示标签
              errorClass: 'help-block has-error',  //输入错误时的提示标签类名
              errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
                  if(element.parents(".input-group").length > 0){
                  		element.parents(".input-group").after(error);
                  }else if(element.parents(".y_validatainput").length > 0){
                  		element.parents(".y_validatainput").after(error);
                  }
                  else if(element.parents("label").length > 0) {
                      element.parents("label").after(error);
                  }else {
                      element.after(error);
                  }
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
              submitHandler: function(form){
            	  frozen(); 
            	  $("#modal-frozen").modal('hide');//关闭弹出框
			  }
          });
      });
  }	
})

//会员解冻调用表单验证
$(function(){
	  if ($('.form-validate2').length > 0) {
	      $('.form-validate2').each(function() {
	          var id = $(this).attr('id');  //获取表单的id
	          $("#" + id).validate({   //验证表单
	              errorElement: 'span',  //输入错误时的提示标签
	              errorClass: 'help-block has-error',  //输入错误时的提示标签类名
	              errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
	                  if(element.parents(".input-group").length > 0){
	                  		element.parents(".input-group").after(error);
	                  }else if(element.parents(".y_validatainput").length > 0){
	                  		element.parents(".y_validatainput").after(error);
	                  }
	                  else if(element.parents("label").length > 0) {
	                      element.parents("label").after(error);
	                  }else {
	                      element.after(error);
	                  }
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
	              submitHandler: function(form){
	                	unFrozen() ;  
	                    $("#modal-unfrozen").modal('hide');//关闭弹出框
				  }
	          });
	      });
	  }	
	});
	
//会员重置密码调用表单验证	
$(function(){
	  if ($('.form-validate3').length > 0) {
	      $('.form-validate3').each(function() {
	          var id = $(this).attr('id');  //获取表单的id
	          $("#" + id).validate({   //验证表单
	              errorElement: 'span',  //输入错误时的提示标签
	              errorClass: 'help-block has-error',  //输入错误时的提示标签类名
	              errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
	                  if(element.parents(".input-group").length > 0){
	                  		element.parents(".input-group").after(error);
	                  }else if(element.parents(".y_validatainput").length > 0){
	                  		element.parents(".y_validatainput").after(error);
	                  }
	                  else if(element.parents("label").length > 0) {
	                      element.parents("label").after(error);
	                  }else {
	                      element.after(error);
	                  }
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
	              submitHandler: function(form){
	                	resetPwd() ;  
	                    $("#modal-resetPwd").modal('hide');//关闭弹出框
				  }
	          });
	      });
	  }	
});
	
//会员冻结
function frozen(){
	var customerUuid=$("#customerUuid").val();
	var frozenNote=$("#frozenNote").val();
	var frozenType=$("#frozenType").val();
	$.get("${pageContext.servletContext.contextPath}/sysback/customer/frozen",{"customerUuid":customerUuid,"frozenNote":frozenNote,"frozenType":frozenType,ranNum:Math.random()},function(data) {	
    	if(data == "true") {
	  			//刷新
				doSearch('search') ;     	
	     }else{
	       		bootbox.alert('<aebiz:showTitle titleId="basebusiness.showmessage.opeFailed"/>') ;
	     }
    });		
}	

//会员解冻
function unFrozen(){
	var customerUuid = $("#customerUuid").val();
	var note = $("#unFrozenNote").val();
	$.get("${pageContext.servletContext.contextPath}/sysback/customer/unfrozen",{"customerUuid":customerUuid,"unFrozenNote":note,ranNum:Math.random()},function(data){	
		  if(data == "true") {
	  			//刷新
				doSearch('search') ;     	
	      }else{
	       		bootbox.alert('<aebiz:showTitle titleId="basebusiness.showmessage.opeFailed"/>') ;
	      }
	});	
}
//重置密码
function resetPwd() {
	var customerUuid = $("#customerUuid").val();
	var mobile = $("#confirmMobile").val();
	bootbox.alert('密码已发送到手机，请注意查收!') ;
	//重置密码
	$.get("${pageContext.servletContext.contextPath}/sysback/customer/resetPassword",{"customerUuid":customerUuid,"confirmMobile":mobile,ranNum : Math.random()},function(data) {
		if (data == "true") {
		} else {
			bootbox.alert('<aebiz:showTitle titleId="basebusiness.showmessage.opeFailed"/>');
		}
	});
}

//导出
function exports(delId){
	var searchParam = new Array() ;
	searchParam.push({ "name": "customerName", "value": $.trim($("#customerName").val())});
	searchParam.push({ "name": "customerName_s", "value": $.trim($("#customerName_s").val())});
	searchParam.push({ "name": "customerName_q", "value": $.trim($("#customerName_q").val())});
	searchParam.push({ "name": "mobile", "value": $.trim($("#mobile").val())});
	searchParam.push({ "name": "mobile_s", "value": $.trim($("#mobile_s").val())});
	searchParam.push({ "name": "mobile_q", "value": $.trim($("#mobile_q").val())});
	searchParam.push({ "name": "email", "value": $.trim($("#email").val())});
	searchParam.push({ "name": "email_s", "value": $.trim($("#email_s").val())});
	searchParam.push({ "name": "email_q", "value": $.trim($("#email_q").val())});
	searchParam.push({ "name": "frozenState_s", "value": $.trim($("#frozenState_s").val())});
	searchParam.push({ "name": "frozenState_q", "value": $.trim($("#frozenState_q").val())});
	searchParam.push({ "name": "frozenType_s", "value": $.trim($("#frozenType_s").val())});
	searchParam.push({ "name": "frozenType_q", "value": $.trim($("#frozenType_q").val())});
	searchParam.push({ "name": "activeState_s", "value": $.trim($("#activeState_s").val())});
	searchParam.push({ "name": "activeState_q", "value": $.trim($("#activeState_q").val())});
	searchParam.push({ "name": "authState_s", "value": $.trim($("#authState_s").val())});
	searchParam.push({ "name": "authState_q", "value": $.trim($("#authState_q").val())});
	searchParam.push({ "name": "createTime_s", "value": $.trim($("#createTime_s").val())});
	searchParam.push({ "name": "createTime_q", "value": $.trim($("#createTime_q").val())});
	searchParam.push({ "name": "createTime2_s", "value": $.trim($("#createTime2_s").val())});
	searchParam.push({ "name": "createTime2_q", "value": $.trim($("#createTime2_q").val())});
	searchParam.push({ "name": "customerShopLevelUuid_s", "value": $.trim($("#customerShopLevelUuid_s").val())});
	searchParam.push({ "name": "customerShopLevelUuid_q", "value": $.trim($("#customerShopLevelUuid_q").val())});

	location.href="${pageContext.servletContext.contextPath}/sysback/customer/export?searchParam="+JSON.stringify(searchParam);
}

$(document).ready(function() {
	$("#createTime_s").datepicker({
		format: "yyyy-mm-dd",
		showMeridian: true,
		autoclose: true,
		language: 'en',
		pickDate: true,
		minView: 2,
		pickTime: true,
		todayBtn: true
	 }).on('changeDate',function(ev){
		var startTime = $("#createTime_s").val();
		$("#createTime2_s").datepicker('setStartDate',startTime);
		$("#createTime_s").datepicker('hide');
	 });

	$("#createTime2_s").datepicker({
		format: "yyyy-mm-dd",
		showMeridian: true,
		autoclose: true,
		language: 'en',
		pickDate: true,
		minView: 2,
		pickTime: true,
		todayBtn: true
	 }).on('changeDate',function(ev){
		var endTime = $("#createTime2_s").val();
		$("#createTime_s").datepicker('setEndDate',endTime);
		$("#createTime2_s").datepicker('hide');
	 });
	
	$("#oldmobile").on('ifChecked', function(){
		$("span[for='confirmMobile']").parents(".form-group").removeClass("has-error");
		$("span[for='confirmMobile']").remove();
   		$("#confirmMobile").val($("#customerMobile").val());
		$("#confirmMobile").attr("disabled","disabled");
	});
	
	$("#newmobile").on('ifChecked', function(){
   		$("#confirmMobile").val("");
		$("#confirmMobile").removeAttr("disabled");
	});
	
	//初始化表格
  	doSearch('inittable') ;
	
   //复选框全选
	$("#check_all").click(function(e) {
	    $('input', oTable.fnGetNodes()).prop('checked', this.checked);
	});       
	
	$(".clearMoreSearch").click(function(e) {    	
		clearMoreSearch() ;
	});
}) 

</script>
</body>
</html>