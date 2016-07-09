<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title>酷友商城-最先进的电商平台</title>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz_header-0.1.js"></script>
</head>

<body class="theme-darkblue">
		<div class="container-fluid">
			<a href="${pageContext.servletContext.contextPath}/admin/toIndex" id="brand">酷友商城</a>			
			
				<a href="#" class="toggle-nav" rel="tooltip" data-placement="bottom" title="Toggle navigation">
					<i class="fa fa-bars"></i>
				</a>
			
				<ul class='main-nav'>
					<c:forEach items="${Menu_One}" var="smmOne">	
						<li <c:if test="${selMenu==smmOne.uuid}">class="active"</c:if>>
							<a href="${pageContext.servletContext.contextPath}/admin/toIndex/${smmOne.uuid}?selMenu=${smmOne.uuid}" target="menuFrame">
								<span>${smmOne.name}</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			<div class="user">
				<ul class="icon-nav">
					<li class='dropdown'>
						<c:choose>
							<c:when test="${messageCount==0}">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="fa fa-envelope"></i>
								</a>
							</c:when>
							<c:otherwise>
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="fa fa-envelope"></i>
									<span class="label label-lightred">${messageCount}</span>
								</a>
							</c:otherwise>
						</c:choose>
						
						<ul class="dropdown-menu pull-right message-ul">
							<c:choose>
								<c:when test="${messageCount==0}">
									<li class="notification-header">
										<em>待处理事项</em>
									</li>
								</c:when>
								<c:otherwise>
									<li class="notification-header">
										<em>您有${messageCount}个待处理事项</em>
									</li>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${messageCount==0}">
									<li>
										<a  href="javascript:void(0);">
											<div class="details">
												<div class="media-body" onClick="javascript:addLeftAndTopCookies('rePlatMenu0000000121','rePlatMenu0000000202','storeback/innermessage/toList');">
													<p class="text">没有待处理事项了</p>
												</div>
											</div>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<c:if test="${dealerCount gt 0}">
									<li>
										<a href="${pageContext.servletContext.contextPath}/admin/toIndex/SysMenu0000001291?selMenu=SysMenu0000001291&toUrl=${pageContext.servletContext.contextPath}/sysback/bcustomerinfo/toList?auditStatus=0" target="mainFrame">
											<%--<img class="media-object" src="${message.userImage}">--%>
											<div class="details">
												<%--<div class="name">${message.sendUserName}</div>--%>
												<div class="message" onClick="javascript:openPage('rePlatMenu0000000121','rePlatMenu0000000202','sysback/bcustomerinfo/toList">
													待审核门店(${dealerCount})
												</div>
											</div>
										</a>
									</li>
									</c:if>
									<c:if test="${storeCount gt 0}">
									<li>
										<a href="${pageContext.servletContext.contextPath}/admin/toIndex/SysMenu0000000321?selMenu=SysMenu0000000321&toUrl=${pageContext.servletContext.contextPath}/sysback/storecomplex/toList?auditStatus=0" target="mainFrame">
											<%--<img class="media-object" src="${message.userImage}">--%>
											<div class="details">
												<%--<div class="name">${message.sendUserName}</div>--%>
												<div class="message">
													待审核供应商(${storeCount})
												</div>
											</div>
										</a>
									</li>
									</c:if>
									<c:if test="${productCount gt 0}">
									<li>
										<a href="${pageContext.servletContext.contextPath}/admin/toIndex/SysMenu0000000191?selMenu=SysMenu0000000191&toUrl=${pageContext.servletContext.contextPath}/sysback/product/toAudit" target="mainFrame">
											<%--<img class="media-object" src="${message.userImage}">--%>
											<div class="details">
												<%--<div class="name">${message.sendUserName}</div>--%>
												<div class="message">
													待审核商品(${productCount})
												</div>
											</div>
										</a>
									</li>
									</c:if>
									<c:if test="${orderAfterCount gt 0}">
									<li>
										<a href="${pageContext.servletContext.contextPath}/admin/toIndex/SysMenu0000000211?selMenu=SysMenu0000000211&toUrl=${pageContext.servletContext.contextPath}/sysback/afterSale/toList?state=6,7" target="mainFrame">
											<%--<img class="media-object" src="${message.userImage}">--%>
											<div class="details">
												<%--<div class="name">${message.sendUserName}</div>--%>
												<div class="message">
													待处理售后单(${orderAfterCount})
												</div>
											</div>
										</a>
									</li>
									</c:if>
								</c:otherwise>
							</c:choose>
						</ul>
					</li>
				</ul>
				<div class="dropdown">
					<a href="#" class='dropdown-toggle' data-toggle="dropdown">${LoginUserName}
						<%-- <img src="${pageContext.servletContext.contextPath}/static/sysback/img/demo/user-avatar.jpg" alt=""> --%>
					</a>
					<ul class="dropdown-menu pull-right">
						<li>
							<a href="${pageContext.servletContext.contextPath}/admin/logout">退出</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>
