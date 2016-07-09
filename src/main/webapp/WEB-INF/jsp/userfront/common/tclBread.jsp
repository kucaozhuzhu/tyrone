<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>           
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--面包屑-->
<article class="tcl_bread">
	<div class="container clearfix" id="topCartId">
		<h2 class="bread_title">TCL Store</h2>
			<nav class="bread_nav">
				<ul class="bread_ul">
	<!-- 				<li><a href="#">学习</a></li> -->
					<li><a href="${pageContext.servletContext.contextPath}/frontshow/tcode/toUseTcodeCheck" target="_blank">T码检测通道</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/frontshow/tcode/toUseTcodeAdd" target="_blank">T码专属通道</a></li>
					<li><a href="http://shop.tcl.com/mall/purchase/add.html" target="_blank"><aebiz:showTitle titleId="frontpage.top.company" /></a></li>
					<li class="bread_dropdown breaddrop_help">
						<span class="droupdown_btn" data-toggle="dropdown"><aebiz:showTitle titleId="frontpage.top.getHelp" /></span>	
						<div class="dropdown-menu pull-right">
							<s class="dropdown_icon"></s>	
							<a class="bread_item" href="${pageContext.servletContext.contextPath}/frontshow/tclcontent/toTClCustomerServerCenter" target="_blank">
								<div class="item_tit"><aebiz:showTitle titleId="frontpage.top.productQuestion" /></div>
								<p class="item_ms"><aebiz:showTitle titleId="frontpage.top.productConsultation" /></p>
							</a>
							<a class="bread_item" href="${pageContext.servletContext.contextPath}/usercenter/order/list/1/10" target="_blank">
								<div class="item_tit"><aebiz:showTitle titleId="frontpage.top.orderQuestion" /></div>
								<p class="item_ms"><aebiz:showTitle titleId="frontpage.top.orderConsultation" /></p>
							</a>
							<a class="bread_item" href="#"  style= "cursor:default">
								<div class="item_tit"><aebiz:showTitle titleId="frontpage.top.buyQuestion" /></div>
								<p class="item_ms"><aebiz:showTitle titleId="frontpage.top.buyConsultation" /></p>
							</a>
						</div>
					</li>
				</ul>
		</nav>
	</div><!--.container end-->
</article><!--面包屑 end-->

<script>
$(document).ready(function(){
	$.get("${pageContext.servletContext.contextPath}/tclcart/ajaxtopcartshow?ranNum="+Math.random()+"&currentUrl="+encodeURIComponent(window.top.location),
		function(data){
		$("#topCartId").html(data);
	});
});
</script>