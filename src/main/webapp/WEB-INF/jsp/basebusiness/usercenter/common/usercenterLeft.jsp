<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- left sidebar 左侧导航 -->
<div class="col-xs-2 left-sidebar">
	<!-- main-nav -->
	<div class="main-nav">
		<ul class="main-menu">
			<li class="y_ltmenuop">
				<a href="#" class="js-sub-menu-toggle"><i class="fa fa-cog"></i><span class="text">账户管理</span><i class="toggle-icon fa fa-angle-down"></i></a>
				<ul class="sub-menu open">
					<li <c:if test="${pageName=='customer/toSecuritySetting' || pageName == 'customer/tochangepwd' || pageName == 'customer/toBindMobile' || pageName == 'customer/toBindEmail'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/customer/toSecuritySetting"><span class="text">安全中心</span></a></li>
					<li <c:if test="${pageName=='customercomplex/toModifyCustomerInfo' || pageName == 'customercomplex/toUploadImage'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/customercomplex/toModifyCustomerInfo"><span class="text">个人资料</span></a></li>
					<li <c:if test="${pageName=='customeraddress/toCustomerAddress'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/customeraddress/toCustomerAddress"><span class="text">收货地址</span></a></li>
					<li <c:if test="${pageName=='usercenter/normalinvoicesetting' || pageName== 'normalinvoicesetting/toAdd' || pageName== 'normalinvoicesetting/toUpdate'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/normalinvoicesetting/list/1/5"><span class="text">普通发票</span></a></li>
					<li <c:if test="${pageName=='addinvoicesetting/toManageAddInvoice'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/addinvoicesetting/toManageAddInvoice"><span class="text">增值税发票</span></a></li>
				</ul>
			</li>
			<li class="y_ltmenuop">
				<a href="#" class="js-sub-menu-toggle"><i class="fa fa-file-text"></i><span class="text">订单中心</span><i class="toggle-icon fa fa-angle-down"></i></a>
				<ul class="sub-menu open">
					<li <c:if test="${pageName=='1/list' || pageName=='productappraise/toAppraise' || pageName=='order/view'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/order/list/1/1/3?init=true"><span class="text">我的订单</span></a></li>
<%-- 			<li <c:if test="${pageName=='8/list'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/order/list/8/1/10?init=true"><span class="text">积分订单</span></a></li>
					<li <c:if test="${pageName=='order/cardlist'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/order/cardlist/1/10?init=true"><span class="text">宅配卡订单</span></a></li>
					<li <c:if test="${pageName=='7/cardlist'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/order/list/7/1/10?init=true"><span class="text">匿名订单</span></a></li> --%>
					<li <c:if test="${pageName=='productappraise/toMyAppraise'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/productappraise/toMyAppraise/1/3?init=true"><span class="text">我的评价</span></a></li>
<%-- 			<li <c:if test="${pageName=='ordershow/toMyOrderShow'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/ordershow/toMyOrderShow/1/10?init=true"><span class="text">我的晒单</span></a></li> --%>
					<li <c:if test="${pageName=='afterSale/list' || pageName=='afterSale/view' || pageName=='afterSale/toModify'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/afterSale/list/1/3?init=true"><span class="text">退款/退换货</span></a></li>
					<li <c:if test="${pageName=='unproductAppraiseList/list'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/productappraise/toUnAppraiseList/1/3"><span class="text">待评价的商品</span></a></li>
					<li <c:if test="${pageName=='coupondetails/list'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/coupondetails/toList"><span class="text">我的优惠券</span></a></li>
				</ul>
			</li>
			<li class="y_ltmenuop">
				<a href="#" class="js-sub-menu-toggle"><i class="fa fa-star"></i><span class="text">关注中心</span><i class="toggle-icon fa fa-angle-down"></i></a>
				<ul class="sub-menu open">
					<li <c:if test="${pageName=='productfavorite/toPage'}">class="active"</c:if>><a href="${pageContext.servletContext.contextPath}/usercenter/productfavorite/toPage?init=true"><span class="text">收藏的商品</span></a></li>
					<!-- 
						<li><a href="店铺收藏.html"><span class="text">收藏的店铺</span></a></li>
						<li><a href="购买过的店铺.html"><span class="text">购买过的店铺</span></a></li>
						<li><a href="浏览历史.html"><span class="text">浏览历史</span></a></li>
					-->
				</ul>
			</li>
		</ul>
	</div>
	<!-- /main-nav -->
<!--
	<div class="sidebar-minified js-toggle-minified">
		<i class="fa fa-angle-left"></i>
	</div>
	-->
</div>
<!-- end left sidebar -->