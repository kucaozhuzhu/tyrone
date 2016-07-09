<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="com.aebiz.b2b2c.decorateplatform.util.PlatDfHelper" %>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->
	   <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/frontpage/css/font-awesome.min.css">


	<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>	
	<title><aebiz:showTitle titleId="ucenter_indexPage_title"/></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="description" content="KingAdmin - Bootstrap Admin Dashboard Theme">
	<meta name="author" content="The Develovers">
	<script src="${pageContext.request.contextPath }/static/usercenter/js/jquery.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/aebiz_global-0.1.js"></script>
	<%-- <script src="${pageContext.servletContext.contextPath}/static/usercenter/js/validation/aebiz.validate.expand.js"></script> --%>
</head>
<body>
	<!-- WRAPPER 头部、左侧、右侧大框架 -->

		<!--头部-->
 <%@ include file="/WEB-INF/jsp/userfront/common/platTop.jsp" %>
 <%=PlatDfHelper.getHTMLPage("t002", "p001",0,2, request) %>
 <script>
  //分类树隐藏
  $(".y_inproduall").removeClass("y_inproduall").addClass("y_produall");	
 </script>
 
 

<div class="container">
	<div class="ku_crumbs">
		<a href="${pageContext.servletContext.contextPath}/customer/toIndex">首页</a><b>&gt</b><span>个人中心</span>
	</div>
