<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->

    <%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>		
	<title><aebiz:showTitle titleId="ucenter.payPassword_title"/></title>
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
									<li class="active"><aebiz:showTitle titleId="ucenter.payPassword_title"/></li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
						</div>
						
						<input type="hidden" id="uuidHidden" value="${m.uuid}">
						
						<!-- main -->
						<div class="content">
							<div class="main-header">
								<h2><aebiz:showTitle titleId="ucenter.payPassword_title"/></h2>
								<em>To enable payment password</em>
							</div>
							
							<div class="main-content">
								<form id="mainForm" class="form-horizontal y_setpassd mb_40" action="${pageContext.servletContext.contextPath}/usercenter/customer/setPayPassword" method="post">
									<input type="hidden" name="accountUuid" value="${accountModel.uuid}">
									<input type="hidden" name="setType" value="0">
									
									<div class="form-group">
										<label for="newpwd" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter.payPassword_setPayPassword"/>：</label>
										<div class="col-mi-4">
											<input type="password" id="newpwd" name="newpwd" maxlength="6" class="form-control payPwdReg" placeholder="<aebiz:showTitle titleId="ucenter.payPassword_payPwdTip"/>">
										</div>
									</div>
									
									<div class="form-group">
										<label for="confirmPwd" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter.payPassword_setPayPasswordAgain"/>：</label>
										<div class="col-mi-4">
											<input type="password" id="confirmPwd" name="confirmPwd" class="form-control">
										</div>
									</div>
									
									<div class="form-group">
										<label for="verifyType" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter.payPassword_verifyType"/>：</label>
										<div class="col-mi-3">
											<select id="verifyType" class="form-control">
												<c:if test="${!empty m.mobile}"><option value="1"><aebiz:showTitle titleId="ucenter.payPassword_mobileType"/></option></c:if>
												<c:if test="${!empty m.email}"><option value="2"><aebiz:showTitle titleId="ucenter.payPassword_emailType"/></option></c:if>
											</select>
										</div>
									</div>
									
									<div id="mobileDiv" class="form-group">
										<label for="" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter.payPassword_mobile"/>：</label>
										<input type="hidden" id="mobileHidden" value="${m.mobile}">
										<div class="col-mi-4">
											<p class="y_hasuremob"></p>
										</div>
									</div>
									
									<div id="emailDiv" class="form-group">
										<label for="" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter.payPassword_email"/>：</label>
										<input type="hidden" id="emailHidden" value="${m.email}">
										<div class="col-mi-4">
											<p class="y_hasuremob"></p>
										</div>
									</div>
									
									<div class="form-group">
										<label for="code" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter.payPassword_verifyCode"/>：</label>
										<div class="col-mi-2">
											<input type="text" id="code" name="code" class="form-control">
										</div>
										
										<p class="col-mi-7">
											<input type="button" class="btn btn-primary mr_10 getCode" value="<aebiz:showTitle titleId="ucenter.payPassword_getCode"/>">
											<span id="sendTip" style="display:none"></span>
										</p>
										
									</div>
									
									<div class="row">
										<p class="col-mi-9 col-mi-offset-3">
											<button type="submit" class="btn btn-custom-primary"><aebiz:showTitle titleId="basebusiness.showmessage.save"/></button>
										</p>
									</div>
								</form>
								
								<dl class="form_msdl">
									<dt>启用支付密码后，将在如下环节通过支付密码对您进行身份认证，确保您的资金安全。</dt>
									<dd>1、使用账户余额时</dd>
									<dd>2、使用优惠劵时（不包含实体劵）</dd>
									<dd>3、使用礼品卡时（不包含实体卡）</dd>
									<dd>4、使用积分时</dd>
								</dl>
								
								<dl class="form_msdl">
									<dt>为什么需要启用支付密码？</dt>
									<dd>启用支付密码后，在提交订单时，会根据您的设置要求您输入密码，为您的账户资产加把锁。</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
		
		<div class="push-sticky-footer"></div>
	</div><!-- /wrapper -->

