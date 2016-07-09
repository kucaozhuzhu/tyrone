<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<!doctype html>
<html>
<head>

  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/font-awesome.min.css">
  <!-- 字体图标ie7兼容性处理 -->
	<!--[if lt IE 8]>
	<link rel="stylesheet" href="css/font-awesome-ie7.min.css">
	<![endif]-->
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/global.css">
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/login.css">

  <!--- jQuery -->
  <script src="${pageContext.servletContext.contextPath}/static/frontpage/js/jquery-1.11.1.min.js"></script>

  <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>
  <![endif]-->
  
   <!-- Favicon and Apple Icons -->
  <link rel="icon" type="image/png" href="${pageContext.servletContext.contextPath}/static/frontpage/images/icons/icon.png">
  
</head>
<body class="bg_f5"><!--body背景色与默认不一样，为f5f5f5-->
<!-- 头部 bar star -->
<%--<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleTop.jsp" %>--%>

<!--登录页简单的头部-->
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
	  <h2>注册成功</h2>
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
<!--用户注册成功-->
<div class="w_1280">
	<div class="y_regiscont">
		<div class="y_regissucce">
			<span class="y_succpic"><i class="fa fa fa-check text-success"></i></span>
			<div class="y_succms">
				<h2 class="text-success"><aebiz:showTitle titleId="customer.register.congratula"/><span class="y_plr10">${resigetName}</span><aebiz:showTitle titleId="customer.register.success"/></h2>
				<a class="btn btn-custom2" href="${pageContext.servletContext.contextPath}/"><aebiz:showTitle titleId="customer.register.toShop"/></a>
				<div class="form-group y_hasbtn y_yzname2">
					<label class="control-label" for="regisname2"><aebiz:showTitle titleId="customer.register.nickName"/>：</label>
					<input id="nickName" name="nickName" type="text" class="form-control"/>
					<a class="btn btn-default" href="javascript:saveNickName();"><aebiz:showTitle titleId="customer.register.save"/></a>
					<span id="nickNameError" class="help-block font-error"></span>
				</div>
				<strong><aebiz:showTitle titleId="customer.register.successDesc1"/><span class="f_color2"><aebiz:showTitle titleId="customer.register.successDesc2"/></span></strong>
				
				<c:if test="${resigetNameType=='mobile'}">
					<div class="form-group">
						<label class="control-label" for="suseamil"><aebiz:showTitle titleId="customer.register.email"/>：</label>
						<input id="email" name="email" type="text" required class="form-control">
						<input type="hidden" id="checkEmail" value="false">
						<span class="help-block font-error" id="emailError"></span>
					</div>
					<div class="form-group y_hasbtn">
						<label class="control-label" for="resigetmobeltxt"><aebiz:showTitle titleId="customer.register.emailCode"/>：</label>
						<input id="emailCode" name="emailCode" type="text" required class="form-control w_110">
						<input type="hidden" id="checkEmailCode" value="false">
						<a class="btn btn-default" href="javascript:sendEmailCode();"><aebiz:showTitle titleId="customer.register.sendEmailCode"/></a>
						<span class="help-block font-error" id="emailCodeError"></span>
					</div>
					<div class="y_resetbtnbx"><button id="saveEmail" class="btn btn-custom"><aebiz:showTitle titleId="customer.register.checkNow"/></button></div>
				</c:if>
				<c:if test="${resigetNameType=='email'}">
					<div class="form-group">
						<label class="control-label" for="suseamil"><aebiz:showTitle titleId="customer.register.mobile"/>：</label>
						<input id="mobile" name="mobile" type="text" required class="form-control">
						<input type="hidden" id="checkMobile" value="false">
						<span class="help-block font-error" id="mobileError"></span>
					</div>
					<div class="form-group y_hasbtn">
						<label class="control-label" for="resigetmobeltxt"><aebiz:showTitle titleId="customer.register.mobileCode"/>：</label>
						<input id="mobileCode" name="mobileCode" type="text" required class="form-control w_110">
						<input type="hidden" id="checkMobileCode" value="false">
						<a id="sendMobileCode" class="btn btn-default" href="javascript:;"><aebiz:showTitle titleId="customer.register.sendMobileCode"/></a>
						<span class="help-block font-error" id="mobileCodeError"></span>
					</div>
					<div class="y_resetbtnbx"><button id="saveMobile" class="btn btn-custom"><aebiz:showTitle titleId="customer.register.checkNow"/></button></div>
				</c:if>
			</div>
		</div>
	</div>