</div>

		<!-- BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT 左侧导航和右侧主体 -->
		<div class="bottom">
			<div class="container">
				<div class="row">
					<!-- left sidebar 左侧导航 -->
					<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterLeft.jsp"%>
					<!-- end left sidebar -->

					<!-- content-wrapper 右侧主体 -->
					<div class="col-xs-10 content-wrapper ku_member_right">
						<%--
						<div class="row">
							
							<div class="col-sm-4 ">
								<ul class="breadcrumb">
									<li>
										<i class="fa fa-home"></i>
										<a href="${pageContext.servletContext.contextPath}/customer/toIndex"><aebiz:showTitle titleId="ucenter_indexPage_membercenter"/></a>
									</li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
							
						</div>
						--%>
						<!-- main -->
						<div class="content">
							<div class="main-content">
							  	<!--会员信息-->
							  	<input type="hidden" id="uuidHidden" value="${m.uuid}">
							  	<input type="hidden" id="mobileHidden" value="${m.mobile}" >
							  	<input type="hidden" id="emailHidden" value="${m.email}" >
							  <!--	<input type="hidden" id="authStateHidden" value="${authState}"> -->
							  	
							  	<div class="ku_igrxx clearfix" id="member_ms">
							  		<div class="fl ku_igrxx_left">
							  			<!--<a href="${pageContext.servletContext.contextPath}/usercenter/customercomplex/toModifyCustomerInfo">-->
							  				<c:choose>
								  				<c:when test="${!empty customerInfo.imgUrl}">
								  					<img src="${customerInfo.imgUrl}">
								  				</c:when>
							  					<c:otherwise>
							  						<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/default.png">
							  					</c:otherwise>
							  				</c:choose>
							  				<%--<span class="y_bjzl"><aebiz:showTitle titleId="ucenter_indexPage_editInfo"/></span>--%>
							  			<!--</a>-->
							  		</div>
							  		
							  		<!--<p class="y_igdq"><span><i class="fa fa-map-marker"></i>北京</span></p>-->
									<div class="fl ku_igrxx_right">
										<p class="y_ignam"><a href="${pageContext.servletContext.contextPath}/usercenter/customercomplex/toModifyCustomerInfo">${customerInfo.nickName}</a></p>
										<div class="ku_grade">
											<b><aebiz:showTitle titleId="ucenter_indexPage_integral"/>:<span style="color: black;">${integral}</span></b> <br/>
											<b><aebiz:showTitle titleId="ucenter_indexPage_level"/>:<span style="color: black;">${customerShopLevel}</span></b>
										</div>
										<div class="ku_witness">
											<%-- <div class="fl">
												<aebiz:showTitle titleId="ucenter_indexPage_auth"/>:
												<a class="y_sj mobile" href="javascript:void(0);" rel="popover" data-content="" data-placement="top" data-trigger="hover"><i class="fa fa-mobile"></i></a>
												<a class="y_yx email" href="javascript:void(0);" rel="popover" data-content="" data-placement="top" data-trigger="hover"><i class="fa fa-envelope"></i></a>
											  <a class="y_yx authState" href="javascript:void(0);" rel="popover" data-content="" data-placement="top" data-trigger="hover"><i class="fa fa-user"></i></a>
										  </div> --%>
										  <a href="${pageContext.servletContext.contextPath}/usercenter/customercomplex/toModifyCustomerInfo" class="fr">修改个人资料 &gt;&gt;</a>
										</div>
									</div>
									</div>
									<%--
									<ul class="y_grxl">
									  <li>
										  <a href="${pageContext.servletContext.contextPath}/usercenter/coupondetails/toList">
										  <aebiz:showTitle titleId="ucenter_indexPage_myDiscountInfo"/><span>></span></a>
									  </li>
									  <li>
									 	  <a href="${pageContext.servletContext.contextPath}/usercenter/customeraddress/toCustomerAddress">
									  	  <aebiz:showTitle titleId="ucenter_indexPage_myDeliveryAddress"/><span>></span></a>
									  </li>
									  <li>
									 	  <a href="${pageContext.servletContext.contextPath}/usercenter/order/toActiveCard">
									  	  宅配卡激活<span>></span></a>
									  </li>
									</ul>
							  	</div>
							  	
							  	<!--提醒信息-->
							  	
							  	<div class="y_itxxx mb_20" id="member_remind">
						  			<ul class="y_ddlxl">
										<li class="active"><a href="#" onclick="queryRemind('${today }');" data-toggle="tab">今天</a></li>	
										<li><a href="#" onclick="queryRemind('${tomorrow }');" data-toggle="tab">明天</a></li>
										<li><a href="#" onclick="queryRemind('${afterTomorrow }');" data-toggle="tab">后天</a></li>
										<li><a href="#" onclick="queryRemind('${afterTomorrowAddOne }');" data-toggle="tab">${afterTomorrowAddOneStr }</a></li>
										<li><a href="#" onclick="queryRemind('${afterTomorrowAddTwo }');" data-toggle="tab">${afterTomorrowAddTwoStr }</a></li>
										<!--<li class="y_frlis"><a href="#"><i class="fa fa-calendar"></i></a><a href="#"><i class="fa fa-cog fa-spin"></i></a></li>-->
									</ul>
									
									<div class="tab-content" id="remind">
										
									</div>
							  	</div>
							  	
							  	
							  	<!--已买到宝贝和我的购物车-->
							  	<ul class="y_icart row">
							  		<li class="y_iybuy col-sm-7">
							  		  <div class="y_bitit"><h2><i class="fa fa-suitcase text-color"></i>已买到的宝贝</h2></div>
							  		  <ul class="y_ztlis">
							  		    <li id="waitpayLi" class="y_cur col-mi-4"><a href="javascript:queryWaitPay();"><i class="fa fa-money"></i> 待付款（<span id="waitpaycount">0</span>）</a></li>	
							  		    <li id="shippingLi" class="col-mi-4"><a href="javascript:queryShipping();"><i class="fa fa-truck"></i> 待收货（<span id="shippingcount">0</span>）</a></li><!--y_cur选中当前页的class-->
							  		    <li id="waitPjLi" class="col-mi-4"><a href="javascript:queryWaitpj();"><i class="fa fa-edit"></i> 待评价（<span id="waitpjcount">0</span>）</a></li>	
							  		  </ul>
							  		  <div id="orderShow">
							  		  </div>
							  		</li>
							  		
							  		<li class="y_iybuy2 col-sm-5" id="my_cart">
							  		  <div class="y_bitit"><h2><i class="fa fa-shopping-cart text-color"></i>我的购物车</h2></div>
							  		  <div id="ucCart">
							  		  </div>
							  		</li>
							  	</ul>
							  	
							  	<!--购物车删除商品弹出框-->
							  	<div class="modal fade" id="delectmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">删除宝贝</h4>
											</div>
											<div class="modal-body">
												<p>确认要删除该宝贝吗？</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
												<button type="button" class="btn btn-primary">确认</button>
											</div>
										</div>
									</div>
								</div>
									
							  	<!--收藏的商品、店铺、足迹-->
							  	<div class="y_biscb row">
							  		<!-- 商品收藏 -->
							  		<div class="col-xs-6 col-md-4 mb_20">
								  		<div class="y_bitit">
									  		<h2><i class="fa fa-star text-color"></i>我收藏的商品</h2>
									  		<a href="${pageContext.servletContext.contextPath}/usercenter/productfavorite/toPage">查看更多<span>></span></a>
								  		</div>
							  		  
							  		  	<c:choose>
							  		  		<c:when test="${!empty productFavoriteList}">
							  		  			<ul class="y_bipicl">
										  		  	<c:forEach items="${productFavoriteList}" var="pfl">
										  		   		<li class="col-sm-4">
											  		   		<a href="${pageContext.servletContext.contextPath}/front/product/toProduct/${pfl.productUuid}">
											  		   			<img src="${pfl.pim.productImage.bigImageUrl}" width="100px" higth="100px"/>
											  		   		</a>
										  		   		</li>	
										  		  	</c:forEach>
									  		    </ul>
							  		  		</c:when>
							  		  		<c:otherwise>
							  		  			<div class="y_memindexnothing y_nocolecpd">
											  		<span class="y_noicon"><i class="fa fa-star"></i></span>
											  		<p class="y_notitle">您还没有收藏商品，快去收藏自己喜欢的商品吧~~</p>
										  		</div>
							  		  		</c:otherwise>
							  		  	</c:choose>
							  		    <p class="y_scprp"><span>全部商品<b>${fn:length(productFavoriteList)}</b></span></p>
							  		</div>
						  		
						  			<!-- 店铺收藏-->
							  		<div class="y_scsto col-xs-6 col-md-4 mb_20 r_marginleft">
							  		  <div class="y_bitit">
							  		  	 <h2><i class="fa fa-home text-color"></i>我收藏的店铺</h2>
							  		  	 <a href="${pageContext.servletContext.contextPath}/usercenter/storefavorite/toPage">查看更多<span>></span></a>
							  		  </div>
							  		  
							  		  <c:choose>
							  		  	  <c:when test="${!empty storeFavoriteList}">
						  		  	  		 <ul class="y_scstlit">
						  		  	  			<c:forEach items="${storeFavoriteList}" var="sfl">
					  		  	  				 	<li>
										  		      <div><a href="${pageContext.servletContext.contextPath}/dfFront/toShopPage/${sfl.storeUuid}/pc">
										  		      <c:choose>
									        			<c:when test="${empty sfl.storeLogo}">
									        			<img src="${pageContext.servletContext.contextPath}/static/frontpage/img/shop_head.png">
									        			</c:when>
									        			<c:otherwise>
									        			<img src="${sfl.storeLogo}">
									        			</c:otherwise>
									        		</c:choose>
										  		      
										  		      </a></div>
										  		      <a class="btn btn-info" href="${pageContext.servletContext.contextPath}/dfFront/toShopPage/${sfl.storeUuid}/pc">马上去看</a>
										  		      <p><a href="${pageContext.servletContext.contextPath}/dfFront/toShopPage/${sfl.storeUuid}/pc">${sfl.storeName}</a></p>
										  		    </li>
						  		  	  			</c:forEach>
									  		 </ul>
							  		  	  </c:when>
							  		  	  <c:otherwise>
							  		  			<div class="y_memindexnothing y_nocolecpd">
											  		<span class="y_noicon"><i class="fa fa-star"></i></span>
											  		<p class="y_notitle">您还没有收藏店铺，快去收藏自己喜欢的店铺吧~~</p>
										  		</div>
							  		  		</c:otherwise>
							  		  </c:choose>
							  		</div>
							  		 
						  		
						  			<!-- 我的足迹 
							  		<div class="y_scsto2 col-xs-12 col-md-4 mb_20">
							  		  <div class="y_bitit"><h2><i class="fa fa-flag text-color"></i>我的足迹</h2><a href="#">查看更多<span>></span></a></div>
							  		  <ul class="y_bipicl">
							  		    <li class="col-md-4"><a href="#"><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_ad91.jpg"></a></li>	
							  		    <li class="col-md-4"><a href="#"><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_ad91.jpg"></a></li>	
							  		    <li class="col-md-4"><a href="#"><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_ad91.jpg"></a></li>	
							  		    <li class="col-md-4"><a href="#"><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_ad91.jpg"></a></li>	
							  		    <li class="col-md-4"><a href="#"><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_ad91.jpg"></a></li>	
							  		    <li class="col-md-4"><a href="#"><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_ad91.jpg"></a></li>	
							  		  </ul>
							  		  <p class="y_binum"><span></span><span></span><span></span><span class="y_cur"></span></p>
							  		</div>
							  		-->
							  		--%>
							  
											<div class="ku_order">
												<ul class="clearfix">
													<li class="fl">
														<div class="ku_order_img"><img src="${pageContext.request.contextPath }/static/usercenter/img/ku_order_img.png"></div>
														<div class="ku_order_tit">
															<h3>待支付的订单：<span id="waitpaycount"></span></h3>
															<p><a href="${pageContext.request.contextPath }/usercenter/order/toWaitPay/1/waitpay">查看待支付订单>></a></p>
														</div>
													</li>
													<li class="fr">
														<div class="ku_order_img"><img src="${pageContext.request.contextPath }/static/usercenter/img/ku_order_img1.png"></div>
														<div class="ku_order_tit">
															<h3>待收货的订单：<span id="shippingcount"></span></h3>
															<p><a href="${pageContext.request.contextPath }/usercenter/order/toWaitPay/6/shipping">查看待收货订单>></a></p>
														</div>
													</li>
													<li class="fl">
														<div class="ku_order_img"><img src="${pageContext.request.contextPath }/static/usercenter/img/ku_order_img2.png"></div>
														<div class="ku_order_tit">
															<h3>待评论的订单：<span id="waitpjcount"></span></h3>
															<p><a href="${pageContext.request.contextPath }/usercenter/order/toWaitPay/7/waitcomment?commentState=1">查看待评论订单>></a></p>
														</div>
													</li>
													<li class="fr">
														<div class="ku_order_img"><img src="${pageContext.request.contextPath }/static/usercenter/img/ku_order_img3.png"></div>
														<div class="ku_order_tit">
															<h3>喜欢的商品：<span>${fn:length(productFavoriteList)}</span></h3>
															<p><a href="${pageContext.request.contextPath }/usercenter/productfavorite/toPage?init=true">查看喜欢的商品>></a></p>
														</div>
													</li>
												</ul>
											</div>
										</div>	
							  		
							  		
							  		
							  		
							  		
							  		
							  		
							  		
							  		
							  		
							  	
							  		
						  		</div>
							
						</div>
					</div>
				</div>
			</div>
		
		
		<!-- END BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
		<div class="push-sticky-footer"></div>
	</div><!-- /wrapper -->
	
	<!--会员提醒新增提醒弹出框-->
	<div class="modal fade" id="addnotifiy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true" style="overflow:hidden;">
	<form id="remindForm" action="${pageContext.request.contextPath }/usercenter/customerremind/saveRemind" class='form-horizontal form-validate form-bordered'>
	</form>	
	</div><!--底部-->
