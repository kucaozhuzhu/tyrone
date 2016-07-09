<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	  <meta charset="utf-8">
	  <title>会员登录</title>
	  <meta name="description" content="会员登录">
	  <!--[if IE]> <meta http-equiv="X-UA-Compatible" content="IE=edge"> <![endif]-->
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/frontpage/css/bootstrap.min.css">
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/frontpage/css/global.css">
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/frontpage/css/login.css">
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/frontpage/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/font-awesome.min.css">
    <!-- 字体图标ie7兼容性处理 -->
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/frontpage/css/font-awesome-ie7.min.css">
    <![endif]-->
	  <script src="${pageContext.request.contextPath }/static/frontpage/js/jquery-1.11.1.min.js"></script>
	  <!--[if lt IE 9]>
	    <script src="${pageContext.request.contextPath }/static/frontpage/js/respond.min.js"></script>
	  <![endif]-->
	   <!-- Favicon and Apple Icons -->
	  <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/static/frontpage/img/icon.png">
	  
</head>

<body class="bg_f5"><!--body背景色与默认不一样，为f5f5f5-->
<!--登录页简单的头部-->
<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleLogoTop.jsp" %>

<!--登录-->
<div class="y_loginbox">
	<div class="y_loginad"><a href="#"><img src="${pageContext.request.contextPath }/static/frontpage/img/adimg/login_ad.jpg"></a></div>
	<div class="y_loginrt">
		<div class="y_logbox">
			<div class="y_logintab">
				<h2>用户登录</h2>
			</div>
			
			<form action="${pageContext.request.contextPath }/customer/login" method='post' >
				<input type="hidden" id="hasVilidateCode" name="hasVilidateCode" value="${hasVilidateCode }">
				<input type="hidden" id="type" name="type" value="customer">
				<div class="y_suslgbx">
					<div class="form-group">
						<label class="control-label" for="sususername"><aebiz:showTitle titleId="customer.login.loginNameOrMobileOrEmail" /></label>
						<input type="text" class="form-control" id="loginName" name="loginName" value="${loginName }" onblur="isAnonymous()">
					</div>
					
					<div class="form-group">
						<label class="control-label" for="sususerpasd"><aebiz:showTitle titleId="customer.login.password" /></label>
						<input type="password" class="form-control" id="pwd" name="pwd" value="${pwd }">
					</div>
					
					<c:if test="${!empty More_Error_Msg}">
						<div class="form-group">
							<div class="alert alert-danger" id=>${More_Error_Msg } <a class="f_color" href="${pageContext.servletContext.contextPath}/customerfindpwd/toFindPwdStep1"><aebiz:showTitle titleId="customer.login.getpassword" /></a></div>
						</div>
					</c:if>
					
					<c:if test="${hasVilidateCode == 'true'  }">
						<div class="form-group y_yzmgrop">
								<label class="control-label" for="validateCode" ><aebiz:showTitle titleId="customer.findpwd1.randomCode" /></label>
								<div class="clearfix">
									<input type="text" class="form-control" id="validateCode" name="validateCode" value="${validateCode }">
									<img id="validateImg" src="${pageContext.servletContext.contextPath}/getCustomerLoginCode" onClick="javascript:flushValidateCode();"/>
									<span><aebiz:showTitle titleId="customer.register.notLook" />？<a class="f_color2" href="javascript:flushValidateCode();"><aebiz:showTitle titleId="customer.register.changeOne" /></a></span>
								</div>
						</div>
					</c:if>
					
					<c:if test="${!empty Error_Msg}">
						<div class="form-group">
							<div class="alert alert-danger" id=>${Error_Msg }</div>
						</div>
					</c:if>

					<div class="y_suskjbx">
						<a class="f_color2 fr" href="${pageContext.servletContext.contextPath}/customerregist/toRegister"><aebiz:showTitle titleId="customer.login.toreg" /></a>
						<label style="*vertical-align:bottom;*margin-top:-2px;">
							<c:if test="${remember =='on' }">
								<input type="checkbox" name="remember" id="remember" checked><aebiz:showTitle titleId="customer.login.rememberMe" />
							</c:if>
							<c:if test="${empty remember}">
								<input type="checkbox" name="remember" id="remember"><aebiz:showTitle titleId="customer.login.rememberMe" />
							</c:if>
						</label>
						<a class="f_color2" href="${pageContext.servletContext.contextPath}/customerfindpwd/toFindPwdStep1"><aebiz:showTitle titleId="customer.login.forgetpassword" /></a>
					</div>
					
					<button id="y_loadlogin" type="submit" class="btn btn-custom btn-lg btn-block" data-loading-text="<aebiz:showTitle titleId='customer.login.logining'/>"><aebiz:showTitle titleId="customer.login.login" /></button>
				</div>
			</form>
		</div>
	</div>
</div>

<!--简易底部-->
<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleBottom.jsp" %>
<script src="${pageContext.request.contextPath }/static/customermgr/frontshow/capsLock.js"></script>
<script src="${pageContext.request.contextPath }/static/frontpage/js/bootstrap.js"></script>
<script>
	//登录弹出框用户名、密码验证成功，点击登录按钮改变按钮文字的事件
/* 	$(function(){
		$('#y_loadlogin').on('click', function () {
		  var btn = $(this).button('loading'); //loading
		  //$btn.button('reset')  重置
		});	
	}); */
	
	/* 刷新验证码 */
	function flushValidateCode(){
		 var validateImgObject = document.getElementById("validateImg");
		 validateImgObject.src = "${pageContext.servletContext.contextPath}/getCustomerLoginCode?time=" + new Date();
	}

	$("#pwd").capsLockTip();
	
	function isAnonymous(){
		var loginName=$("#loginName").val();
		var url="${pageContext.servletContext.contextPath}/customer/isAnonymous";
		$.get(url,{"loginName":loginName,"ranNum":Math.random()},function(data){
			if(data=="success"){
				window.location.href="${pageContext.servletContext.contextPath}/customerregist/changeAnonymousStatus?loginName="+loginName;
			}
		});
	}
</script>
</body>
</html>