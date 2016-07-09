<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<!doctype html>
<html>
<head>
	<title>重置密码成功</title>


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
		  <h2><aebiz:showTitle titleId="customer.findpwd4.title"/></h2>
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

	<div class="y_mt20 container">
		<div class="y_resetcont">
			<div class="y_resetstep y_restep4"></div>
			<div class="y_resetbx y_resetsucce">
				<div class="y_yzfsset"></div>
				<span class="y_succpic"><i></i></span>
				<div class="y_succms">
					<h2 class="text-success f_color1"><aebiz:showTitle titleId="customer.findpwd4.centerTip"/></h2>
					您现在可以<a class="f_color1" href="${pageContext.servletContext.contextPath}/customer/toLogin">立即登录</a> 
					或者返回<a class="f_color1" href="${pageContext.servletContext.contextPath}/">商城首页</a>
				</div>
			</div>
		</div>
	</div>

	<!--尾部  -->
	<%@ include file="/WEB-INF/jsp/userfront/common/platSimpleBottom.jsp" %>

</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>