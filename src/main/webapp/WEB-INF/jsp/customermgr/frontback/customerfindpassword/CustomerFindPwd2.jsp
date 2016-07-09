<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<!doctype html>
<html>
<head>
	 <title>验证身份</title>	
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
	<%--<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleTop.jsp" %>--%>
	
	
    <!-- 头部 header star -->
	<div class="w_1280 clearfix">
		<h1 class="y_logo">
		    <a href="${pageContext.servletContext.contextPath}/" title="aebiz"><img src="${pageContext.servletContext.contextPath}/static/frontpage/img/adimg/logo.png"></a>
		 </h1>
		<div class="w_page-title">
		  <h2><aebiz:showTitle titleId="customer.findpwd2.title"/></h2>
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
	<!--找回密码-->
	<div class="container">
	<!--找回密码-->
	
		<div class="y_resetcont">
			<div class="y_resetstep y_restep2"></div>
			<div class="y_resetbx">
				<form id="mainForm" action="${pageContext.servletContext.contextPath}/customerfindpwd/doStep2" method="post">
					<input type="hidden" id="uuid" name="uuid" value="${m.uuid}">
					<div class="y_yzfsset"></div>
					
					<div class="form-group">
						<label class="control-label" for="verifyType"><aebiz:showTitle titleId="customer.findpwd2.verifyType"/>：</label>
						<select id="verifyType" class="form-control" style="width: 266px;">
							<c:if test="${!empty m.mobile}"><option value="1"><aebiz:showTitle titleId="customer.findpwd2.mobileType"/></option></c:if>
							<c:if test="${!empty m.email}"><option value="2"><aebiz:showTitle titleId="customer.findpwd2.emailType"/></option></c:if>
						</select>
					</div>
					
					<div id="y_yzmobel" class="y_yzqhbox">
						<div class="form-group">
							<label class="control-label"><aebiz:showTitle titleId="customer.findpwd2.mobileVerifyTip"/>：</label>
							<input type="hidden" id="mobileHidden" value="${m.mobile}">
							<span id="mobileSpan" class="y_resetphone f_color2"></span>
							
							<a href="javascript:;"class="btn btn-custom3 y_dxbtn" id="getMobileCode"><aebiz:showTitle titleId="customer.findpwd2.getSMSCode"/></a>
							
							<span id="sendMobileCodeTip" class="fl" style="display:none">
								<i class="fa fa-check-circle-o text-success"></i>
								<aebiz:showTitle titleId="customer.findpwd2.sendMobileCodeTip"/>
							</span>
						</div>
						
						<div class="form-group">
							<label class="control-label" for="mobileCode"><aebiz:showTitle titleId="customer.findpwd2.SMSCode"/>：</label>
							<input type="text" required class="form-control w_60" id="mobileCode">
							<input type="hidden" id="checkMobileCode" value="false">
							
							<div id="mobileCodeError" class="has-tip f_color2"></div>
						</div>
						
						<div class="y_resetbtnbx">
							<a href="javascript:nextStep()" class="btn btn-custom3"><aebiz:showTitle titleId="basebusiness.showmessage.nextStep"/></a>
						</div>
					</div>
			
					<div id="y_yzemail" class="y_yzqhbox">
						<div class="form-group">
							<label class="control-label"><aebiz:showTitle titleId="customer.findpwd2.emailVerifyTip"/>：</label>
							<input type="hidden" id="emailHidden" value="${m.email}">
							<span id="emailSpan" class="y_resetphone f_color2"></span>
							
							<span id="sendValidateEmailTip" class="fl" style="display:none">
								<i class="fa fa-check-circle-o text-success"></i>
								<aebiz:showTitle titleId="customer.findpwd2.sendEmailCodeTip"/>
							</span>
						</div>
						
						<div class="y_resetbtnbx">
							<a href="javascript:;"  id="sendValidateEmail" class="btn btn-custom3"><aebiz:showTitle titleId="customer.findpwd2.sendValidateEmail"/></a>
						</div>
					</div>
				</form>
			</div>
		

		
		</div>


	<!--尾部  -->
	<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleBottom.jsp" %>
	
