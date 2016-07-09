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
  <script src="${pageContext.servletContext.contextPath}/static/frontpage/js/validation/jquery.validate.min.js"></script>
  <script src="${pageContext.servletContext.contextPath}/static/frontpage/js/validation/aebiz.validate.expand.js"></script> 
  <script src="${pageContext.servletContext.contextPath}/static/frontpage/js/validation/aebiz.passwdcheck.js"></script>
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
	  <h2>匿名用户激活</h2>
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
			
			<input type="hidden" name="loginName" id="loginName" value="${loginName}">
			<input type="hidden" name="pwdStrength" >
			<div class="y_succms">
				<h2 class="text-success">亲爱的 <span class="y_plr10">${loginName}</span>欢迎进入酷友商城,请完善以下资料完成账户的激活!</h2>
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
				<div class="y_resetbtnbx"><button id="updateInfo" onclick="updateInfo()" class="btn btn-custom">完成激活</button></div>
			</div>
		</div>
	</div>
</div>

<!--尾部  -->
<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleBottom.jsp" %>

<!-- END -->
<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/bootstrap.js"></script>
<script>

		function updateInfo(){
		var loginName = $("#loginName").val();
		var passWord = $("#passWord").val();
		var pwdStrength = $("#pwdStrength").val();
		var repeatPassWord = $("#repeatPassWord").val();
		var verificationCode = $("#verificationCode").val();
		var pwdStrength = $("#pwdStrength").val();
		var url="${pageContext.servletContext.contextPath}/customerregist/updateInfo";	
		$.getJSON(url,{loginName:loginName,loginName:loginName,passWord:passWord,pwdStrength:pwdStrength,repeatPassWord:repeatPassWord,verificationCode:verificationCode,ranNum:Math.random()},function(data){
			if(data=="success"){
				return(data);
				window.location.href="${pageContext.servletContext.contextPath}/customerregist/tosave?loginName="+loginName;
			}	
		});
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