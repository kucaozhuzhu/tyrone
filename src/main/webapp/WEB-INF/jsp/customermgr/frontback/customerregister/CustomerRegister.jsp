<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<!doctype html>
<html>
<head>
	<title>会员注册</title>
	<meta name="description" content="会员注册">	
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/font-awesome.min.css">
	<!-- 字体图标ie7兼容性处理 -->
	<!--[if lt IE 8]>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/font-awesome-ie7.min.css">
	<![endif]-->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/global.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/login.css">
	
	<!--- jQuery -->
	<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/jquery-1.11.1.min.js"></script>
	<!-- Validation 表单验证插件-->
		<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/validation/jquery.validate.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/validation/aebiz.validate.expand.js"></script> 
	<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/validation/aebiz.passwdcheck.js"></script> 

</head>

<body class="bg_f5">

<!-- 头部 bar star -->
<%--<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleLogoTop.jsp" %>--%>

<!-- 头部 header star -->
<div class="login_header clearfix">
 <div class="w_1280">
	<h1 class="y_logo">
		<a href="${pageContext.request.contextPath }/" title="<aebiz:platConfig codeName='platName'/>"><img src="<aebiz:platConfig codeName='platLogoPath'/>"></a>
	</h1>
  <div class="w_selectarea">
		<div class="w_hoverarea">
				<a class="w_current" href="#"><span class="this_city">北京</span><i class="fa fa-caret-down fr"></i></a>
					<div class="w_area">
						<span>热门城市：</span>
						<p><a href="#">北京</a><a href="#">上海</a><a href="#">天津</a><a href="#">广州</a><a href="#">东京</a><a href="#">深证</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">北京</a><a href="#">上海</a><a href="#">天津</a><a href="#">广州</a><a href="#">东京</a><a href="#">深证</a><a href="#">北京</a></p>
					  <a class="w_more_city" href="#">更多城市</a>
			    </div>
       </div>
       <h3 class="second_title">一个只做食品安全的网站</h3>
       </div>
	<div class="w_page-title">
	  <h2>欢迎注册</h2>
	</div>
  <div class="w_attestation fr"><img src="${pageContext.request.contextPath }/static/frontpage/img/adimg/icon_renzhengs.jpg"/></div>
 </div>
</div>
				<!--地区选择效果-->
				<script type="text/javascript">
					//触碰盒子的切换
					$(".w_selectarea .w_hoverarea").hover(function(){
						$(this).find(".fa").addClass("fa-caret-up");
						$(this).find(".w_area").show(300);
						$(this).find(".w_area").slideDown(100);	
					},function(){
						$(this).find(".fa").removeClass("fa-caret-up");
						$(this).find(".w_area").hide(600);
						$(this).find(".w_area").slideUp(300);
					})
					//触碰盒子的切换
					$(".w_selectarea .w_area a").click(function(){
						var aText = $(this).text();
						$(this).parents(".w_selectarea").find(".this_city").text(aText);
						$(this).parents(".w_selectarea").find(".fa").removeClass("fa-caret-up");
						$(this).parents(".w_area").hide(600);
						$(this).parents(".w_area").slideUp(300);
					})
				</script>

<!-- 头部 header end -->

