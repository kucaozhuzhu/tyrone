<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>  
<!-- Bootbox -->
	<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/jquery.bootbox.js"></script>

<!-- 	头部LOGO seach cart -->

<!---头部-->
<div class="m_head">
	<div class="container clearfix">
		<div class="fl" id="isLogin">
			
		</div>
		<div class="fr">
			<div id="myORDER">
			</div>
			<span id="dealerInfo"></span>
			<a href="${pageContext.servletContext.contextPath}/frontshow/content/toCustomerHelpCenter">帮助中心</a>
			<b>|</b>
			<a href="${pageContext.servletContext.contextPath}/frontshow/dealerresidentapply/toDealerResidentApplyProgress">门店入驻进度</a>
			<b>|</b>
			<a href="${pageContext.servletContext.contextPath}/frontshow/dealerresidentapply/toApply">门店入驻</a>
			<b>|</b>
			<a href="${pageContext.servletContext.contextPath}/frontshow/storeresidentapply/toApply">供应商入驻</a>
		</div>
	</div>
</div><!---头部 end-->
<script>
	function getDate(){
		$.getJSON("${pageContext.servletContext.contextPath}/dealer/getLoginInfo",
			{ranNum:Math.random()},
			function(data) {
				if(data.loginName != null){
					var dealerName = data.loginName;
					$("#isLogin").html('hi,欢迎来到酷友商城<a href="${pageContext.servletContext.contextPath}/dealer/toIndex">'+dealerName+'&nbsp;&nbsp;&nbsp;&nbsp;'+data.customerInteger+'</a>&nbsp;<a href="${pageContext.servletContext.contextPath}/dealer/logout">退出</a>');
					$("#dealerInfo").html('<a href="${pageContext.servletContext.contextPath}/dealer/toIndex">门店中心</a><b>|</b>');
				}else{
					$("#isLogin").html('<span>hi,欢迎来到酷友商城</span><b>|</b><a href="${pageContext.servletContext.contextPath}/dealer/toLogin">门店登录</a>');
					$(".y_ifixed").addClass("y_nologin");
					$("#myUSD").html("");
					$("#dealerInfo").html('');
				}
			});
	}

	
	//获取商户入住的方式 0:注册  1:入住申请,线下回访
	
	$.get("${pageContext.servletContext.contextPath}/store/getEnterType",
			{runN:Math.random()},
			function(data) {
				if(data == 'reg'){
					$("#storereg").attr('href',"${pageContext.servletContext.contextPath}/frontshow/storecomplex/toRegStepOne");
				}else{
					$("#storereg").attr('href',"${pageContext.servletContext.contextPath}/frontshow/storeresidentapply/toApply");
				}
			});

//收藏本站
/*function addFavorite(title, url) {
  try {
      window.external.addFavorite(url, title);
  }catch (e) {
     try {
       window.sidebar.addPanel(title, url, "");
    }catch (e) {
         bootbox.alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
     }
  }

}*/
$(function(){
	getDate();
})

function goOrder(){
	window.location.href="${pageContext.servletContext.contextPath}/usercenter/order/list/1/1/10?init=true";
}
</script>
<script type="text/javascript">
$.get("${pageContext.servletContext.contextPath}/getRegisterTipCookies",
		{ranNum:Math.random()},function(data) {
			if("false" == data){
				$(".w_activies").show();
				$(".w_activies").animate({top:"100px"},1000);
				$.get("${pageContext.servletContext.contextPath}/addRegisterTipCookies",{ranNum:Math.random()},function(data){
				});
			}
		});
	/*客服、百度统计Start*/
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?3350e81ed3cd6eb67c10fbb59c98ea8c";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
	/*客服、百度统计End*/
</script>