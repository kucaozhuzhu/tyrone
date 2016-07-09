<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.aebiz.b2b2c.baseframework.servicelocator.ServiceLocator" %>
<%@page import="java.util.*" %>

<!-- Validation 表单验证插件-->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/font-awesome.min.css">

<!-- 字体图标ie7兼容性处理 -->
<!--[if lt IE 8]>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/font-awesome-ie7.min.css">
<![endif]-->
<script>
	var jsContextPath = "${pageContext.servletContext.contextPath}";
</script>
<script src="${pageContext.servletContext.contextPath}/static/userfront/js/ajaxcart.js"></script>

<div class="y_rtfixbx">
	<div class="y_ifixed y_nologin">
		<div class="y_customer">
			<a class="y_rtbtn y_sugges" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=3153584354&site=qq&menu=yes"  title="在线客服"><b></b><p class="y_rcatnm">在线客服</p></a>
		</div>
		
		<div class="y_rtcart" id="w_cart">
			<b></b>
			<p class="y_rcatnm">购物车</p>
			<span class="y_rcatsize" id="cartsTotal">0</span>
			<div class="y_rtline"></div>
		</div>
		<p class="y_rtbtn y_totop" title="返回顶部"></p>
	</div>
	<div class="y_rtmsbx">
		<form action="${pageContext.servletContext.contextPath}/cart/cartshow" id="cartForm" method="post">
			<div id="shoppingCart" class="y_rtctbx">
				
			</div>
		</form>
	</div>
	<span class="y_closertms"></span>
	</div>
	
	<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/plat_right.js"></script>
	
	<%@ include file="/WEB-INF/jsp/common/quickDealerLogin.jsp"%>