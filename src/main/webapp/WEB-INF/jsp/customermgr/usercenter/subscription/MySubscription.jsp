<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->
	
	<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>		
	<title><aebiz:showTitle titleId="ucenter_subscription_mySubscription"/></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="description" content="KingAdmin - Bootstrap Admin Dashboard Theme">
	<meta name="author" content="The Develovers">
	
	<link href="${pageContext.servletContext.contextPath}/static/usercenter/css/colorbox.css" rel="stylesheet" type="text/css">
</head>

<body>
	<!-- WRAPPER 头部、左侧、右侧大框架 -->
	<div class="wrapper">
		<!-- TOP BAR 头部导航 -->
		<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterHead.jsp"%>
		<!-- /top -->
		
		<!-- BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT 左侧导航和右侧主体 -->
		<div class="bottom">
			<div class="container">
				<div class="row">
					<!-- left sidebar 左侧导航 -->
					<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterLeft.jsp"%>

					<!-- content-wrapper 右侧主体 -->
					<div class="col-xs-10 content-wrapper">
						<div class="row">
							<div class="col-sm-4 ">
								<ul class="breadcrumb">
									<li>
										<i class="fa fa-home"></i>
										<a href="${pageContext.servletContext.contextPath}/customer/toIndex"><aebiz:showTitle titleId="ucenter_indexPage_membercenter"/></a>
									</li>
									<li class="active"><aebiz:showTitle titleId="ucenter_subscription_mySubscription"/></li>
								</ul>
							</div>
							
							<div class="col-sm-8 ">
								<div class="top-content">
									<ul class="list-inline quick-access">
										<li>
											<a href="charts-statistics-interactive.html">
												<span class="quick-access-item bg-color-green">
													<i class="fa fa-bar-chart-o"></i>
													<h5>CHARTS</h5><em>basic, interactive, real-time</em>
												</span>
											</a>
										</li>
										<li>
											<a href="page-inbox.html">
												<span class="quick-access-item bg-color-blue">
													<i class="fa fa-envelope"></i>
													<h5>INBOX</h5><em>inbox with gmail style</em>
												</span>
											</a>
										</li>
										<li>
											<a href="tables-dynamic-table.html">
												<span class="quick-access-item bg-color-orange">
													<i class="fa fa-table"></i>
													<h5>DYNAMIC TABLE</h5><em>tons of features and interactivity</em>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						
						<input type="hidden" id="customerUuid" value="${wm.customerUuid}">
						
						<!-- main -->
						<div class="content">
						 	<div class="main-header">
								<h2><aebiz:showTitle titleId="ucenter_subscription_mySubscription"/></h2>
							</div>
							
							<div class="main-content">
								<c:choose>
							 		<c:when test="${!empty csmList}">
							 			<div class="table-responsive2">
										   <table class="table table-hover my-scribe">
											    <thead>
											        <tr>
											           <th><aebiz:showTitle titleId="ucenter_subscription_subName"/></th>
											           <th><aebiz:showTitle titleId="ucenter_subscription_subType"/></th>
											           <th><aebiz:showTitle titleId="ucenter_subscription_mobileOrEmail"/></th>
											           <th><aebiz:showTitle titleId="ucenter_subscription_operate"/></th>
											        </tr>
											    </thead>
											    
											    <tbody>
											     	<c:forEach items="${csmList}" var="csm">
											     		<tr>
													        <td>${csm.customerSubscribeContentModel.subscribeName}</td>
													        <td>${csm.customerSubscribeContentModel.subscribeType}</td>
													        <td>
													        	<c:if test="${!empty csm.mobile}">${csm.mobile}&nbsp;&nbsp;</c:if>
													        	<c:if test="${!empty csm.email}">${csm.email} </c:if>
													        </td>
													        <td>
													        	<a class="btn btn-primary" href="${pageContext.servletContext.contextPath}/usercenter/customersubscription/toUpdateSubscription/${csm.uuid}"><aebiz:showTitle titleId="ucenter_subscription_modify"/></a>
													        	<button class='btn btn-default' onclick="javascript:cancelSub('${csm.uuid}');"><aebiz:showTitle titleId="ucenter_subscription_cancel"/></button>
													        </td>
												        </tr>
											     	</c:forEach>
											    </tbody>
										   </table>
										   
										   <p class="text-right mb_20">
										   	   <a class="btn btn-primary text-right" href="${pageContext.servletContext.contextPath}/usercenter/customersubscription/toGoSubscription"><aebiz:showTitle titleId="ucenter_subscription_subOther"/></a>
										   </p>
										</div>
							 		</c:when>
							 		
							 		<c:otherwise>
							 			<div class="table-responsive2">
											 <table class="table table-hover my-scribe">
											     <thead>
											         <tr>
												     	<th><aebiz:showTitle titleId="ucenter_subscription_subName"/></th>
											            <th><aebiz:showTitle titleId="ucenter_subscription_subType"/></th>
											            <th><aebiz:showTitle titleId="ucenter_subscription_mobileOrEmail"/></th>
											            <th><aebiz:showTitle titleId="ucenter_subscription_operate"/></th>
											     	 </tr>
											     </thead>
											 </table>
											 <div class="alert alert-warning text-center" role="alert">
											 	<aebiz:showTitle titleId="ucenter_subscription_notSub"/>
											   	<strong>
											   		<a class="btn btn-primary" href="${pageContext.servletContext.contextPath}/usercenter/customersubscription/toGoSubscription">
											   			<aebiz:showTitle titleId="ucenter_subscription_goSubAtOnce"/>
											   		</a>
											   	</strong> 
											 </div>
										</div>
							 		</c:otherwise>
							 	</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- END BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
		<div class="push-sticky-footer"></div>
	</div><!-- /wrapper -->
	
	<!-- FOOTER 底部 -->
	<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImportJs.jsp"%>
	<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterBottom.jsp"%>
	<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/bootbox/jquery.bootbox.js"></script>
	
<script>
	function cancelSub(uuid){
		var url="${pageContext.servletContext.contextPath}/usercenter/customersubscription/cancelSubscription";
		$.get(url,{"uuid":uuid,"ranNum":Math.random()},function(data){
			if(data=="true"){
				window.location.reload();
			}else{
				bootbox.alert("<aebiz:showTitle titleId="basebusiness.showmessage.opeOkTitle"/>！");
			}
		});
	}
</script>

</body>
</html>