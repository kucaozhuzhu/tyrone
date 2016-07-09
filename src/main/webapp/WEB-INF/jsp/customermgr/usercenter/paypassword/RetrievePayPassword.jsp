<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->

    <%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>		
	<title><aebiz:showTitle titleId="ucenter.payPassword_modefyPayPassword"/></title>
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
									<li class="active">重置支付密码</li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
						</div>
						
						<!-- main -->
						<input type="hidden" id="uuidHidden" value="${m.uuid}">
						<input type="hidden" id="mobileHidden" value="${m.mobile}">
						<input type="hidden" id="emailHidden" value="${m.email}">
						
						<div class="content">
							<div class="main-header">
								<h2>重置支付密码</h2>
								<em>Retrieve login password</em>
							</div>
							
							<div class="main-content">
								<form id="mainForm" class="form-horizontal y_setpassd form-validate" action="${pageContext.servletContext.contextPath}/usercenter/customer/setPayPassword" method="post">
									<input type="hidden" name="accountUuid" value="${accountModel.uuid}">
									<input type="hidden" name="setType" value="2">
									<!-- 手机或者邮箱接收验证码 -->
									<div class="form-group">
										<label id="validateType" class="col-mi-3 control-label">
											<c:choose>
												<c:when test="${!empty m.mobile}">
													<aebiz:showTitle titleId="ucenter_changepwd_alreadyBindMobile"/>：
												</c:when>
												<c:otherwise>
													<aebiz:showTitle titleId="ucenter_changepwd_alreadyBindEmail"/>：
												</c:otherwise>
											</c:choose>
										</label>
										<div class="col-mi-4"><p class="y_hasuremob"></p></div>
									</div>
									
									<div class="form-group">
										<label for="code" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter.payPassword_verifyCode"/>：</label>
										<div class="col-mi-2">
											<input type="text" id="code" name="code" class="form-control">
										</div>
										
										<p class="col-mi-7">
											<input type="button" class="btn btn-primary mr_10" id="getCode" value="<aebiz:showTitle titleId="ucenter_changepwd_getAuthCode"/>"/>
											<i id="sendTip" style="display:none" class="fa fa-check-square text-success"><aebiz:showTitle titleId="ucenter_changepwd_sendTip"/></i>
										</p>
									</div>
									
									<div class="form-group">
										<label for="newpwd" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter.payPassword_setPayPassword"/>：</label>
										<div class="col-mi-4">
											<input type="password" id="newpwd" name="newpwd" maxlength="6" class="form-control payPwdReg" placeholder="<aebiz:showTitle titleId="ucenter.payPassword_payPwdTip"/>">
										</div>
									</div>
									
									<div class="form-group">
										<label for="confirmPwd" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter.payPassword_setPayPasswordAgain"/>：</label>
										<div class="col-mi-4">
											<input type="password" id="confirmpwd" name="confirmpwd" class="form-control">
										</div>
									</div>
									
									<div class="row">
										<p class="col-mi-9 col-mi-offset-3">
											<button type="submit" class="btn btn-custom-primary"><aebiz:showTitle titleId="basebusiness.showmessage.save"/></button>
											<button type="button" class="btn cancel"><aebiz:showTitle titleId="basebusiness.showmessage.cancel"/></button>
										</p>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
		
		<div class="push-sticky-footer"></div>
	</div>
	
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

	$(document).ready(function() {
		if(mobile!=""){
			$(".y_hasuremob").html(mobile.substring(0,3) + "****" + mobile.substring(7,11));
			mobileOrEmail=mobile;
			type="mobile";
		}else{
			$(".y_hasuremob").html(email.substring(0,1)+"****"+email.substring(email.indexOf("@")-1));
			mobileOrEmail=email;
			type="email";
		}

		$("#mainForm").validate({
			 rules: {
			 	code:{
					required : true ,
					remote :{
						url: "${pageContext.servletContext.contextPath}/usercenter/customer/checkValidateCode",
						type:"get",
						dataType:"json",
						data:{
							mobileOrEmail : mobileOrEmail,
							code : function(){
								return $("#code").val();
							}
						}
					}
				},
				newpwd:{
					required : true 
				},
				confirmpwd:{
					required : true ,
					equalTo : "#newpwd"
				}
	  		},
	        messages: {
				code:{
					required : "<aebiz:showTitle titleId="ucenter_changepwd_codeTip"/>" ,
					remote : "<aebiz:showTitle titleId="ucenter_changepwd_wrongCode"/>"
				},
				newpwd:{
					required : "<aebiz:showTitle titleId="ucenter_changepwd_newPwdTip"/>"
				},
				confirmpwd:{
					required : "<aebiz:showTitle titleId="ucenter_changepwd_confirmPwdTip"/>" ,
					equalTo :"<aebiz:showTitle titleId="ucenter_changepwd_wrongConfirmPwd"/>",
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
		
	});

	//获取短信或者邮箱验证码
	$("#getCode").click(function(){
		//执行倒计时方法
		time(this);
		//获取短信验证码并且将验证码更新到数据库
		var url="${pageContext.servletContext.contextPath}/usercenter/customer/getValidateCode";
		$.get(url,{"mobileOrEmail":mobileOrEmail,"type":type,"ranNum":Math.random()},function(data){
			if(data=="success"){
				$("#sendTip").show();
			}
		});
	});
	
	//倒计时方法
	var wait=60;
	function time(o) {
      if (wait == 0) {
    	  $("#sendTip").hide();
          o.removeAttribute("disabled");
          o.value = "<aebiz:showTitle titleId="ucenter_changepwd_getAuthCode"/>";
          wait = 60;
      } else {
          o.setAttribute("disabled", true);
          o.value = wait + "<aebiz:showTitle titleId="ucenter_changepwd_waitTime"/>";
          wait--;
          setTimeout(function() {time(o)},1000)
      }
  	}
	
	$(".cancel").click(function() {
		history.go(-1);
	});
</script>

</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>