<!-- 注册 star -->
<div class="w_1280">
	<div class="y_resigetcont">
		<!--<div class="y_resiget_r">
			<img src="${pageContext.servletContext.contextPath}/static/frontpage/img/adimg/registerPic.png">
			<p class="ts">我已经注册，现在就 <a class="f_color1" href="${pageContext.servletContext.contextPath}/customer/toLogin">登录</a></p>
			<div class="y_copeweb">
				使用合作网站帐号登录全网：
				<p><a href="#">QQ</a>|<a href="#">支付宝</a>|<a href="#">新浪微博</a>|<a href="#">淘宝</a></p>
			</div>
		</div>-->
    <div class="y_registerad"><a href="#"><img src="${pageContext.request.contextPath }/static/frontpage/img/adimg/y_registerad.jpg"></a></div>
		<form id="mainForm" action="${pageContext.servletContext.contextPath}/customerregist/save" method="post" >
			<input type="hidden" name="pwdStrength" >
			<div class="y_resiget">
				<div class="y_login_bar">
					<p class="fl">没有账号？ 请注册</p>
					<p class="fr">已有账号 <a href="${pageContext.servletContext.contextPath}/customer/toLogin" class="y_login">登录</a></p>
				</div>
				<div class="form-group">
					<input type="hidden" id="resigetNameType" name="resigetNameType" value=""/>
					<label class="control-label" for="resigetName"><span class="y_required">*</span><aebiz:showTitle titleId="customer.register.mobileOrEmail"/>：</label>
					<input id="resigetName"  name="resigetName" type="text" required class="form-control" placeholder="<aebiz:showTitle titleId="customer.register.mobileOrEmailSelectOne"/>">
					<input type="hidden" id="checkResigetName" name="checkResigetName" value="false"/>
					<p><span id="resigetNameError"></span></p>
				</div>
				
				<div class="form-group y_mobelyz" style="display:none">
					<label class="control-label" for="resigetmobeltxt"><span class="y_required">*</span><aebiz:showTitle titleId="customer.register.mobileCode"/>：</label>
					<input id="mobileCode" name="mobileCode" type="text" required class="form-control" id="resigetmobeltxt">
					<input type="hidden" id="checkMobileCode" name="checkMobileCode" value="false">
					<a id="sendMobileCode" class="btn btn-default" href="javascript:;"><aebiz:showTitle titleId="customer.register.sendMobileCode"/></a>
					<p><span id="mobileCodeError"></span></p>
				</div>
				
				<div class="form-group">
					<label class="control-label" for="customerName"><span class="y_required">*</span><aebiz:showTitle titleId="customer.m.customerName"/>：</label>
					<input id="customerName"  name="customerName" type="text" required class="form-control" maxlength="20" placeholder="<aebiz:showTitle titleId="customer.register.customerName"/>">
					<input type="hidden" id="checkCustomerName" name="checkCustomerName" value="false"/>
					<p><span id="customerNameError"></span></p>
				</div>
				
				<div class="form-group">
					<label class="control-label" for="resigetpas"><span class="y_required">*</span><aebiz:showTitle titleId="customer.register.setPassWord"/>：</label>
					<input id="passWord" name="passWord" type="passWord" required class="form-control" maxlength="20" placeholder="<aebiz:showTitle titleId="customer.register.passWordDesc"/>">
					<input type="hidden" id="checkPassWord" name="checkPassWord" value="false">
					<p>
	          <label>
		          <span id="pweak" class="bg_1"><aebiz:showTitle titleId="customer.register.pwd1"/></span>
		          <span id="pmedium" class="bg_2"><aebiz:showTitle titleId="customer.register.pwd2"/></span>
		          <span id="pstrong" class="bg_3"><aebiz:showTitle titleId="customer.register.pwd3"/></span>
	          </label>
						<span id="passWordError"></span>
					</p>
				</div>
				<div class="form-group">
					<label class="control-label" for="resigetpas2"><span class="y_required">*</span><aebiz:showTitle titleId="customer.register.confirmPassWord"/>：</label>
					<input id="repeatPassWord" name="repeatPassWord" type="password" required class="form-control" maxlength="20" placeholder="<aebiz:showTitle titleId="customer.register.pleaseSetPwd"/>">
					<input type="hidden" id="checkRepeatPassWord" name="checkRepeatPassWord" value="false">
					<p><span id="repeatPassWordError"></span></p>
				</div>
				<div class="form-group y_yzmgrop">
					<label class="control-label" for="sususeryzm"><span class="y_required">*</span><aebiz:showTitle titleId="customer.register.verificationCode"/>：</label>
					<div class="clearfix">
						<input id="verificationCode" name="verificationCode"  type="text" required class="form-control w_60">
						<input type="hidden" id="checkVerificationCode" name="checkVerificationCode" value="false">
						<a href="javascript:flushValidateCode();"><img id="validateImg" src="${pageContext.servletContext.contextPath}/getCustomerRegCode"></a>
						<span><aebiz:showTitle titleId="customer.register.notLook"/><a class="f_color2" href="javascript:flushValidateCode();"><aebiz:showTitle titleId="customer.register.changeOne"/></a></span>
					</div>
					<p><span id="verificationCodeError"></span></p>
				</div>
				<div class="y_resetbtnbx">
					<p class="y_yhzclab"><input id="agreement" name="agreement" type="checkbox"><aebiz:showTitle titleId="customer.register.agreement"/><a class="f_color1" data-toggle="modal" href="#modal-eamil-form"><aebiz:showTitle titleId="customer.register.agreementBook"/> </a></p>
					<a id="saveCustomerRegister" href="javascript:saveCustomerRegister();" class="btn btn-custom btn-lg btn-block disabled"><aebiz:showTitle titleId="customer.register.register"/></a>	
				</div>
			</div>
			<!-- <div class="y_resetbtnbx"><button id="saveMobile" class="btn btn-custom">保存资料</button></div> -->
		</form>
	</div>
