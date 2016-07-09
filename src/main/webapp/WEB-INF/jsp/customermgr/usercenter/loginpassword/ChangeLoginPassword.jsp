<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->

    <%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>		
	<title><aebiz:showTitle titleId="ucenter_changepwd_title"/></title>
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
		<script src="${pageContext.servletContext.contextPath}/static/js/md5.js"></script>
		<!-- /top -->
		<div class="container">
			<div class="ku_crumbs">
				<a href="${pageContext.servletContext.contextPath}/customer/toIndex">首页</a><b>&gt</b><a href="${pageContext.servletContext.contextPath}/customer/toSecuritySetting">安全中心</a><b>&gt</b><span>修改登录密码</span>
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
										<a href="${pageContext.servletContext.contextPath}/customer/toIndex"><aebiz:showTitle titleId="ucenter_head_accountManage"/></a>
									</li>
									<li>
										<a href="${pageContext.servletContext.contextPath}/usercenter/customer/toSecuritySetting">
											<aebiz:showTitle titleId="ucenter_securitySet_safeCenter"/>
										</a>
									</li>
									<li class="active"><aebiz:showTitle titleId="ucenter_changepwd_title"/></li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
						</div>
						--%>
						<!-- main -->
						<input type="hidden" id="uuidHidden" value="${m.uuid}">
						<input type="hidden" id="mobileHidden" value="${m.mobile}">
						<input type="hidden" id="emailHidden" value="${m.email}">
						
						<div class="content ku_orderlist">
							<div class="main-header">
								<h2><aebiz:showTitle titleId="ucenter_changepwd_title"/></h2>
								<!-- <em>Change login password</em> -->
							</div>
							
							<div class="main-content">
								<form id="mainForm" class="form-horizontal y_setpassd form-validate" action="${pageContext.servletContext.contextPath}/tclcustomer/changepwd" method="post">
									<input type="hidden" name="customerUuid" value="${m.uuid}" id="hiddenCustomerUuid">
									<input type="hidden" name="pwdStrength" id="hiddenPwdStrength">
									
									<div class="form-group">
										<label for="password" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter_changepwd_originalPwd"/></label>
										<div class="col-mi-4">
											<input type="password" id="password" name="password" maxlength="20" class="form-control">
										</div>
									</div>
									
									<div class="form-group">
										<label for="newpwd" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter_changepwd_newPwd"/></label>
										<div class="col-mi-4 r_tishi">
											<input type="password" id="newpwd" name="newpwd" class="form-control passwordreg" placeholder="">
											<div id="pwdpower" class="paddword_leve paddword_leve_3" > 
												<span id="pweak" style=""><aebiz:showTitle titleId="system.m.pweak"/></span>
												<span id="pmedium" style=""><aebiz:showTitle titleId="system.m.pmedium"/></span>
												<span id="pstrong" style=""><aebiz:showTitle titleId="system.m.pstrong"/></span>
											</div>												
										</div>
									</div>
									
									<div class="form-group">
										<label for="confirmpwd" class="col-mi-3 control-label"><aebiz:showTitle titleId="ucenter_changepwd_confirmNewPwd"/></label>
										<div class="col-mi-4">
											<input type="password" id="confirmpwd" name="confirmpwd" class="form-control">
										</div>
									</div>

									<div class="row">
										<p class="col-mi-9 col-mi-offset-3 ku_btn">
											<button type="submit" class="btn btn-custom-primary"><aebiz:showTitle titleId="basebusiness.showmessage.save"/></button>
											<button type="button" class="btn btn-default cancel"><aebiz:showTitle titleId="basebusiness.showmessage.cancel"/></button>
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
<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/validation/jquery.validate.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/aebiz.passwdcheck.js"></script>
<script src="${pageContext.request.contextPath}/static/customermgr/usercenter/aebiz.validate.expand.js"></script>
<script src="${pageContext.request.contextPath }/static/usercenter/js/bootbox/jquery.bootbox.js"></script><!-- 点击删除表数据时的弹出提示框 -->
	
<script>
	var customerUuid=$("#uuidHidden").val()
	var mobile=$("#mobileHidden").val();
	var email=$("#emailHidden").val();
	var mobileOrEmail="";
	var type="";
	
	$(function() {

		$("#mainForm").validate({
			 rules: {
	  		 	password: {
					required : true,
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
	   			password: {
					required : "<aebiz:showTitle titleId="ucenter_changepwd_passwordTip"/>"
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
			},
			submitHandler:function(form){
				//提交之前加密
				var newpwd = hex_md5($("#newpwd").val());
				var password = hex_md5($("#password").val());
				$.post(
				    	"${pageContext.request.contextPath }/tclcustomer/changepwd",
				    	{"customerUuid":$("#hiddenCustomerUuid").val(),//用户uuid
							"newpwd":newpwd,//新密码
							"password":password,//旧密码
							"pwdStrength":$("#hiddenPwdStrength").val(),//密码强度
					    	ranNum:Math.random()},	
					    function(data) {	       
					       if(data=="true") {
					    	   window.location.href="${pageContext.servletContext.contextPath}/tclcustomer/toSingleLogin";
					  			//刷新
								//bootbox.alert('<aebiz:showTitle titleId="basebusiness.showmessage.opeOk"/>') ;
								//doSearch('search') ;     	
					       }else if(data=="error"){
					    	   //alert("原始密码不对");
					       		bootbox.alert("原始密码不对") ;
					       }else{
					    	   bootbox.alert("修改密码失败") ;
					    	  // alert("修改密码失败");
					       }
					    }
					);		
	        } 
		});

		//修改密码强弱校验  
		 $("#newpwd").change(function(e) {
			 var newpwd = $(this).val();
		 	 EvalPwd(newpwd) ;
		 	if(ClientSideStrongPassword(newpwd,gSimilarityMap,gDictionary))
		    {	
			    $("input[name='pwdStrength']:hidden").val("3");
		    }
		    else if(ClientSideMediumPassword(newpwd,gSimilarityMap,gDictionary))
		    {
			    $("input[name='pwdStrength']:hidden").val("2");
		    }
		    else if(ClientSideWeakPassword(newpwd,gSimilarityMap,gDictionary))
		    {
			    $("input[name='pwdStrength']:hidden").val("1");
		    }
		    else
		    {
			    $("input[name='pwdStrength']:hidden").val("0");
		    }
		 });  
		 
		 //修改密码强弱校验  
		 $("#newpwd").keyup(function(e) {
			 var newpwd = $(this).val();
		 	 EvalPwd(newpwd) ;
		 	if(ClientSideStrongPassword(newpwd,gSimilarityMap,gDictionary))
		    {	
			    $("input[name='pwdStrength']:hidden").val("3");
		    }
		    else if(ClientSideMediumPassword(newpwd,gSimilarityMap,gDictionary))
		    {
			    $("input[name='pwdStrength']:hidden").val("2");
		    }
		    else if(ClientSideWeakPassword(newpwd,gSimilarityMap,gDictionary))
		    {
			    $("input[name='pwdStrength']:hidden").val("1");
		    }
		    else
		    {
			    $("input[name='pwdStrength']:hidden").val("0");
		    }
		 });
	});
	
	$(".cancel").click(function() {
		history.go(-1);
	});
</script>

</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>