<!-- FOOTER 底部 -->
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImportJs.jsp"%>
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterBottom.jsp"%>
<script src="${pageContext.request.contextPath }/static/usercenter/js/validation/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/static/customermgr/usercenter/aebiz.validate.expand.js"></script>
	
<script>
var customerUuid=$("#uuidHidden").val()
	var mobile=$("#mobileHidden").val();
	var email=$("#emailHidden").val();
	var mobileOrEmail="";
	var type="";
	
	$(function(){
		//选择验证类型：手机或者邮箱验证
		if($("#verifyType").val()=="1"){
			mobileOrEmail=mobile;
			type="mobile";
			$("#mobileDiv").show();
			$("#emailDiv").hide();
		}else{
			mobileOrEmail=email;
			type="email";
			$("#mobileDiv").hide();
			$("#emailDiv").show();
		}
		
		if(mobile!=""){
			$("#mobileDiv").find("p").html(mobile.substring(0,3)+"****"+mobile.substring(7,11));
		}
		
		if(email!=""){
			var index=email.indexOf("@");
			$("#emailDiv").find("p").html(email.substring(0,1)+"****"+email.substr(index-1,1)+email.substring(index));		
		}
		
		//选择验证方式切换时事件
		var map={"1":"mobileDiv","2":"emailDiv"};
		$("#verifyType").bind("change", function(){
			var divId = map[this.value];
			if(this.value=='1'){
				mobileOrEmail=mobile;
				type="mobile";
			}else{
				mobileOrEmail=email;
				type="email";
			}
			$("#"+divId).show().siblings("div[id$='Div']").hide();
		});

		$("#mainForm").validate({
			 rules: {
	  		 	newpwd: {
					required : true,
				},
				confirmPwd:{
					required : true,
					equalTo : "#newpwd"
				},
				code:{
					required : true,
					remote :{
						url: "${pageContext.servletContext.contextPath}/usercenter/customer/checkValidateCode",
						type:"get",
						dataType:"json",
						data:{
							mobileOrEmail : function(){
								return mobileOrEmail;
							},
							code : function(){
								return $("#code").val();
							}
						}
					}
				}
	  		},
	
	        messages: {
				newpwd:{
					required : "<aebiz:showTitle titleId="ucenter_changepwd_newPwdTip"/>"
				},
				confirmPwd:{
					required : "<aebiz:showTitle titleId="ucenter_changepwd_confirmPwdTip"/>" ,
					equalTo :"<aebiz:showTitle titleId="ucenter_changepwd_wrongConfirmPwd"/>",
				},
				code:{
					required : "<aebiz:showTitle titleId="ucenter_changepwd_codeTip"/>" ,
					remote : "<aebiz:showTitle titleId="ucenter_changepwd_wrongCode"/>"
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
			}
		});

		$(".getCode").click(function(){
			time(this);
			var url="${pageContext.servletContext.contextPath}/usercenter/customer/getValidateCode";
			$.get(url,{"mobileOrEmail":mobileOrEmail,"type":type,"ranNum":Math.random()},function(data){
				if(data=="success"&&type=="mobile"){
					$("#sendTip").html("<i class='fa fa-check-square text-success'></i><aebiz:showTitle titleId="ucenter.payPassword_sendMobileTip"/>");
					$("#sendTip").show();
				}else{
					$("#sendTip").html("<i class='fa fa-check-square text-success'></i><aebiz:showTitle titleId="ucenter.payPassword_sendEmailTip"/>");
					$("#sendTip").show();
				}
			});
		});
	});
		
	//执行倒计时方法
	var wait=60;
	function time(o) {
	  	if (wait == 0) {
			$("#sendTip").hide();
		    o.removeAttribute("disabled");
		    o.value = "<aebiz:showTitle titleId="ucenter.payPassword_getCode"/>";
		    wait = 60;
	  	} else {
		    o.setAttribute("disabled", true);
		    o.value = wait + "<aebiz:showTitle titleId="ucenter.payPassword_waitTime"/>";
		    wait--;
		    setTimeout(function() {time(o)},1000)
	    }
	}
	
</script>
</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>