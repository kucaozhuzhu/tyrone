<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<!doctype html>
<html>
<head>
	<title>找回密码</title>
	<!-- 字体图标ie7兼容性处理 -->
	<!--[if lt IE 8]>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/font-awesome-ie7.min.css">
	<![endif]-->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/global.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/login.css">
	
	<!--- jQuery -->
	<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/jquery-1.11.1.min.js"></script>

	<!--[if lt IE 9]>
    <script src="${pageContext.servletContext.contextPath}/static/frontpage/js/respond.min.js"></script>
 	<![endif]-->
  
    <!-- Favicon and Apple Icons -->
    <link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/static/frontpage/img/icon.png">
    
</head>
<body>
	<!-- 头部 bar star -->
	<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleTop.jsp" %>
	

	<!--找回密码-->
	<div class="container">
		<div class="y_resetcont">
			<div class="y_resetstep y_restep1"></div>
			<div class="y_resetbx">
				<form id="mainForm" action="${pageContext.servletContext.contextPath}/customerfindpwd/doStep1" method="post">
					<p class="y_yzfsset"></p>
					<div class="form-group">
						<label class="control-label" for="accountName"><aebiz:showTitle titleId="customer.findpwd1.accountName"/>：</label>
						<input type="text" class="form-control" id="accountName" name="accountName" placeholder="<aebiz:showTitle titleId="customer.findpwd1.accountNameTip"/>"> 
						<input type="hidden" id="checkAccountName" name="checkAccountName" value="false">
						
						<div id='accountNameError' class="has-tip f_color2"></div>
					</div>
						
					<div class="form-group y_yzmgrop">
						<label class="control-label" for="sususeryzm"><aebiz:showTitle titleId="customer.findpwd1.randomCode"/>：</label>
						<div class="clearfix">
							<input type="text" required class="form-control w_60" id="verificationCode" name="verificationCode">
							<input type="hidden" id="checkVerificationCode" name="checkVerificationCode" value="false">
							
							<a href="javascript:flushValidateCode();" class="m_pic"><img id="validateImg" src="${pageContext.servletContext.contextPath}/getStoreFindPwdCode"></a>
							<span><aebiz:showTitle titleId="customer.findpwd1.invisibility"/><a class="f_color2" href="javascript:flushValidateCode();"><aebiz:showTitle titleId="customer.findpwd1.another"/></a></span>
							
							<div id='codeError' class="has-tip f_color2"></div>
						</div>
					</div>
						
					<div class="y_resetbtnbx">
						<a href="javascript:nextStep()" class="btn btn-custom3"><aebiz:showTitle titleId="basebusiness.showmessage.nextStep"/></a>	
					</div>
				</form>
			</div>
		</div>
	</div>

	<!--尾部  -->
	<%@ include file="/WEB-INF/jsp/userfront/common/platBottom.jsp" %>

<script>
	var nameHidden="";
	var codeHidden="";

	//换一张，验证码
	function flushValidateCode(){
		$("#validateImg").prop("src","${pageContext.servletContext.contextPath}/getStoreFindPwdCode?time=" + Math.random());
	}
	
	//点击下一步提交
	function nextStep(){
		var accountName = $("#accountName").val();
		var code =$("#verificationCode").val();
		
		checkAccountName(accountName);
		checkVerificationCode(code);
		
		if(nameHidden=="true"&&codeHidden=="true"){
			$("#mainForm").submit();
		}
	}
	
	//校验账户名称
	function checkAccountName(accountName){
		if(accountName==""){
			$("#accountNameError").text("<aebiz:showTitle titleId="customer.findpwd1.accountNameEmptyTip"/>");
			$("#checkAccountName").val("false");
		}else{
			$("#accountName").keyup(function(){
				$("#accountNameError").text("");
			});
			
			var url="${pageContext.servletContext.contextPath}/customerfindpwd/checkAccountName";
			$.ajaxSettings.async = false;
			$.get(url,{"accountName":accountName,"ranNum":Math.random()},function(data){
				if(data=="true"){
					$("#accountNameError").text("");
					$("#checkAccountName").val("true");
				}else{
					$("#accountNameError").text("<aebiz:showTitle titleId="customer.findpwd1.accountNameNotExist"/>");
					$("#checkAccountName").val("false");
				}
			});
		}
		nameHidden=$("#checkAccountName").val();
	}
	
	//校验随机验证码
	function checkVerificationCode(code){
		if(code==""){
			$("#codeError").text("<aebiz:showTitle titleId="customer.findpwd1.randomCodeEmptyTip"/>");	
			$("#checkVerificationCode").val("false");
		}else{
			$("#verificationCode").keyup(function(){
				$("#codeError").text("");
			});
			
			var url="${pageContext.servletContext.contextPath}/customerfindpwd/checkVerificationCode";
			$.ajaxSettings.async = false;
			$.get(url,{"verificationCode":code,"ranNum":Math.random()},function(data){
				if(data=="true"){
					$("#codeError").text("");
					$("#checkVerificationCode").val("true");
				}else{
					$("#codeError").text("<aebiz:showTitle titleId="customer.findpwd1.randomCodeError"/>");
					$("#checkVerificationCode").val("false");
				}
			});
		}
		codeHidden=$("#checkVerificationCode").val();
	}
</script>

</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>