<%-- <%@ include file="/WEB-INF/jsp/userfront/common/platBottom.jsp" %> --%>
<!-- End 底部 -->
	
<!-- FOOTER 底部 -->
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImportJs.jsp"%>
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterBottom.jsp"%>
<script src="${pageContext.request.contextPath }/static/usercenter/js/jquery.gritter.min.js"></script><!--签到、加入收藏弹出提示信息插件-->
<script src="${pageContext.request.contextPath }/static/usercenter/js/bootstrap-tour.custom.js"></script><!--页面向导的js插件-->
	
<script>
function isEmpty(strVal) {
	if (strVal == '' || strVal == null || strVal == undefined) {
		return true;
	} else {
		return false;
	}
}

$(function(){
	var mobile = $("#mobileHidden").val();
	var email = $("#emailHidden").val();
	//var authState = $("#authStateHidden").val();
	var customerUuid=$("#uuidHidden").val();
	var $mobile = $(".y_igxxb").find(".mobile");
	var $email = $(".y_igxxb").find(".email");
	//var $authState = $(".y_igxxb").find(".authState");

	//绑定手机
	if(isEmpty(mobile)){
		$mobile.addClass("text-999");
		$mobile.attr("data-content","<aebiz:showTitle titleId="ucenter_bindMobile_notBindMobile"/>");
		$mobile.attr("href","${pageContext.servletContext.contextPath}/usercenter/customer/toBindMobile/"+$("#uuidHidden").val());
	}else{
		$mobile.removeClass("text-999");
		$mobile.attr("data-content","<aebiz:showTitle titleId="ucenter_bindMobile_alreadyBindMobile"/>"+mobile.substring(0,3)+"****"+mobile.substring(7,11));
	}

	//绑定邮箱
	if(isEmpty(email)){
		$email.addClass("text-999");
		$email.attr("data-content","<aebiz:showTitle titleId="ucenter_bindEmail_notBindEmail"/>");
		$email.attr("href","${pageContext.servletContext.contextPath}/usercenter/customer/toBindEmail/"+$("#uuidHidden").val());
	}else{
		$email.removeClass("text-999");
		var index = email.indexOf("@");
		var prefix = email.substring(0,index);
		if(prefix.length >=4){
			$email.attr("data-content","<aebiz:showTitle titleId="ucenter_bindEmail_alreadyBindEmail"/>"+email.substring(0,2)+"****"+email.substring(index-2,index)+email.substring(index));
		}else{
			$email.attr("data-content","<aebiz:showTitle titleId="ucenter_bindEmail_alreadyBindEmail"/>"+email.substring(0,1)+"****"+email.substring(index-1,index)+email.substring(index));
		}
	}

	//实名认证
//	if(!isEmpty(authState)){
//		if(authState=='1'){
//			$authState.addClass("text-999");
//			$authState.attr("data-content","<aebiz:showTitle titleId="ucenter_securitySet_authFailed"/>");
//			$authState.attr("href","${pageContext.servletContext.contextPath}/usercenter/customerauth/toCustomerAuth/"+customerUuid);
//		}else if(authState=='2'){
//			$authState.removeClass("text-999");
//			$authState.attr("data-content","<aebiz:showTitle titleId="ucenter_securitySet_authSuccess"/>");
//			$authState.attr("href","javascript:void(0);");
//		}else if(authState=='3'){
//			$authState.addClass("text-999");
//			$authState.attr("data-content","<aebiz:showTitle titleId="ucenter_securitySet_waitAudit"/>");
//			$authState.attr("href","javascript:void(0);");
//		}else{
//			$authState.addClass("text-999");
//			$authState.attr("data-content","<aebiz:showTitle titleId="ucenter_securitySet_notApplied"/>");
//			$authState.attr("href","${pageContext.servletContext.contextPath}/usercenter/customerauth/toCustomerAuth/"+customerUuid);
//		}
//	}
	
	//会员中心首页点击签到弹出提示信息调用插件js
	$('.gritter-sign').click( function() {
		$(".gritter-item-wrapper").remove();
		$.gritter.add({
			text: '签到成功',
			time: 1500
		});
		$(this).hide().next().css("display","inline-block");
		return false;
	});
	//会员中心首页新增提醒弹出框选择图片效果
	$(".y_notisfpc li").click(function(){
		$(this).addClass("active").siblings().removeClass("active");	
	})
	//会员中心首页购物车加入收藏弹出提示信息调用插件js
	$('.gritter-regular').click( function() {
		$(".gritter-item-wrapper").remove();
		$.gritter.add({
			text: '已收藏该宝贝',
			time: 1500
		});
		return false;
	});
	//会员中心首页购物车删除商品调用模态框插件js
	$('.y_delemod').click(function(){
		$("#delectmodal").modal('show');
		return false;
	});
	//会员中心首页向导的js
	var tour = new Tour({
	  steps: [
		  //{
		  //  element: "#to_home",
		  //  title: "返回首页",
		  //  content: "点击LOGO可以返回到商城的首页哦！",
		  //  placement: "bottom",
		  //  backdrop:true
		  //},
		  {
		    element: "#member_ms",
		    title: "会员基本信息",
		    content: "在这里可以查看到会员的基本信息哦，也可直接编辑会员资料",
		    placement: "right",
		    backdrop:true
		  },
		  {
		    element: "#member_remind",
		    title: "会员提醒",
		    content: "这里可以设置日程提醒，可以将要做的事添加进来哦！",
		    placement: "bottom",
		    backdrop:true
		  },
		  {
		    element: "#my_cart",
		    title: "我的购物车",
		    content: "这里是我的购物车信息，可以将商品添加到收藏夹，也可以直接去购物车结算哦！",
		    placement: "left",
		    backdrop:true
		  }
		]
	});
	tour.init();
		
	<c:if test="{m.tipUser=='0' || m.tipUser=='1' }">
		tour.restart();
	</c:if>
	
	
	//加载会员中心首页提醒记录
	var url = "${pageContext.request.contextPath }/usercenter/customerremind/queryRemind" ;
	$.post(url,{ranNum:Math.random() ,init:"true"}, function(data){
		$("#remind").html(data);	
	});
	
	//加载会员中心首页购物车
	var url = "${pageContext.request.contextPath }/cart/ajaxUsercenterCartshow" ;
	$.post(url,function(data){
		$("#ucCart").html(data);	
	});

	var queryCountUrl = "${pageContext.request.contextPath}/usercenter/order/ucenter/query/orderCount" ;    
	$.getJSON(queryCountUrl,{ranNum:Math.random() ,orderState:"1"} ,function(data){						
		$("#waitpaycount").html(data) ;
	})
	
	$.getJSON(queryCountUrl,{ranNum:Math.random() ,orderState:"6"} ,function(data){						
		$("#shippingcount").html(data) ;
	})
	
	$.getJSON(queryCountUrl,{ranNum:Math.random() ,orderState:"7", commentState:"1"} ,function(data){						
		$("#waitpjcount").html(data) ;
	})

	
	
	//加载会员中心首页订单 (待付款)
	var orderUrl = "${pageContext.request.contextPath }/usercenter/order/ajaxUcenterOrder" ;
	$.post(orderUrl,{ranNum:Math.random() ,orderState:"1"},function(data){
		$("#orderShow").html(data);
		$("#waitpayLi").addClass("y_cur");
		$("#shippingLi").removeClass("y_cur");
		$("#waitPjLi").removeClass("y_cur");
	});
	
})	

