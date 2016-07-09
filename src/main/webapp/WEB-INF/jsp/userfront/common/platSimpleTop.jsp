<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootbox -->
	<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/jquery.bootbox.js"></script>

<!---头部-->
<div class="m_head">
	<div class="container clearfix">
		<div class="fl" id="isLogin">
		</div>
		<div class="fr">
			<div id="myORDER">
			</div>
			<a href="${pageContext.servletContext.contextPath}/">首页</a>
			<b>|</b>
			<span id="Info"></span>
			<a href="${pageContext.servletContext.contextPath}/frontshow/content/toCustomerHelpCenter">帮助中心</a>
			<b>|</b>
			<a href="${pageContext.servletContext.contextPath}/frontshow/dealerresidentapply/toDealerResidentApplyProgress">入驻进度查询</a>
			<!-- update by tanyan  判断是否是门店登录  门店登录首页头部去除门店入驻 -->
			<c:if test="${!isDealer}">
			<b>|</b>
			<a href="${pageContext.servletContext.contextPath}/frontshow/dealerresidentapply/toApply">门店入驻</a>
			</c:if>
			<b>|</b>
			<a href="${pageContext.servletContext.contextPath}/frontshow/storeresidentapply/toApply">供应商入驻</a>
		</div>
	</div>
</div><!---头部 end-->

<script>
function getDate(){
		$.getJSON("${pageContext.servletContext.contextPath}/customer/getLoginInfo",
			{ranNum:Math.random()},
			function(data) {
				var returnUrl = window.location.href;
				if(data.type == "dealer"){
					var dealerName = data.loginName;
					$("#isLogin").html('hi,欢迎来到酷友商城<a href="${pageContext.servletContext.contextPath}/dealer/toIndex">'+dealerName+'&nbsp;&nbsp;&nbsp;&nbsp;'
					+'</a>&nbsp;<a href="${pageContext.servletContext.contextPath}/dealer/logout">退出</a>');
					$("#Info").html('<a href="${pageContext.servletContext.contextPath}/dealer/toIndex">门店中心</a><b>|</b>');
				}
				if (data.type == "customer"){
					var customerName = data.customerName;
					$("#isLogin").html('hi,欢迎来到酷友商城<a href="${pageContext.servletContext.contextPath}/customer/toIndex">'+customerName+'&nbsp;&nbsp;&nbsp;&nbsp;'+'</a>&nbsp;<a href="${pageContext.servletContext.contextPath}/customer/logout">退出</a>');
					$("#Info").html('<a href="${pageContext.servletContext.contextPath}/customer/toIndex">用户中心</a><b>|</b>');
				}
				if(data.type == ""||data.type==null){
					var hrefs = '<span>hi,欢迎来到酷友商城</span><b>|</b><a href="${pageContext.servletContext.contextPath}/dealer/toLogin?returnUrl='+returnUrl+'">门店登录</a><b>|</b><a href="${pageContext.servletContext.contextPath}/customer/toLogin?returnUrl='+returnUrl+'">用户登录</a><b>|</b><a href="${pageContext.servletContext.contextPath}/store/toLogin">供应商登录</a>'
					$("#isLogin").html(hrefs);
					$(".y_ifixed").addClass("y_nologin");
					$("#myUSD").html("");
					$("#Info").html('');
				}
			});
}


	//获取商户入住的方式 0:注册  1:入住申请,线下回访
	/*
	$.get("${pageContext.servletContext.contextPath}/store/getEnterType",
			{runN:Math.random()},
			function(data) {
				if(data == 'reg'){
					$("#storereg").attr('href',"${pageContext.servletContext.contextPath}/frontshow/storecomplex/toRegStepOne");
				}else{
					$("#storereg").attr('href',"${pageContext.servletContext.contextPath}/frontshow/storeresidentapply/toApply");
				}
			});
	*/

$(function(){
	getDate();
});

function goOrder(){
	window.location.href="${pageContext.servletContext.contextPath}/usercenter/order/list/1/1/10?init=true";
}
</script>
<script>
	
var jsContextPath = "${pageContext.servletContext.contextPath}";

function search(){
	var keyword =  $.trim($('#keyword').val());
	if(keyword==""){
		alert("请输入要搜索的关键字");
		$('#keyword').focus();
		return;
	}
	window.location.href="${pageContext.servletContext.contextPath}/front/productList/toProductList?keyword="+encodeURI(encodeURI(keyword));
}
/*客服、百度统计Start*/
/* $(function(){
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?3350e81ed3cd6eb67c10fbb59c98ea8c";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
}); */
/*客服、百度统计End*/
</script>