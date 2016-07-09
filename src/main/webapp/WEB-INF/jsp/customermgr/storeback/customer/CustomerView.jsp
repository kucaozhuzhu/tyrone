<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!doctype html>
<html>

<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/import/UpdateImport.jsp" %>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/storeback/css/plugins/icheck/all.css">
<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/icheck/jquery.icheck.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/aebiz/aebiz.checkbox.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/fileupload/bootstrap-fileupload.min.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/storeback/css/plugins/colorbox/colorbox.css">
<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/colorbox/jquery.colorbox-min.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/aebiz/aebiz.colorbox.js"></script>

</head>

<body>
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/storeHead.jsp"%>
	<div class="container-fluid" id="content">
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/storeLeft.jsp"%>
		<div id="main">
			<div class="container-fluid">
				<div class="page-header">
					<div class="pull-left">
						<h1>会员信息查看</h1>
					</div>
				</div>
						
				<div class="breadcrumbs">
					<ul>
						<li><span><aebiz:showTitle titleId="customer.menuOne"/></span><i class="fa fa-angle-right"></i></li>
						<li><span><aebiz:showTitle titleId="customer.menuTwo"/></span><i class="fa fa-angle-right"></i></li>
						<li><span>会员信息查看</span></li>
					</ul>
				</div>
				
				<div class="box box-bordered bordered-top">
					<div class="box-content nopadding">
						<div class="tabs-container">
							<ul class="tabs tabs-inline tabs-left">
								<li class='active'><a href="#AccountInfo" data-toggle='tab'><i class="fa fa-lock"></i> <aebiz:showTitle titleId="customerInfo.m.customerAccountInfo"/></a></li>
								<li><a href="#BaseInfo" data-toggle='tab'><i class="fa fa-user"></i> <aebiz:showTitle titleId="customerinfo.moduleName_CN"/></a></li>
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
											<th><aebiz:showTitle titleId="customer.m.customerShopLevel"/></th>
											<td>${m.customerStoreLevelModel.levelName}</td>
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
											<td>${m.customerInfoModel.hobby}</td>
											<th><aebiz:showTitle titleId="customerinfo.m.address"/></th>
											<td>${m.customerInfoModel.address}</td>
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
											<%-- <td>
												<c:forEach items="${educationList}" var="dpp">
													<c:if test="${m.customerInfoModel.education==dpp.name}">
														<c:out value="${dpp.value}"></c:out>
													</c:if>
												</c:forEach>
											</td> --%>
										</tr>	
										
										<tr>
											<th><aebiz:showTitle titleId="customerinfo.m.industry"/></th>
											<td colspan="3">
												<c:forEach items="${industryList}" var="dpp">
													<c:if test="${m.customerInfoModel.industry==dpp.name}">
														<c:out value="${dpp.value}"></c:out>
													</c:if>
												</c:forEach>
											</td>
										</tr>
										
										<tr>
											<th><aebiz:showTitle titleId="customer.view.personalImg"/></th>
											<td>
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
														<li><a href="#"><img src="${pageContext.servletContext.contextPath}/static/storeback/img/default.jpg" alt="logo"></a>
															<div class="extras">
																<div class="extras-inner">
																	<a href="${pageContext.servletContext.contextPath}/static/storeback/img/default.jpg" class='colorbox-image' rel="group-1" target="_blank"> <i class="fa fa-search"></i></a>
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
						</div>
					</div>
				</div>
				
				<div class="y_fixedbtn">
					<button type="button" class="btn btn-primary cancel btn-large a_size_1"><aebiz:showTitle titleId="basebusiness.showmessage.return"/></button>
				</div>
				
			</div>
		</div>
	</div>

<script>
    $(document).ready(function() {
		$(".cancel").click(function(){
			history.go(-1) ;
		});	    	
    });
</script>
	
</body>
</html>

<aebiz:showErrorMsg></aebiz:showErrorMsg>