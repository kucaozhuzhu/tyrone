<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<!doctype html>
<html>
<head>
	<title>重置密码</title>	


	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/global.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/login.css">
	
	<!--- jQuery -->
	<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/validation/aebiz.passwdcheck.js"></script> 
	
	<!--[if lt IE 9]>
    <script src="${pageContext.servletContext.contextPath}/static/frontpage/js/respond.min.js"></script>
 	<![endif]-->
  
    <!-- Favicon and Apple Icons -->
    <link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/static/frontpage/img/icon.png">
    
</head>

<body>
	<!-- 头部 bar star -->
	<%--<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleTop.jsp" %>--%>
	
	<!-- 头部 header star -->
	<div class="w_1280 clearfix">
		<h1 class="y_logo">
		    <a href="${pageContext.servletContext.contextPath}/" title="aebiz"><img src="${pageContext.servletContext.contextPath}/static/frontpage/img/adimg/logo.png"></a>
		 </h1>
		<div class="w_page-title">
		  <h2><aebiz:showTitle titleId="customer.findpwd3.title"/></h2>
		</div>
		<div class="fr forget_secret">
		    <div class="w_attestation"><img src="${pageContext.servletContext.contextPath}/static/frontpage/img/adimg/icon01.png"/></div>
		    <div class="fr">
		    	<div class="fl w_cart"> <!--如果还没有登录则添加类名 .w_nologin-->
					<img src="${pageContext.servletContext.contextPath}/static/frontpage/img/adimg/icon_gwc.png" alt=""/>
					<div class="arrow_top"></div>
				    <div class="no_logintc">
				    	好像还未登录！<a class="now_login" href="#">马上登录</a> 查看购物袋吧！
				    </div>
				</div>	
				<div class="w_search">
					<input type="text" value="" placeholder='搜“食品安全课堂”'><a class="btn btn-custom" href="#"><i class="fa fa-search"></i></a>
					<p class="clearfix">热门搜索：<a href="#">有机食品</a><a href="#">食品安全</a><a href="#">社区特供</a></p>
				</div>
		    </div>
		    
		</div>
	</div>
	<!-- 头部 header end -->
    <!-- nav导航部分   star-->
    <div class="w_navandmeun w_forget_secret_nav y_mb20">
    	<ul class="menu clearfix">
			<li class="y_active"><a href="index.html">首页</a></li><!--选中当前频道的类 y_active-->
			<li class="mega-menu-container"><a href="#">优食团</a></li>
			<li><a href="#">优食配</a></li>
			<li><a href="#">促销活动</a></li>
			<li><a href="#">礼品卡</a></li>
			<li><a href="#">食品安全课堂</a><span class="icon"></span></li>
			<li><a href="#">食品安全联盟</a></li>
		</ul>
    </div>
	<!--nav导航部分   end-->
     
	<div class="container y_mt20">
		<div class="y_resetcont">
			<div class="y_resetstep y_restep3"></div>
			
			<div class="y_resetbx">
				<form id="mainForm" action="${pageContext.servletContext.contextPath}/customerfindpwd/doStep3" method="post">
					<input type="hidden" name="uuid" value="${m.uuid}">
					<input type="hidden" name="pwdStrength">
					
					<div class="y_yzfsset"></div>
					
					<div class="form-group">
						<label class="control-label" for="newpwd"><aebiz:showTitle titleId="customer.findpwd3.newPassword"/>：</label>
						<div class="fl">
							<input type="password" required class="form-control" id="newpwd" name="newpwd" oncontextmenu="return false;" oncopy="return false;" oncut="return false;" onpaste="return false;" placeholder="<aebiz:showTitle titleId="customer.findpwd3.passwordTip"/>">
							<input type="hidden" id="checkPwd" value="false">
							<div id="pwdError" class="f_color2"></div>
						</div>
						
						<div  id="pwdpower" class="paddword_leve paddword_leve_3" > 
							<span id="pweak" style=""><aebiz:showTitle titleId="system.m.pweak"/></span>
							<span id="pmedium" style=""><aebiz:showTitle titleId="system.m.pmedium"/></span>
							<span id="pstrong" style=""><aebiz:showTitle titleId="system.m.pstrong"/></span>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label" for="confirmpwd"><aebiz:showTitle titleId="customer.findpwd3.confirmPassword"/>：</label>
						<div class="fl">
							<input type="password" required class="form-control" id="confirmpwd" oncontextmenu="return false;" oncopy="return false;" oncut="return false;" onpaste="return false;" placeholder="<aebiz:showTitle titleId="customer.findpwd3.confirmTip"/>">
							<input type="hidden" id="checkConfirmPwd" value="false">
							<div id="confirmPwdError" class="f_color2"></div>
						</div>
					</div>
					
					<div class="y_resetbtnbx">
						<a href="javascript:nextStep();" class="btn btn-custom3"><aebiz:showTitle titleId="basebusiness.showmessage.nextStep"/></a>
					</div>
				</form>
			</div>
		
			
		</div>
	</div>

	<!--尾部  -->
	<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleBottom.jsp" %>
	
<script>
	var pwdHidden="";
	var confirmHidden="";

	//点击下一步提交
	function nextStep(){
		var newpwd=$("#newpwd").val();
		var confirmPwd=$("#confirmpwd").val();
		
		checkNewPwd(newpwd);
		checkConfirmPwd(newpwd,confirmPwd);
		
		if(pwdHidden=="true"&&confirmHidden=="true"){
			$("#mainForm").submit();
		}
	}
	
	function checkNewPwd(newpwd){
		var reg=/^[a-zA-Z0-9_-]{6,18}$/;
		if(newpwd==""){
			$("#checkPwd").val("false");
			$("#pwdError").html("<aebiz:showTitle titleId="customer.findpwd3.newPwdEmptyTip"/>");
		}else{
			$("#newpwd").keyup(function(){
				$("#pwdError").html("");
			});
			
			if(reg.test(newpwd)){
				$("#checkPwd").val("true");
				$("#pwdError").html("");
			}else{
				$("#checkPwd").val("false");
				if(newpwd.length<6||newpwd.length>20){
					$("#pwdError").html("<aebiz:showTitle titleId="customer.findpwd3.newPwdLengthTip"/>");
				}else{
					$("#pwdError").html("<aebiz:showTitle titleId="customer.findpwd3.newPwdErrorTip"/>");
				}
			}
		}
		pwdHidden=$("#checkPwd").val();
	}
	
	function checkConfirmPwd(newpwd,confirmPwd){
		if(confirmPwd==""){
			$("#checkConfirmPwd").val("false");
			$("#confirmPwdError").html("<aebiz:showTitle titleId="customer.findpwd3.confirmTip"/>");
		}else{
			$("#confirmpwd").keyup(function(){
				$("#confirmPwdError").html("");
			});
			
			if(newpwd!=confirmPwd){
				$("#checkConfirmPwd").val("false");
				$("#confirmPwdError").html("<aebiz:showTitle titleId="customer.findpwd3.confirmNotEqualsTip"/>");
			}else{
				$("#checkConfirmPwd").val("true");
				$("#confirmPwdError").html("");
			}
		}
		confirmHidden=$("#checkConfirmPwd").val();
	}
	
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
</script>

</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>