</div>

<!--尾部  -->
<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleBottom.jsp" %>

<!-- END -->
<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/bootstrap.js"></script>
<script>

	$(document).ready(function(){
			
			$("#email").blur(function(){
				checkEmail();
			})
			
			$("#mobile").blur(function(){
				checkMobile();
			})
			
			$("#emailCode").blur(function(){
				checkEmailCode();
			})
			
			$("#mobileCode").blur(function(){
				checkMobileCode();
			})
			
			$("#sendMobileCode").click(function(){
				time($(this));
				sendMobileCode();
			});
			
			$("#saveEmail").click(function(){
				checkEmail();
				checkEmailCode();
				var checkEmail2 = $("#checkEmail").val();
				var checkEmailCode2 = $("#checkEmailCode").val();
				if(checkEmail2=="true" && checkEmailCode2=="true"){
					var uuid = "${m.uuid}";
					var email=$("#email").val();
					var url = "${pageContext.servletContext.contextPath}/customerregist/saveEmail"	;
					$.ajaxSettings.async = false;
					$.getJSON(url,{uuid:uuid,email:email,ranNum:Math.random()},function(data){
							if(data=="true"){
								$("#emailCodeError").text("<aebiz:showTitle titleId="customerregister.email.checkSucess"/>");
								$("#emailCode").val("");
								$("#checkEmailCode").val("false");
							}else{
								$("#emailCodeError").text("<aebiz:showTitle titleId="customerregister.email.checkFail"/>");
								$("#emailCode").val("");
								$("#checkEmailCode").val("false");
							}
					})
				}
			})
			
			$("#saveMobile").click(function(){
					checkMobile();
					checkMobileCode();
					
					var checkMobile2 = $("#checkMobile").val();
					var checkMobileCode2 = $("#checkMobileCode").val();
					
					if(checkMobile2=="true" && checkMobileCode2=="true"){
						var uuid = "${m.uuid}";
						var mobile=$("#mobile").val();
						var url = "${pageContext.servletContext.contextPath}/customerregist/saveMobile"	;
						$.ajaxSettings.async = false;
						$.getJSON(url,{uuid:uuid,mobile:mobile,ranNum:Math.random()},function(data){
								if(data=="true"){
									$("#mobileCodeError").text("<aebiz:showTitle titleId="customerregister.mobile.checkSuccess"/>");
									$("#mobileCode").val("");
									$("#checkMobileCode").val("false");
								}else{
									$("#mobileCodeError").text("<aebiz:showTitle titleId="customerregister.mobile.checkFail"/>");
									$("#mobileCode").val("");
									$("#checkMobileCode").val("false");
								}
						})
					}
			})
		})
		
	function checkEmail(){
		var email=$("#email").val();
		if(email != ""){
			var str = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			if(str.test(email)){
				var url="${pageContext.servletContext.contextPath}/customerregist/checkEmail";
				$.ajaxSettings.async = false;
				$.getJSON(url,{email:email,ranNum:Math.random()},function(data){
						if(data=="false"){
							$("#emailError").text("");
							$("#checkEmail").val("true");
						}else{
							$("#emailError").text("<aebiz:showTitle titleId="customerregister.email.exist"/>");
							$("#checkEmail").val("false");
						}
				})	
			}else{
				$("#emailError").text("<aebiz:showTitle titleId="customerregister.email.error"/>");
				$("#checkEmail").val("false");		
			}	
		}else{
			$("#emailError").text("<aebiz:showTitle titleId="customerregister.email.isEmpty"/>");	
			$("#checkEmail").val("false");
		}	
	}	
		
	function checkMobile(){
		var mobile=$("#mobile").val();
		if(mobile != ""){
			var str = /^1\d{10}$/;
			if(str.test(mobile)){
				var url="${pageContext.servletContext.contextPath}/customerregist/checkMobile";
				$.ajaxSettings.async = false;
				$.getJSON(url,{mobile:mobile,ranNum:Math.random()},function(data){
						if(data=="false"){
							$("#mobileError").text("");
							$("#checkMobile").val("true");	
						}else{
							$("#mobileError").text("<aebiz:showTitle titleId="customerregister.mobile.exist"/>");
							$("#checkMobile").val("false");	
						}
				})	
			}else{
				$("#mobileError").text("<aebiz:showTitle titleId="customerregister.mobile.error"/>");		
				$("#checkMobile").val("false");	
			}	
		}else{
			$("#mobileError").text("<aebiz:showTitle titleId="customerregister.mobile.isEmpty"/>");
			$("#checkMobile").val("false");	
		}	
	}
	
	function checkEmailCode(){
		var sendEmail=$("#email").val();
		var emailCode = $("#emailCode").val();
		if(emailCode != ""){
			$("#emailCodeError").text("");
			var url="${pageContext.servletContext.contextPath}/customerregist/checkEmailCode";		
			$.ajaxSettings.async = false;
			$.getJSON(url,{sendEmail:sendEmail,emailCode:emailCode,ranNum:Math.random()},function(data){
					if(data=="true"){
						$("#emailCodeError").text("");
						$("#checkEmailCode").val("true");
					}else{
						$("#emailCodeError").text("<aebiz:showTitle titleId="customerregister.emailCode.error"/>");
						$("#checkEmailCode").val("false");
					}
			})
		}else{
			$("#emailCodeError").text("<aebiz:showTitle titleId="customerregister.mobileCode.isEmpty"/>");	
			$("#checkEmailCode").val("false");
		}	
	}
	
	function checkMobileCode(){
		var sendMobile=$("#mobile").val();
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
			$("#mobileCodeError").text("<aebiz:showTitle titleId="customerregister.mobileCode.isEmpty"/>");	
			$("#checkMobileCode").val("false");	
		}	
	}
	
	function saveNickName(){
		var nickName = $("#nickName").val();
		if(nickName==""){
				$("#nickNameError").text("<aebiz:showTitle titleId="customerregister.nickName.isEmpty"/>");
				return ;
		}
		if(nickName.length>10){
				$("#nickNameError").text("<aebiz:showTitle titleId="customerregister.nickName.error"/>");
				return ;
		}
		var uuid = "${m.uuid}";
		var url = "${pageContext.servletContext.contextPath}/customerregist/saveNickName"	;
		$.ajaxSettings.async = false;
		$.getJSON(url,{uuid:uuid,nickName:nickName,ranNum:Math.random()},function(data){
				if(data=="true"){
					$("#nickNameError").text("<aebiz:showTitle titleId="customerregister.nickName.saveSuccess"/>");
				}else{
					$("#nickNameError").text("<aebiz:showTitle titleId="customerregister.nickName.saveFail"/>");
				}
		})
	}
	
	function sendEmailCode(){
		var sendEmail = $("#email").val();
		var url="${pageContext.servletContext.contextPath}/customerregist/sendEmailCode";	
		$.getJSON(url,{sendEmail:sendEmail,ranNum:Math.random()},function(data){
				
		})	
	}
	
	function sendMobileCode(){
		var sendMobile = $("#mobile").val();
		var url="${pageContext.servletContext.contextPath}/customerregist/sendMobileCode";	
		$.getJSON(url,{sendMobile:sendMobile,ranNum:Math.random()},function(data){
				
		})
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