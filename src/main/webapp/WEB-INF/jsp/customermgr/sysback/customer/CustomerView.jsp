<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!doctype html>
<html>

<%@ include file="/WEB-INF/jsp/basebusiness/common/import/UpdateImport.jsp" %>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/icheck/all.css">
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/icheck/jquery.icheck.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.checkbox.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.validate.expand.js"></script> 
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/datepicker/datepicker.css">
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.datepicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/fileupload/bootstrap-fileupload.min.js"></script>
<!-- colorbox -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/colorbox/colorbox.css">
<!-- colorbox -->
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/colorbox/jquery.colorbox-min.js"></script>
<!-- 调用放大图插件的js -->
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.colorbox.js"></script>

</head>

<body>
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1><aebiz:showTitle titleId="customer.m.viewCustomerInfo"/></h1>
			</div>
		</div>
				
		<div class="breadcrumbs">
			<ul>
				<li><span><aebiz:showTitle titleId="customer.menuOne"/></span><i class="fa fa-angle-"></i></li>
				<li><span><aebiz:showTitle titleId="customer.menuTwo"/></span><i class="fa fa-angle-"></i></li>
				<li><span><aebiz:showTitle titleId="customer.m.viewCustomerInfo"/></span></li>
			</ul>
		</div>
		
		<div class="box box-bordered bordered-top">
			<div class="box-content nopadding">
				<div class="tabs-container">
					<ul class="tabs tabs-inline tabs-left">
						<li class='active'><a href="#AccountInfo" data-toggle='tab'><i class="fa fa-lock"></i> <aebiz:showTitle titleId="customerInfo.m.customerAccountInfo"/></a></li>
						<li><a href="#BaseInfo" data-toggle='tab'><i class="fa fa-user"></i> <aebiz:showTitle titleId="customerinfo.moduleName_CN"/></a></li>
						<%-- <li><a href="#AuthInfo" data-toggle='tab'> <i class="fa fa-user"></i> <aebiz:showTitle titleId="customerauth.moduleName_CN"/></a></li> --%>
						<li><a href="#SourceInfo" data-toggle='tab'> <i class="fa fa-user"></i> <aebiz:showTitle titleId="customersource.moduleName_CN"/></a></li>
					</ul>
				</div>
				
				<div class="tab-content padding tab-content-inline y_storesee">
					<div class="tab-pane active" id="AccountInfo">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th width="15%"><aebiz:showTitle titleId="customer.m.customerName"/></th>
									<td width="35%">${m.customerModel.customerName}</td>
									<th width="15%"><aebiz:showTitle titleId="customer.m.mobile" /></th>
									<td width="35%">${m.customerModel.mobile }</td>
								</tr>
								
								<tr>
									<th><aebiz:showTitle titleId="customer.m.email"/></th>
									<td>${m.customerModel.email}</td>
									<th><aebiz:showTitle titleId="customer.m.activeState"/></th>
									<td>
										<c:if test="${m.customerModel.activeState=='1'}">
											<aebiz:showTitle titleId="customer.m.actived" />
										</c:if>
										<c:if test="${m.customerModel.activeState=='0'}">
											<aebiz:showTitle titleId="customer.m.unactived" />
										</c:if>
									</td>
									<!-- 会员现在不需要等级
									<th><aebiz:showTitle titleId="customer.m.customerShopLevel"/></th>
										<td>
										<c:forEach items="${levelList}" var="level">
											<c:if test="${m.customerModel.customerShopLevelUuid==level.uuid}">
												<c:out value="${level.levelName}"></c:out>
											</c:if>
										</c:forEach>
									</td> -->
								</tr>
								
								<tr>
									
									<th><aebiz:showTitle titleId="customer.m.frozenState"/></th>
									<td>
										<c:if test="${m.customerModel.frozenState=='1'}">
											<aebiz:showTitle titleId="customer.m.frozened" />
										</c:if>
										<c:if test="${m.customerModel.frozenState=='0'}">
											<aebiz:showTitle titleId="customer.m.unfrozened" />
										</c:if>
									</td>
									<!-- 已冻结的账户才有冻结类型，没有冻结的账户没有冻结类型 -->
									<c:if test="${m.customerModel.frozenState=='1'}">
										<th><aebiz:showTitle titleId="customer.m.frozenType"/></th>
										<td>
											<c:forEach items="${frozenTypeList}" var="dpp">
												<c:if test="${m.customerModel.frozenType==dpp.name}">
													<c:out value="${dpp.value}"></c:out>
												</c:if>
											</c:forEach>
										</td>
									</c:if>
									<th><aebiz:showTitle titleId="customerfrozenlog.m.note"/></th>
									<td colspan="3">${m.customerFrozenLogModel.note }</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="tab-pane" id="BaseInfo">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th width="15%"><aebiz:showTitle titleId="customerinfo.m.nickName"/></th>
									<td width="35%">${m.customerInfoModel.nickName }</td>
									<th width="15%"><aebiz:showTitle titleId="customerinfo.m.sex"/></th>
									<td width="35%">
										<c:choose>
											<c:when test="${m.customerInfoModel.sex=='1'}"><aebiz:showTitle titleId="customer.m.male" /></c:when>
											<c:when test="${m.customerInfoModel.sex=='2'}"><aebiz:showTitle titleId="customer.m.female" /></c:when>
											<c:when test="${m.customerInfoModel.sex=='3'}"><aebiz:showTitle titleId="customer.m.secret"/></c:when>
										</c:choose>
									</td>
								</tr>
								
								<tr>
									<th><aebiz:showTitle titleId="customerinfo.m.marryState"/></th>
									<td>
										<c:choose>
											<c:when test="${m.customerInfoModel.marryState=='1'}"><aebiz:showTitle titleId="customer.m.married" /></c:when>
											<c:when test="${m.customerInfoModel.marryState=='2'}"><aebiz:showTitle titleId="customer.m.unmarried" /></c:when>
											<c:when test="${m.customerInfoModel.marryState=='3'}"><aebiz:showTitle titleId="customer.m.secret"/></c:when>
										</c:choose>
									</td>
									<th><aebiz:showTitle titleId="customerinfo.m.birthday"/></th>
									<td>${m.customerInfoModel.birthday}</td>
								</tr>	
												
								<tr>
									<th><aebiz:showTitle titleId="customerinfo.m.hobby"/></th>
									<td>
										<c:if test="${!empty tagList}">
											<c:forEach items="${tagList}" var="tag">
												${tag}
											</c:forEach>
										</c:if>
									</td>
									<th><aebiz:showTitle titleId="customerinfo.m.industry"/></th>
									<td>
										<c:forEach items="${industryList}" var="dpp">
											<c:if test="${m.customerInfoModel.industry==dpp.name}">
												<c:out value="${dpp.value}"></c:out>
											</c:if>
										</c:forEach>
									</td>
								</tr>	
												
								<tr>
									<th><aebiz:showTitle titleId="customerinfo.m.income"/></th>
									<td>
										<c:forEach items="${incomeList}" var="dpp">
											<c:if test="${m.customerInfoModel.income==dpp.name}">
												<c:out value="${dpp.value}"></c:out>
											</c:if>
										</c:forEach>
									</td>
									
									<th><aebiz:showTitle titleId="customerinfo.m.education"/></th>
									<td>
										<c:forEach items="${educationList}" var="dpp">
											<c:if test="${m.customerInfoModel.education==dpp.name}">
												<c:out value="${dpp.value}"></c:out>
											</c:if>
										</c:forEach>
									</td>
								</tr>	
								
								<tr>
									<th><aebiz:showTitle titleId="customerinfo.m.area"/></th>
									<td>${m.customerInfoModel.area}</td>
									<th><aebiz:showTitle titleId="customerinfo.m.address"/></th>
									<td>${m.customerInfoModel.address}</td>
								</tr>
								
								<tr>
									<th><aebiz:showTitle titleId="customer.view.personalImg"/></th>
									<td colspan="3">
										<ul class="gallery">
										<c:choose>
											<c:when test="${!empty m.customerInfoModel.imgUrl}">
												<li><a href="#"><img src="${m.customerInfoModel.imgUrl}" alt="logo"></a>
												<div class="extras">
													<div class="extras-inner">
														<a href="${m.customerInfoModel.imgUrl}" class='colorbox-image' rel="group-1" target="_blank"> <i class="fa fa-search"></i></a>
													</div>
												</div>
											</li>
											</c:when>
											<c:otherwise>
												<li><a href="#"><img src="${pageContext.servletContext.contextPath}/static/sysback/img/default.jpg" alt="logo"></a>
													<div class="extras">
														<div class="extras-inner">
															<a href="${pageContext.servletContext.contextPath}/static/sysback/img/default.jpg" class='colorbox-image' rel="group-1" target="_blank"> <i class="fa fa-search"></i></a>
														</div>
													</div>
												</li>
											</c:otherwise>
										</c:choose>
										</ul>
									</td>						
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="tab-pane" id="AuthInfo">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th width="15%"><aebiz:showTitle titleId="customerauth.m.realName"/></th>
									<td width="35%">${m.customerAuthModel.realName}</td>
									<th width="15%"><aebiz:showTitle titleId="customerauth.m.authState"/></th>
									<td width="35%">
										<c:if test="${m.customerAuthModel.authState=='0'}">
											<aebiz:showTitle titleId="customerauth_authstate_unauthed" />
										</c:if>
										<c:if test="${m.customerAuthModel.authState=='1'}">
											<aebiz:showTitle titleId="customerauth_authstate_authed" />
										</c:if>
										<c:if test="${m.customerAuthModel.authState=='2'}">
											<aebiz:showTitle titleId="customerauth_authstate_applied" />
										</c:if>
										<c:if test="${m.customerAuthModel.authState=='3'}">
											<aebiz:showTitle titleId="customerauth_authstate_unapplied" />
										</c:if>
									</td>
								</tr>
								
								<tr>
									<th><aebiz:showTitle titleId="customerauth.m.certType"/></th>
									<td>
										<c:forEach items="${certTypeList}" var="dpp">
											<c:if test="${m.customerAuthModel.certType==dpp.name}">
												<c:out value="${dpp.value}"></c:out>
											</c:if>
										</c:forEach>
									</td>
									<th><aebiz:showTitle titleId="customerauth.m.certCode"/></th>
									<td>${m.customerAuthModel.certCode}</td>
								</tr>
								
								<tr>
									<th><aebiz:showTitle titleId="customerauth.m.authApplyTime"/></th>
									<td>${m.customerAuthModel.authApplyTime }</td>
									<th><aebiz:showTitle titleId="customerauth.m.auditTime"/></th>
									<td>${m.customerAuthModel.auditTime}</td>
								</tr>
								
								<tr>
									<th><aebiz:showTitle titleId="customerauth.m.auditReason"/></th>
									<td colspan="3">${m.customerAuthModel.auditReason}</td>
								</tr>
								
								<tr>
									<th><aebiz:showTitle titleId="customer.view.certImage1"/></th>
									<td>
										<ul class="gallery">
										<c:choose>
											<c:when test="${!empty m.customerAuthModel.certImage1Url}">
												<li><a href="#"><img src="${m.customerAuthModel.certImage1Url}" alt="logo"></a>
												<div class="extras">
													<div class="extras-inner">
														<a href="${m.customerAuthModel.certImage1Url}" class='colorbox-image' rel="group-1" target="_blank"> <i class="fa fa-search"></i></a>
													</div>
												</div>
											</li>
											</c:when>
											<c:otherwise>
												<li><a href="#"><img src="${pageContext.servletContext.contextPath}/static/sysback/img/default.jpg" alt="logo"></a>
													<div class="extras">
														<div class="extras-inner">
															<a href="${pageContext.servletContext.contextPath}/static/sysback/img/default.jpg" class='colorbox-image' rel="group-1" target="_blank"> <i class="fa fa-search"></i></a>
														</div>
													</div>
												</li>
											</c:otherwise>
										</c:choose>
										</ul>
									</td>
									<th><aebiz:showTitle titleId="customer.view.certImage2"/></th>
									<td>
										<ul class="gallery">
										<c:choose>
											<c:when test="${!empty m.customerAuthModel.certImage2Url}">
												<li><a href="#"><img src="${m.customerAuthModel.certImage2Url}" alt="logo"></a>
												<div class="extras">
													<div class="extras-inner">
														<a href="${m.customerAuthModel.certImage2Url}" class='colorbox-image' rel="group-1" target="_blank"> <i class="fa fa-search"></i></a>
													</div>
												</div>
											</li>
											</c:when>
											<c:otherwise>
												<li><a href="#"><img src="${pageContext.servletContext.contextPath}/static/sysback/img/default.jpg" alt="logo"></a>
													<div class="extras">
														<div class="extras-inner">
															<a href="${pageContext.servletContext.contextPath}/static/sysback/img/default.jpg" class='colorbox-image' rel="group-1" target="_blank"> <i class="fa fa-search"></i></a>
														</div>
													</div>
												</li>
											</c:otherwise>
										</c:choose>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="tab-pane" id="SourceInfo">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th width="15%"><aebiz:showTitle titleId="customersource.m.clientType"/></th>
									<td width="35%">
										<c:forEach items="${clientTypeList}" var="dpp">	
											<c:if test="${m.customerSourceModel.clientType==dpp.name}">
												<c:out value="${dpp.value }"></c:out>
											</c:if>
										</c:forEach>
									</td>
									<th width="15%"><aebiz:showTitle titleId="customersource.m.siteType"/></th>
									<td width="35%">
										<c:forEach items="${siteTypeList}" var="dpp">	
											<c:if test="${m.customerSourceModel.siteType==dpp.name }">
												<c:out value="${dpp.value}"></c:out>
											</c:if>
										</c:forEach>
									</td>
								</tr>
								
								<tr>
									<th><aebiz:showTitle titleId="customersource.m.thirdPlatType"/></th>
									<td>
										<c:forEach items="${thirdPlatList}" var="dpp">	
											<c:if test="${m.customerSourceModel.thirdPlatType==dpp.name }">
												<c:out value="${dpp.value }"></c:out>
											</c:if>
										</c:forEach>	
									</td>
									<th><aebiz:showTitle titleId="customersource.m.formUrl"/></th>
									<td>${m.customerSourceModel.formUrl }</td>
								</tr>
								
								<tr>
									<th><aebiz:showTitle titleId="customersource.m.introducer"/></th>
									<td colspan="3">${m.customerSourceModel.introducer}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="y_fixedbtn">
			<button type="button" class="btn btn-primary cancel btn-large a_size_1"><aebiz:showTitle titleId="basebusiness.showmessage.return"/></button>
		</div>
	</div>
<script>
   $(function(){
		$(".cancel").click(function(){
			history.go(-1) ;
		});		
	 });
</script>

</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>