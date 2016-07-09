<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->

    <%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>		
	<title><aebiz:showTitle titleId="ucenter_bindMobile_title"/></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="description" content="KingAdmin - Bootstrap Admin Dashboard Theme">
	<meta name="author" content="The Develovers">
	
</head>

<body class="demo-only-page-blank">
	
	<!-- WRAPPER 头部、左侧、右侧大框架 -->
	<div class="wrapper">
		<!-- TOP BAR 头部导航 -->
		<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterHead.jsp"%>
		<!-- /top -->
		<div class="container">
			<div class="ku_crumbs">
				<a href="${pageContext.servletContext.contextPath}/customer/toIndex">首页</a><b>&gt</b><span>个人中心</span>
			</div>
		</div>
		<!-- BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT 左侧导航和右侧主体 -->
		<div class="bottom">
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- left sidebar 左侧导航 -->
					<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterLeft.jsp"%>
					<!-- end left sidebar -->

					<!-- content-wrapper 右侧主体 -->
					<div class="col-xs-10 content-wrapper">
						<%--
						<div class="row">
							<div class="col-sm-4 ">
								<ul class="breadcrumb">
									<li>
										<i class="fa fa-home"></i>
										<a href="${pageContext.servletContext.contextPath}/customer/toIndex"><aebiz:showTitle titleId="ucenter_indexPage_membercenter"/></a>
									</li>
									<li>
										<a href="${pageContext.servletContext.contextPath}/usercenter/customer/toSecuritySetting">
											<aebiz:showTitle titleId="ucenter_securitySet_safeCenter"/>
										</a>
									</li>
									<li class="active"><aebiz:showTitle titleId="ucenter_bindMobile_title"/></li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
						</div>
						--%>
						<!-- main -->
						<div class="content ku_orderlist">
							<input type="hidden" id="uuidHidden" value="${m.uuid}">
							<input type="hidden" id="mobileHidden" value="${m.mobile}">
							<input type="hidden" id="typeHidden" value="${pageType}">
							
							<c:choose>
								<c:when test="${empty m.mobile}">
									<div class="main-header">
										<h2><aebiz:showTitle titleId="ucenter_bindMobile_title"/></h2>
										<%--<em>Binding mobile phone</em>--%>
									</div>
									
									<!--会员未绑定手机时绑定手机-->
									<div class="main-content">
										<form id="bindForm" class="form-horizontal y_setpassd mask_input form-validate" action="${pageContext.servletContext.contextPath}/usercenter/customer/bindMobile" method="post">
											<input type="hidden" name="customerUuid" value="${m.uuid}">
											<div class="form-group">
												<label for="mobile" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter_bindMobile_newMobile"/></label>
												<div class="col-mi-4">
													<input type="text" id="mobile" name="mobile" class="form-control mobilezh">
												</div>
											</div>
											
											<div class="form-group">
												<label for="code0" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter_bindMobile_shortcode"/></label>
												<div class="col-mi-2">
													<input type="text" id="code0" name="code0" class="form-control" required="required">
												</div>
												
												<p class="col-mi-7">
													<input type="button" class="btn btn-custom-primary mr_10 getCode" value="<aebiz:showTitle titleId="ucenter_bindMobile_getShortCode"/>"/>
													<i name="sendTip" style="display:none" class="fa fa-check-square text-success">
														<aebiz:showTitle titleId="ucenter_bindMobile_sendTip"/>
													</i>
												</p>
											</div>
											
											<div class="row">
												<p class="col-mi-9 col-mi-offset-3 ku_btn">
													<button type="submit" class="btn btn-custom-primary"><aebiz:showTitle titleId="basebusiness.showmessage.save"/></button>
												</p>
											</div>
										</form>
									</div>
								</c:when>
								
								<c:otherwise>
									<div class="main-header">
										<h2><aebiz:showTitle titleId="ucenter_bindMobile_changeBindMobile"/></h2>
										<em>Modify binding mobile phone</em>
									</div>
									
									<!--会员已绑定手机时修改绑定手机-->
									<div class="main-content">
										<div class="y_orderdtep y_twotep y_orderdtep1">
											<ol class="y_orstepms">
												<li class="y_stms1">
													<div><i class="fa fa-circle"></i><span>1</span></div>
													<p><aebiz:showTitle titleId="ucenter_bindMobile_authen"/></p>
												</li>
												
												<li class="y_stms2">
													<div><i class="fa fa-circle"></i><span>2</span></div>
													<p><aebiz:showTitle titleId="ucenter_bindMobile_changeBindMobile"/></p>
													<s></s>
												</li>
											</ol>
										</div>
										
										<form id="editForm1" class="form-horizontal y_setpassd" action="${pageContext.servletContext.contextPath}/usercenter/customer/bindMobileNextStep" method="post" role="form">
											<div class="form-group">
												<label class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter_bindMobile_alreadyBindMobile"/></label>
												<div class="col-mi-4">
													<p class="y_hasuremob"></p>
												</div>
											</div>
											
											<div class="form-group">
												<label for="code1" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter_bindMobile_shortcode"/></label>
												<div class="col-mi-2">
													<input type="text" id="code1" name="code1" class="form-control">
												</div>
												<p class="col-mi-7">
													<input type="button" class="btn btn-primary mr_10 getCode" value="<aebiz:showTitle titleId="ucenter_bindMobile_getShortCode"/>"/>
													<i name="sendTip" style="display:none" class="fa fa-check-square text-success">
														<aebiz:showTitle titleId="ucenter_bindMobile_sendTip"/>
													</i>
												</p>
											</div>
											
											<div class="row">
												<p class="col-mi-9 col-mi-offset-3 ku_btn">
												<button id="mobile_next" type="submit" class="btn btn-custom-primary"><aebiz:showTitle titleId="basebusiness.showmessage.nextStep"/></button>
												</p>
											</div>
										</form>
										
										<form id="editForm2" class="form-horizontal y_setpassd none" action="${pageContext.servletContext.contextPath}/usercenter/customer/changeMobile" method="post" role="form">
											<input type="hidden" name="customerUuid" value="${m.uuid}">
											<div class="form-group">
												<label for="newMobile" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter_bindMobile_newMobile"/></label>
												<div class="col-mi-4">
													<input type="text" id="newMobile" name="newMobile" class="form-control mobilezh notEqualTo">
												</div>
											</div>
											
											<div class="form-group">
												<label for="code2" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter_bindMobile_shortcode"/></label>
												<div class="col-mi-2">
													<input type="text" id="code2" name="code2" class="form-control">
												</div>
												
												<p class="col-mi-7">
													<input type="button" class="btn btn-primary mr_10 getCode" value="<aebiz:showTitle titleId="ucenter_bindMobile_getShortCode"/>"/>
													<i name="sendTip" style="display:none" class="fa fa-check-square text-success">
														<aebiz:showTitle titleId="ucenter_bindMobile_sendTip"/>
													</i>
												</p>
											</div>
											
											<div class="row">
												<p class="col-mi-9 col-mi-offset-3 ku_btn">
													<button type="submit" class="btn btn-custom-primary"><aebiz:showTitle titleId="basebusiness.showmessage.save"/></button>
												</p>
											</div>
										</form>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="push-sticky-footer"></div>
	</div><!-- /wrapper -->
	