//查询提醒记录
function queryRemind(obj){
	var url = "${pageContext.request.contextPath }/usercenter/customerremind/queryRemind" ;
	$.post(url,{ranNum:Math.random() ,date:obj},function(data){
		$("#remind").html(data);	
	});
}

function queryShipping(){
	//加载会员中心首页订单 (待收货)
	var orderUrl = "${pageContext.request.contextPath }/usercenter/order/ajaxUcenterOrder" ;
	$.post(orderUrl,{ranNum:Math.random() ,orderState:"6"},function(data){
		$("#orderShow").html(data);	
		$("#waitpayLi").removeClass("y_cur");
		$("#shippingLi").addClass("y_cur");
		$("#waitPjLi").removeClass("y_cur");
	});
}

function queryWaitpj(){
	//加载会员中心首页订单 (待评价)
	var orderUrl = "${pageContext.request.contextPath }/usercenter/order/ajaxUcenterOrder" ;
	$.post(orderUrl,{ranNum:Math.random() ,orderState:"7", commentState:"1"},function(data){
		$("#orderShow").html(data);	
		$("#waitpayLi").removeClass("y_cur");
		$("#shippingLi").removeClass("y_cur");
		$("#waitPjLi").addClass("y_cur");
	});
}

function queryWaitPay(){
	//加载会员中心首页订单 (待付款)
	var orderUrl = "${pageContext.request.contextPath }/usercenter/order/ajaxUcenterOrder" ;
	$.post(orderUrl,{ranNum:Math.random() ,orderState:"1"},function(data){
		$("#orderShow").html(data);	
		$("#waitpayLi").addClass("y_cur");
		$("#shippingLi").removeClass("y_cur");
		$("#waitPjLi").removeClass("y_cur");
	});
}