</div>

<!--尾部  -->
<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleBottom.jsp" %>

<!-- 验证邮箱弹出框 -->
<div class="modal fade y_checkemail" id="modal-eamil-form" tabindex="-1" role="dialog">
	<form method="get" action="#">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 标题 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">协议说明</h4>
				</div>
				<!-- 中间结构 -->
				<div class="modal-body">
					<div class="modal-xy">
					<aebiz:platConfig codeName="customerReg"/>
					</div>
					<div class="y_resetbtnbx"><button id="agreeProtocol" class="btn btn-custom btn-lg btn-block" data-dismiss="modal">同意</button></div>
				</div>
			</div><!-- End .modal-content -->
		</div><!-- End .modal-dialog -->
	</form>
</div><!-- End 验证邮箱弹出框 -->

<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/bootstrap.js"></script>

<script>
	$(document).ready(function(){
			
			var error = "${error}";
			if(error != ""){
				alert(error);	
			}
			
			$("#resigetName").blur(function(){
				checkResigetName();
			});
			
			$("#sendMobileCode").click(function(){
				time($(this));
				sendMobileCode();
			});
			
			$("#mobileCode").blur(function(){
				checkMobileCode();
			});
			
			$("#customerName").blur(function(){
				checkCustomerName();
			});
			
			$("#passWord").blur(function(){
				checkPassWord();
			});
			
			$("#repeatPassWord").blur(function(){
				checkRepeatPassWord();
			});
			
			$("#verificationCode").blur(function(){
				checkVerificationCode();
			});
			$("#agreement").click(function(){
				if($(this).is(":checked")){
					$("#saveCustomerRegister").removeClass("disabled");	
				}else{
					$("#saveCustomerRegister").addClass("disabled");		
				}
			});
			$("#agreeProtocol").click(function(){
				$("#agreement").attr("checked",true);
				$("#saveCustomerRegister").removeClass("disabled");
			});

			//修改密码强弱校验  
			 $("#passWord").change(function(e) {
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
			 $("#passWord").keyup(function(e) {
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
	})
	
	//验证手机号/邮箱
	function checkResigetName(){
		var resigetName=$("#resigetName").val();	
		var mobile = /^1\d{10}$/;
		var email = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		if(mobile.test(resigetName)){
			$("#checkMobileCode").val("false");
			$(".y_mobelyz").hide();
			$("#resigetNameError").text("");
			$("#resigetNameType").val("mobile");
			existMobile(resigetName);
		}else if(email.test(resigetName)){
			$("#checkMobileCode").val("true");
			$(".y_mobelyz").hide();
			$("#resigetNameError").text("");
			$("#resigetNameType").val("email");
			existEmail(resigetName);
		}else{
			$(".y_mobelyz").hide();
			$("#resigetNameType").val("");
			$("#resigetNameError").text("<aebiz:showTitle titleId="customerregister.mobileOrEmail.resigetNameError"/>");
			$("#checkResigetName").val("false");	
		}	
	}
	
	function existMobile(mobile){
			var url="${pageContext.servletContext.contextPath}/customerregist/checkMobile";
			$.ajaxSettings.async = false;
			$.getJSON(url,{mobile:mobile,ranNum:Math.random()},function(data){
					if(data=="false"){
						$("#resigetNameError").text("");
						$("#checkResigetName").val("true");
						$(".y_mobelyz").show();
					}else{
						$("#resigetNameError").text("<aebiz:showTitle titleId="customerregister.mobile.exist"/>");
						$("#checkResigetName").val("false");
					}
			})
	}
	
	function existEmail(email){
			var url="${pageContext.servletContext.contextPath}/customerregist/checkEmail";
			$.ajaxSettings.async = false;
			$.getJSON(url,{email:email,ranNum:Math.random()},function(data){
					if(data=="false"){
						$("#resigetNameError").text("");
						$("#checkResigetName").val("true");
					}else{
						$("#resigetNameError").text("<aebiz:showTitle titleId="customerregister.email.exist"/>");
						$("#checkResigetName").val("false");
					}
			})
	}
	
	function checkCustomerName(){
		var customerName = $("#customerName").val();
		if(customerName==""){
			$("#customerNameError").text("<aebiz:showTitle titleId="customer.register.customerNameIsEmpty"/>");
			$("#checkCustomerName").val("false");	
			return;
		}
		if(customerName.length<4 || customerName.length>20){
			$("#customerNameError").text("<aebiz:showTitle titleId="customer.register.customerName"/>");
			$("#checkCustomerName").val("false");	
			return;	
		}
		var nameReg=/^[a-zA-Z0-9\u4e00-\u9fa5-_]{4,20}$/;
		if(nameReg.test(customerName)){
			var url="${pageContext.servletContext.contextPath}/customerregist/checkCustomerName";
			$.getJSON(url,{customerName:customerName,ranNum:Math.random()},function(data){
				if(data=="true"){
					$("#customerNameError").text("<aebiz:showTitle titleId="customer.register.customerNameExisted"/>");
					$("#checkCustomerName").val("false");	
					return;	
				}else{
					$("#customerNameError").text("");
					$("#checkCustomerName").val("true");
				}
			});	
		}else{
			$("#customerNameError").text("<aebiz:showTitle titleId="customer.register.customerName"/>");
			$("#checkCustomerName").val("false");	
			return;		
		}
	}
	
	function sendMobileCode(){
		var sendMobile = $("#resigetName").val();
		var url="${pageContext.servletContext.contextPath}/customerregist/sendMobileCode";	
		$.getJSON(url,{sendMobile:sendMobile,ranNum:Math.random()},function(data){
				
		})
	}
	
	//验证短信验证码
	function checkMobileCode(){
		var sendMobile = $("#resigetName").val();
		var mobileCode = $("#mobileCode").val();
		if(mobileCode != ""){
			$("#mobileCodeError").text("");
			var url="${pageContext.servletContext.contextPath}/customerregist/checkMobileCode";		
			$.ajaxSettings.async = false;
			$.getJSON(url,{sendMobile:sendMobile,mobileCode:mobileCode,ranNum:Math.random()},function(data){
					if(data=="true"){
						$("#mobileCodeError").text("");
						$("#checkMobileCode").val("true");
					}else{
						$("#mobileCodeError").text("<aebiz:showTitle titleId="customerregister.mobileCode.error"/>");
						$("#checkMobileCode").val("false");
					}
			})
		}else{
			$("#mobileCodeError").text("<aebiz:showTitle titleId="customerregister.mobileCode.isEmpty"/>!");	
			$("#checkMobileCode").val("false");
		}
	}
	
	//验证密码
	function checkPassWord(){
		var passWord = $("#passWord").val();
		if(passWord != ""){
			var pwdReg = /^[a-zA-Z0-9]{6,20}$/;
			if(pwdReg.test(passWord)){
				$("#passWordError").text("");	
				$("#checkPassWord").val("true");	
			}else{
				$("#passWordError").text("<aebiz:showTitle titleId="customerregister.passWord.error"/>");	
				$("#checkPassWord").val("false");	
			}
		}else{
			$("#passWordError").text("<aebiz:showTitle titleId="customerregister.passWord.again"/>");	
			$("#checkPassWord").val("false");
		}
	}
	
	//验证2次密码输入
	function checkRepeatPassWord(){
		var passWord = $("#passWord").val();
		var repeatPassWord = $("#repeatPassWord").val();
		if(passWord==repeatPassWord){
			$("#repeatPassWordError").text("");	
			$("#checkRepeatPassWord").val("true");
		}else{
			$("#repeatPassWordError").text("<aebiz:showTitle titleId="customerregister.confirmPassWord.error"/>");	
			$("#checkRepeatPassWord").val("false");
		}
	}
	
	//验证码校验
	function checkVerificationCode(){
		var verificationCode = $("#verificationCode").val();
		if(verificationCode != ""){
			var url="${pageContext.servletContext.contextPath}/customerregist/checkVerificationCode";
			$.ajaxSettings.async = false;
			$.getJSON(url,{verificationCode:verificationCode,ranNum:Math.random()},function(data){
					if(data=="true"){
						$("#verificationCodeError").text("");
						$("#checkVerificationCode").val("true");
					}else{
						$("#verificationCodeError").text("<aebiz:showTitle titleId="customerregister.verificationCodeError"/>");
						$("#checkVerificationCode").val("false");
					}
			})
		}else{
			$("#verificationCodeError").text("<aebiz:showTitle titleId="customerregister.verificationCode.isEmpty"/>");	
			$("#checkVerificationCode").val("false");	
		}			
	}
	
	//换一张，验证码
	function flushValidateCode(){
		var validateImgObject = document.getElementById("validateImg");
	 	validateImgObject.src = "${pageContext.servletContext.contextPath}/getCustomerRegCode?time=" + new Date();
	}
	
	function saveCustomerRegister(){
			checkResigetName();
			if("mobile"==$("#resigetNameType").val()){
				checkMobileCode();	
			}
			checkCustomerName();
			checkPassWord();
			checkRepeatPassWord();
			checkVerificationCode();
			
			var checkResigetName2 = $("#checkResigetName").val();
			var checkMobileCode2 = $("#checkMobileCode").val();
			var checkCustomerName2 = $("#checkCustomerName").val();
			var checkPassWord2 = $("#checkPassWord").val();
			var checkRepeatPassWord2 = $("#checkRepeatPassWord").val();
			var checkVerificationCode2 = $("#checkVerificationCode").val();

			if(checkResigetName2=="true"&& 
					checkMobileCode2=="true"&& 
					checkPassWord2=="true"&& 
					checkRepeatPassWord2=="true"&& 
					checkVerificationCode2=="true"&&
					checkCustomerName2=="true"){
				$("#mainForm").submit();
			}
	}
		
</script>
<script>
  var wait=60;
	function time(o) {
      if (wait == 0) {
          o.removeClass("disabled");
          o.text("<aebiz:showTitle titleId="customerregister.verificationCode.again"/>");
          wait = 60;
          $("#success").hide();
      } else {
          o.addClass("disabled");
          o.text(wait+"<aebiz:showTitle titleId="customerregister.verificationCode.againSend"/>");
          wait--;
          setTimeout(function() {
              time(o)
          },
          1000)
      }
  }
 </script>
</body>
</html>