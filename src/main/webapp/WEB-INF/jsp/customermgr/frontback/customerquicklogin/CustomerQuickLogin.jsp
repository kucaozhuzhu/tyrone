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
<div class="header-top">
    <div class="container">
        <div class="fl">
        	<a class="y_sc" href="#"><b></b>收藏全网</a>
        	您好，欢迎来到全网商城！ <a href="#" class="y_mlr5">请登录</a> <a href="#" class="y_mlr5">免费注册</a>
        </div><!-- End .header-top-left -->
        <ul class="fr">
      		<li class="y_headrli"><a href="#" class="y_plr10">我的订单</a></li>
      		<li class="y_headrli">
      			<span data-toggle="dropdown" class="dropdown-toggle"><i class="fa fa-mobile"></i> 手机全网 <i class="fa fa-angle-down"></i></span>
      			<s></s>
            <div role="menu" class="dropdown-menu">
            	<img width="150" src="${pageContext.servletContext.contextPath}/static/frontpage/img/y_wx.jpg">
            	<p class="y_smewm">扫一扫，有惊喜！</p>
          	</div>
      		</li>
      		<li class="y_headrli">
      			<span data-toggle="dropdown" class="dropdown-toggle">收藏夹 <i class="fa fa-angle-down"></i></span>
      			<s></s>
            <ul role="menu" class="dropdown-menu">
              <li><a href="#">收藏的商品</a></li>
              <li><a href="#">收藏的店铺</a></li>
          	</ul>
      		</li>
      		<li class="y_headrli">
      			<span data-toggle="dropdown" class="dropdown-toggle">商家支持 <i class="fa fa-angle-down"></i></span>
      			<s></s>
            <div role="menu" class="dropdown-menu y_stodrop">
              <dl class="y_topdropdl">
              	<dt>商家</dt>
              	<dd><a href="#">商家中心</a></dd>
              	<dd><a href="#">商家入驻</a></dd>
              	<dd><a href="#">商家工具</a></dd>
              	<dd><a href="#">商家规则</a></dd>
              </dl>
              <p class="y_topline"></p>
              <dl class="y_topdropdl">
              	<dt>帮助</dt>
              	<dd><a href="#">帮助中心</a></dd>
              </dl>
          	</div>
      		</li>
      		<li class="y_headrli"><a href="#" class="y_plr10">会员俱乐部</a></li>
      		<li class="y_headrli">
      			<span data-toggle="dropdown" class="dropdown-toggle"><i class="fa fa-th-list"></i> 网站导航 <i class="fa fa-angle-down"></i></span>
      			<s></s>
            <div role="menu" class="dropdown-menu y_wzdhdrop">
              <p class="y_drophot"><a href="#">月饼</a><a href="#">秋装</a><a href="#">团购</a><a href="#">母婴</a><a href="#">0元乐购</a></p>
              <p class="y_topline"></p>
              <dl>
              	<dt>购物</dt>
              	<dd><a href="#">服饰</a></dd>	
              	<dd><a href="#">图书</a></dd>	
              	<dd><a href="#">办公直通车</a></dd>	
              	<dd><a href="#">视频购物</a></dd>	
              	<dd><a href="#">品牌街</a></dd>	
              	<dd><a href="#">礼品卡</a></dd>	
              	<dd><a href="#">电子书</a></dd>	
              </dl>
              <p class="y_topline"></p>
              <dl>
              	<dt>生活</dt>
              	<dd><a href="#">商旅</a></dd>	
              	<dd><a href="#">保险</a></dd>	
              	<dd><a href="#">彩票</a></dd>	
              	<dd><a href="#">水电煤</a></dd>	
              	<dd><a href="#">游戏</a></dd>	
              	<dd><a href="#">PPTV下载</a></dd>
              </dl>
              <p class="y_topline"></p>
              <dl>
              	<dt>服务</dt>
              	<dd><a href="#">应用商店</a></dd>	
              	<dd><a href="#">全网云</a></dd>	
              	<dd><a href="#">社区</a></dd>	
              	<dd><a href="#">客户端</a></dd>	
              	<dd><a href="#">对公销售</a></dd>	
              	<dd><a href="#">会员联盟</a></dd>	
              	<dd><a href="#">商家入驻</a></dd>	
              </dl>
              <p class="y_topline"></p>
              <p>服务热线：<span class="f_color1">400-6060-980</span></p>
          	</div>
      		</li>
        </ul><!-- End .header-top-right -->
    </div><!-- End .container -->
</div>
<!-- 头部bar end -->

<!-- 头部 header star -->
<div class="w_990">
	<h1 class="y_logo">
    <a href="index.html" title="aebiz"><img src="${pageContext.servletContext.contextPath}/static/frontpage/img/adimg/logo.png"></a>
  </h1>
	<div class="w_page-title">
	  <h2>欢迎登录</h2>
	</div>
</div>
<div class="w_990">
	<div class="y_resigetcont">
		<div class="y_resiget_r">
			<img src="${pageContext.servletContext.contextPath}/static/frontpage/img/adimg/registerPic.png">
			<p class="ts"> <button class=" btn btn-primary" id="quickLogin">登录</button></p>
		</div>
</div>
<!-- 头部 header end -->


<%@ include file="/WEB-INF/jsp/common/quickLogin.jsp"%>



<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/bootstrap.js"></script>

<script>
	$(document).ready(function(){
			
			
	})
	$("#quickLogin").click(function(){
		$("#modal-login-form").modal();
	})
	
	
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