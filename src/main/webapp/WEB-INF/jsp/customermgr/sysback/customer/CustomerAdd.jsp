<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!doctype html>
<html>

<%@ include file="/WEB-INF/jsp/basebusiness/common/import/AddImport.jsp" %>

<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.passwdcheck.js"></script> 
<script src="${pageContext.servletContext.contextPath}/static/customermgr/sysback/aebiz.validate.expand.js"></script> 

</head>

<body>
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1><aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/><aebiz:showTitle titleId="customer.moduleName_CN"/></h1>
			</div>
		</div>
		
		<div class="breadcrumbs">
			<ul>
				<li><span><aebiz:showTitle titleId="customer.menuOne"/></span><i class="fa fa-angle-right"></i></li>
				<li><span><aebiz:showTitle titleId="customer.menuTwo"/></span><i class="fa fa-angle-right"></i></li>
				<li><span><aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/><aebiz:showTitle titleId="customer.moduleName_CN"/></span></li>
			</ul>
		</div>	
		
		<div class="row">
			<div class="col-sm-12">
				<div class="box box-bordered bordered-top">
					<div class="box-content nopadding">
						<form id="mainForm" action="${pageContext.servletContext.contextPath}/sysback/customercomb/addCustomer" method="post" class='form-horizontal form-bordered'>
							<input type="hidden" name="pwdStrength">
							
							<div class="form-group">
								<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customer.m.customerName"/></label>
								<div class="col-sm-10">
									<div class="col-sm-4">
										<input type="text" name="customerName" class="form-control" maxlength="20">
									</div>
								</div>
							</div>
					
							<div class="form-group">
								<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customer.m.mobile" /></label>
								<div class="col-sm-10">
									<div class="col-sm-4">
										<input type="text" name="mobile" class="form-control" maxlength="11">
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customer.m.email"/></label>
								<div class="col-sm-10">
									<div class="col-sm-4">
										<input type="text" name="email" class="form-control">
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customer.m.password"/></label>
								<div class="col-sm-10">
									<div class="col-sm-4">
										<input type="password" id="password" name="password" class="form-control" maxlength="20">
									</div>
									
									<div id="pwdpower" class="paddword_leve paddword_leve_3" > 
										<span id="pweak" style=""><aebiz:showTitle titleId="system.m.pweak"/></span>
										<span id="pmedium" style=""><aebiz:showTitle titleId="system.m.pmedium"/></span>
										<span id="pstrong" style=""><aebiz:showTitle titleId="system.m.pstrong"/></span>
									</div> 	
								</div>
							</div>
							
							<div class="form-group">
								<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customer.m.confirmPwd"/></label>
								<div class="col-sm-10" id="confirmPwdError">
									<div class="col-sm-4">
										<input type="password" name="confirmPwd" class="form-control" maxlength="20">
									</div>
								</div>
							</div>
							
							<div class="form-actions col-sm-offset-2 col-sm-10">
								<button type="button" class="btn cancel"><aebiz:showTitle titleId="basebusiness.showmessage.return"/></button>
								<input type="submit" class="btn submit btn-primary" value="<aebiz:showTitle titleId="basebusiness.showmessage.nextStep"/>">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
	$(document).ready(function(){
		$("#mainForm").validate({
			 rules: {
				 customerName:{
						required : true,
						userNameReg : true,
						remote : {
							url:"${pageContext.servletContext.contextPath}/sysback/customercomb/checkCustomerNameExist",
							type:"get",
							dataType:"json",
							data:{
								customerName : function(){
									return $("input[name='customerName']").val();
								}
							}
						}
				},
				mobile:{
						required : true,
						mobilezh : true,
						remote : {
							url:"${pageContext.servletContext.contextPath}/sysback/customercomb/checkMobileExist",
							type:"get",
							dataType:"json",
							data:{
								mobile : function(){
									return $("input[name='mobile']").val();
								}
							}
						}
				},
				email:{
						required : true,
						email : true,
						remote : {
							url:"${pageContext.servletContext.contextPath}/sysback/customercomb/checkEmailExist",
							type:"get",
							dataType:"json",
							data:{
								email : function(){
									return $("input[name='email']").val();
								}
							}
						}
				},
				password:{
						required : true,
						passwordReg : true
				},
				confirmPwd:{
						required : true,
						equalTo : "#password"
				}
	  		},
	        messages: {
					customerName:{
						required : "请输入用户名",
						remote : "用户名已被注册，请重新输入用户名"
					},
					mobile:{
						required : "请输入手机号",
						remote : "手机号已被注册，请重新输入手机号"
					},
					email:{
						required : "请输入邮箱",
						email: "请输入正确的邮箱地址",
						remote : "邮箱已被注册，请重新输入邮箱"
					},
	   				password:{
						required : "请输入密码"
					},
					confirmPwd:{
						required : "请再次输入密码",
						equalTo :  "两次密码输入不一致，请重新输入"
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
	            form.submit();
	        }    
		});
		
		//修改密码强弱校验  
		 $("#password").change(function(e) {
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
		 $("#password").keyup(function(e) {
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
		
		$(".cancel").click(function(){
			history.go(-1) ;
		});
	});
	
</script>
	
</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>