function ajaxRemove(obj){
	var operId = obj;
	//删除购物车中的商品	
	var changeNumUrl = "${pageContext.request.contextPath }/cart/ucRemove" ;			
	$.post(changeNumUrl,{productIdAndAttrId:operId,ranNum:Math.random()} ,function(data){
		$("#ucCart").html(data) ;		
	});
	//删除悬浮效果
	$(".tooltip").each(function(){
		this.remove();
	});
}
//商品收藏
function addToFav(obj){
			var loginUrl = "${pageContext.request.contextPath }/cart/addToFavorate" ;
			var operId=obj;
			var productId = obj.split("_")[1] 	
			$.get(loginUrl,{productId:productId ,ranNum:Math.random()} ,function(data){				
				//如果没登录，弹出登录框
				if("noLogin"==data) {					
					alert("请登录！");
				}else if("1"==data) {
					alert("收藏成功！");				
				}else if("2"==data) {
					alert("收藏失败！");
				}else if("3"==data) {
					alert("已经收藏！");				
				}
			})	
}

function addRemind(){
	var addDate = $("#addDate").val();
	var url = "${pageContext.request.contextPath }/usercenter/customerremind/addRemind" ;
	$.post(url,{ranNum:Math.random() ,date:addDate},function(data){
		$("#remindForm").html(data);	
		$("#addnotifiy").modal("show");
	});
}