<script>
	var customerUuid=$("#uuid").val();
	var codeHidden="";
	
	$(function(){
		var mobile=$("#mobileHidden").val();
		var email=$("#emailHidden").val();
		
		if(mobile!=""){
			$("#mobileSpan").html(mobile.substring(0,3)+"****"+mobile.substring(7,11));
		}

		if(email!=""){
			var index=email.indexOf("@");
			var prefix = email.substring(0,index);
			if(prefix.length >=4){
				$("#emailSpan").html(email.substring(0,2)+"****"+email.substring(index-2,index)+email.substring(index));
			}else{
				$("#emailSpan").html(email.substring(0,1)+"****"+email.substring(index-1,index)+email.substring(index));
			}
		}
		
		//选择验证类型：手机或者邮箱验证
		if($("#verifyType").val()=="1"){
			$("#y_yzmobel,y_yzmobeltxt").show();
			$("#y_yzemail,y_yzemailtxt").hide();
		}else{
			$("#y_yzmobel,y_yzmobeltxt").hide();
			$("#y_yzemail,y_yzemailtxt").show();
		}
		
		//找回密码第二步，选择验证方式切换时事件
		var map={"1":"y_yzmobel","2":"y_yzemail"};
		$("#verifyType").bind("change", function(){
			var divId = map[this.value];
			$("#"+divId).show().siblings(".y_yzqhbox").hide();
			$("#"+divId+"txt").show().siblings(".y_resettext").hide();
		});
	});
	
	//点击获取手机验证码
	$("#getMobileCode").click(function(){
		time(this);
		var mobile=$("#mobileHidden").val();
		var url="${pageContext.servletContext.contextPath}/customerfindpwd/getMobileCode";
		$.get(url,{"customerUuid":customerUuid,"mobile":mobile,"ranNum":Math.random()},function(data){
			if(data=="success"){
				$("#sendMobileCodeTip").show();
			}
		});
	});
	
	//点击发送验证邮件
	$("#sendValidateEmail").click(function(){
		$("#sendValidateEmail").attr("disabled",true);
		var email=$("#emailHidden").val();
		var url="${pageContext.servletContext.contextPath}/customerfindpwd/sendValidateEmail";
		$.get(url,{"customerUuid":customerUuid,"email":email,"ranNum":Math.random()},function(data){
			if(data=="success"){
				$("#sendValidateEmailTip").show();
			}
		});
	});
	
	//点击下一步提交
	function nextStep(){
		var code = $("#mobileCode").val();
		checkMobileCode(code);
		
		if(codeHidden=="true"){
			$("#mainForm").submit();
		}
	}
	
	//校验手机验证码是否正确
	function checkMobileCode(code){
		if(code==""){
			$("#mobileCodeError").html("<aebiz:showTitle titleId="customer.findpwd1.randomCodeEmptyTip"/>");
			$("#checkMobileCode").val("false");
		}else{
			$("#mobileCode").keyup(function(){
				$("#mobileCodeError").html("");
			});
			
			var url="${pageContext.servletContext.contextPath}/customerfindpwd/checkMobileCode";
			$.ajaxSettings.async = false;
			$.get(url,{"customerUuid":customerUuid,"code":code,"ranNum":Math.random()},function(data){
				if(data=="true"){
					$("#mobileCodeError").html("");
					$("#checkMobileCode").val("true");
				}else{
					$("#mobileCodeError").html("<aebiz:showTitle titleId="customer.findpwd2.randomCodeError"/>");
					$("#checkMobileCode").val("false");
				}
			});
		}
		codeHidden=$("#checkMobileCode").val();
	}
</script>

<script type="text/javascript">
	//执行倒计时方法
	var wait=60;
	function time(o) {
	  	if (wait == 0) {
			$("#sendMobileCodeTip").hide();
		    o.removeAttribute("disabled");
		    o.value = "<aebiz:showTitle titleId="customer.findpwd2.getSMSCode"/>";
		    wait = 60;
	  	} else {
		    o.setAttribute("disabled", true);
		    o.value = wait + "<aebiz:showTitle titleId="customer.findpwd2.waitSixtys"/>";
		    wait--;
		    setTimeout(function() {time(o)},1000)
	    }
 	}
</script>
 
</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>