<!-- FOOTER 底部 -->
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImportJs.jsp"%>
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterBottom.jsp"%>
<script src="${pageContext.request.contextPath }/static/usercenter/js/jquery.masked-input.min.js"></script>
<script src="${pageContext.request.contextPath }/static/usercenter/js/king-elements.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/validation/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/static/customermgr/usercenter/aebiz.validate.expand.js"></script>
	
<script>
var customerUuid=$("#uuidHidden").val();
var mobile="";
var type="mobile";
var pageType=$("#typeHidden").val();

jQuery.validator.addMethod("notEqualTo", function(value, element) {  
	var mobile = $("#mobileHidden").val();
	return mobile!=value;
}, "您已经绑定该号码，无需再次绑定");

$(document).ready(function(){
	if(pageType!=""){
		$("#editForm1").hide().next("#editForm2").show();
	  	$(".y_orderdtep1").removeClass("y_orderdtep1").addClass("y_orderdtep2");
	}
	
	//默认已绑定的手机号展示
	mobile = $("#mobileHidden").val();
	if(mobile!=""){
		$(".y_hasuremob").html(mobile.substring(0,3)+"****"+mobile.substring(7,11));
	}
	
	//bindForm:会员未绑定手机时绑定手机,点击获取验证码
	$("#bindForm .getCode").click(function(){
		if($("#bindForm").validate().element($("#mobile"))){
			time(this);
			mobile=$("#mobile").val(); //新手机号

			var url="${pageContext.servletContext.contextPath}/usercenter/customer/getValidateCode";
			$.get(url,{"mobileOrEmail":mobile,"type":type,"ranNum":Math.random()},function(data){
				if(data=="success"){
					$("#bindForm").find("i[name='sendTip']").show();
				}
			})
		}
	});

	$("#bindForm").validate({
		 rules: {
			mobile:{
				required : true,
				remote : {
					url:"${pageContext.servletContext.contextPath}/usercenter/customer/checkMobile",
					type:"get",
					dataType:"json",
					data:{
						customerUuid : customerUuid,
						mobile : function(){
							return $("#mobile").val();
						}
					}
				}
			},
  		 	code0: {
				required : true,
				remote : {
					url: "${pageContext.servletContext.contextPath}/usercenter/customer/checkValidateCode",
					type:"get",
					dataType:"json",
					data:{
						mobileOrEmail : function(){
							return $("#mobile").val();
						},
						code : function(){
							return $("#code0").val();
						}
					}
				}
			}
  		},
        messages: {
			mobile:{
				required : "请输入手机号码",
				remote : "手机号码已经被注册，请重新输入新手机号"
			},
   			code0: {
				required : "请输入验证码" , 
				remote : "验证码输入不正确"
			}
  		},
		errorElement: 'span',  //输入错误时的提示标签
		errorClass: 'help-block has-error',  //输入错误时的提示标签类名
		errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
	         if(element.parents(".input-group").length > 0){
	         		element.parents(".input-group").after(error);
	         }else if(element.parents(".y_validatainput").length > 0){
	         		element.parents(".y_validatainput").after(error);
	         }else if(element.parents("label").length > 0) {
	             element.parents("label").after(error);
	         }else if(element.parents(".num-validate").length > 0){
	             		element.parents(".num-validate").append(error);
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

		submitHandler:function(form){
            form.submit();
        }    
	});
	
	$("#editForm1").validate({
		 rules: {
  		 	code1: {
				required : true,
				remote : {
					url: "${pageContext.servletContext.contextPath}/usercenter/customer/checkValidateCode",
					type:"get",
					dataType:"json",
					data:{
						mobileOrEmail : function(){
							return $("#mobileHidden").val();
						},
						code : function(){
							return $("#code1").val();
						}
					}
				}
			}
  		},
        messages: {
   			code1: {
				required : "请输入验证码" , 
				remote : "验证码输入不正确"
			}
  		},
		errorElement: 'span',  //输入错误时的提示标签
		errorClass: 'help-block has-error',  //输入错误时的提示标签类名
		errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
	         if(element.parents(".input-group").length > 0){
	         		element.parents(".input-group").after(error);
	         }else if(element.parents(".y_validatainput").length > 0){
	         		element.parents(".y_validatainput").after(error);
	         }else if(element.parents("label").length > 0) {
	             element.parents("label").after(error);
	         }else if(element.parents(".num-validate").length > 0){
	             		element.parents(".num-validate").append(error);
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

		submitHandler:function(form){
            form.submit();
        }    
	});

	//editForm1:已绑定手机号,修改手机绑定,第一步：点击获取验证码,使用原手机号获取短信验证码
	$("#editForm1 .getCode").click(function(){
		//执行倒计时方法
		time(this);
		mobile =$("#mobileHidden").val();   //手机号
		
		var url="${pageContext.servletContext.contextPath}/usercenter/customer/getValidateCode";
		$.get(url,{"mobileOrEmail":mobile,"type":type,"ranNum":Math.random()},function(data){
			if(data=="success"){
				$("#editForm1").find("i[name='sendTip']").show();
			}
		})
	});

	$("#editForm2").validate({
		 rules: {
			newMobile:{
				required : true,
				remote : {
					url:"${pageContext.servletContext.contextPath}/usercenter/customer/checkMobile",
					type:"get",
					dataType:"json",
					data:{
						customerUuid : customerUuid,
						mobile : function(){
							return $("#newMobile").val();
						}
					}
				}
			},
  		 	code2: {
				required : true,
				remote : {
					url: "${pageContext.servletContext.contextPath}/usercenter/customer/checkValidateCode",
					type:"get",
					dataType:"json",
					data:{
						mobileOrEmail : function(){
							return $("#newMobile").val();
						},
						code : function(){
							return $("#code2").val();
						}
					}
				}
			}
  		},
        messages: {
			newMobile:{
				required : "请输入手机号码",
				remote : "手机号码已经被注册，请重新输入新手机号"
			},
   			code2: {
				required : "请输入验证码" , 
				remote : "验证码输入不正确"
			}
  		},
		errorElement: 'span',  //输入错误时的提示标签
		errorClass: 'help-block has-error',  //输入错误时的提示标签类名
		errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
	         if(element.parents(".input-group").length > 0){
	         		element.parents(".input-group").after(error);
	         }else if(element.parents(".y_validatainput").length > 0){
	         		element.parents(".y_validatainput").after(error);
	         }else if(element.parents("label").length > 0) {
	             element.parents("label").after(error);
	         }else if(element.parents(".num-validate").length > 0){
	             		element.parents(".num-validate").append(error);
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

		submitHandler:function(form){
            form.submit();
        }    
	});
	
	//editForm2:已绑定手机，修改绑定手机，第二步：使用新手机号获取短信验证码
	$("#editForm2 .getCode").click(function(){
		if($("#editForm2").validate().element($("#newMobile"))){
			time(this);
			mobile = $("#newMobile").val(); //新手机号

			var url="${pageContext.servletContext.contextPath}/usercenter/customer/getValidateCode";
			$.get(url,{"mobileOrEmail":mobile,"type":type,"ranNum":Math.random()},function(data){
				if(data=="success"){
					$("#editForm2").find("i[name='sendTip']").show();
				}
			})
		}
	});
});

//执行倒计时方法
var wait=60;
function time(o) {
	  if (wait == 0) {
		  $(o).parents("form").find("i[name='sendTip']").hide();
	      o.removeAttribute("disabled");
	      o.value = "<aebiz:showTitle titleId="ucenter_bindMobile_getShortCode"/>";
	      wait = 60;
	  } else {
	      o.setAttribute("disabled", true);
	      o.value = wait + "<aebiz:showTitle titleId="ucenter_bindMobile_waitTime"/>";
	      wait--;
	      setTimeout(function() {time(o)},1000)
	  }
}	
</script>

</body>
</html>