function cancelRemind(obj,date){
	var url = "${pageContext.request.contextPath }/usercenter/customerremind/cancelRemind" ;
	$.post(url,{ranNum:Math.random() ,remindUuid:obj,remindDate:date},function(data){
		$("#remind").html(data);	
	});
}

function editRemind(obj){
	var url = "${pageContext.request.contextPath }/usercenter/customerremind/editRemind" ;
	$.post(url,{ranNum:Math.random() ,remindUuid:obj},function(data){
		$("#remindForm").html(data);
		$("#addnotifiy").modal("show");
	});
}

function updateRemind(){
	var remindUuid = $("#remindUuid").val();
	var remindDate = $("#remindDate").val();
	var remindContent = $("#remindContent").val();
	if(remindContent.trim() == ""){
		alert("请输入提醒内容");
		return;
	}
	var url = "${pageContext.request.contextPath }/usercenter/customerremind/updateRemind" ;
	$.post(url,{ranNum:Math.random() ,remindUuid:remindUuid,remindDate:remindDate,remindContent:remindContent},function(data){
		$("#remind").html(data);	
		$("#addnotifiy").modal("hide");
	});
}

function saveRemind(){
	//$("#remindForm").submit();
	var remindDate = $("#remindDate").val();
	var remindContent = $("#remindContent").val();
	if(remindContent.trim() == ""){
		alert("请输入提醒内容");
		return;
	}
	var url = "${pageContext.request.contextPath }/usercenter/customerremind/saveRemind" ;
	$.post(url,{ranNum:Math.random() ,remindDate:remindDate,remindContent:remindContent},function(data){
		$("#remind").html(data);	
		$("#addnotifiy").modal("hide");
	});
}
</script>

</body>

	<script>
		//设置积分系统登陆
		/* var queryUrl = "http://192.168.0.20:5171/inte/customer/quickLogin";
		var mydata={'loginName':'${loginName}','pwd':'${pwd}','hasVilidateCode':''};  
		$.ajax({
			async:false, //布尔类型，默认为true 表示请求是否为异步，如果为false表示为同步
			url: queryUrl ,
			type: "GET", 
			dataType: 'jsonp', 
			data: mydata, 
		}) */
		
	</script>

</html>