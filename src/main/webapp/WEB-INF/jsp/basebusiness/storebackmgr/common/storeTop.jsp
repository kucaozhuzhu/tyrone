<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div id="navigation">
		<div class="container-fluid">
			<a href="${pageContext.servletContext.contextPath}/store/toIndex" id="brand">酷友商城</a>
			<a href="#" class="toggle-nav" rel="tooltip" data-placement="bottom" title="Toggle navigation">
				<i class="fa fa-bars"></i>
			</a>
			<ul class='main-nav'>
				<c:forEach items="${Menu_One}" var="smmOne">	
					<li <c:if test="${parentId == smmOne.uuid}">class='active'</c:if>>
						<a href="javascript:void(0);" onClick="javascript:addCookies('${smmOne.uuid}','${smmOne.toUrl}');">
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
										<em>未读新消息</em>
									</li>
								</c:when>
								<c:otherwise>
									<li class="notification-header">
										<em>您有${messageCount}条未读消息</em>
									</li>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${messageCount==0}">
									<li>
										<a  href="javascript:void(0);">
											<div class="details">
												<div class="media-body" onClick="javascript:addLeftAndTopCookies('rePlatMenu0000000121','rePlatMenu0000000202','storeback/innermessage/toList');">
													<p class="text">没有消息了</p>
												</div>
											</div>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<c:forEach items="${messageList}" var="message" varStatus="status">
										<c:if test="${status.index < 3}">
										<li>
											<a href="javascript:void(0);">
												<img class="media-object" src="${message.userImage}">
												<div class="details">
													<div class="name">${message.sendUserName}</div>
													<div class="message" onClick="javascript:addLeftAndTopCookies('rePlatMenu0000000121','rePlatMenu0000000202','storeback/innermessage/toView/${message.uuid}');">
														${message.title}
													</div>
												</div>
											</a>
										</li>
										</c:if>
									</c:forEach>
									
									<li>
										<a onClick="javascript:addLeftAndTopCookies('rePlatMenu0000000121','rePlatMenu0000000202','storeback/innermessage/toList');" href="javascript:void(0);" class='more-messages'>进入消息中心
											<i class="fa fa-arrow-right"></i>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</li>
					
					<div class="dropdown">
						<a href="#" class='dropdown-toggle' data-toggle="dropdown">${accountModel.storeName }
						 <c:choose>
			        			<c:when test="${empty companyInfoModel.logoPath}">
			        			<img src="${pageContext.servletContext.contextPath}/static/frontpage/img/shop_head.png" style="width:25px;height:25px;">
			        			</c:when>
			        			<c:otherwise>
			        			<img src="${companyInfoModel.logoPath }" alt="" style="width:25px;height:25px;">
			        			</c:otherwise>
			        		</c:choose>
						
						</a>
						<ul class="dropdown-menu pull-right">
							<li>
								<a href="${pageContext.servletContext.contextPath}/store/logout">退出</a>
							</li>
						</ul>
					</div>
			</div>
		</div>
	</div>
<script>
function addCookies(parentId,url){
	//var str = "CHOOSEMENU="+parentId;
	//document.cookie=str; 
	$.get("${pageContext.servletContext.contextPath}/store/addCookies/"+parentId,
			{runN:Math.random()},
			function(data) {
			if("success" == data){
				window.location.href="${pageContext.servletContext.contextPath}/"+url;
			}
			});
}

function addLeftAndTopCookies(parentId,menuId,url){
	$.get("${pageContext.servletContext.contextPath}/store/addLeftAndTopCookies/"+parentId+"/"+menuId,
			{},
			function(data) {
			if("success" == data){
				window.location.href="${pageContext.servletContext.contextPath}/"+url;
			}
			});
}
</script>