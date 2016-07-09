<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!-- TOP BAR 头部导航 -->
<div class="top-bar">
	<div class="container">
		<div class="row">
			<!-- logo -->
			<div class="col-mi-4 col-xs-2 logo">
				<label id="to_home"><a href="${pageContext.servletContext.contextPath}/"><img src="${pageContext.servletContext.contextPath}/static/frontpage/img/mem_logo.png"></a></label>
				<h1 class="sr-only">酷友商城</h1>
			</div>
			
			<!-- 频道导航 -->
			<div class="col-mi-8 col-xs-4" style="*position:relative;*z-index:999;">
				<a class="btn btn-link y_xzcur" href="${pageContext.servletContext.contextPath}/customer/toIndex">我的酷友商城</a>
				
				<div class="account_setting">
					<a class="btn btn-link y_xzcur" href="${pageContext.servletContext.contextPath}/usercenter/customer/toSecuritySetting">账户管理</a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.servletContext.contextPath}/usercenter/customer/toSecuritySetting"><aebiz:showTitle titleId="ucenter_head_safetyCenter"/></a></li>	
						<li><a href="${pageContext.servletContext.contextPath}/usercenter/customercomplex/toModifyCustomerInfo"><aebiz:showTitle titleId="ucenter_head_personalInfo"/></a></li>
						<li><a href="${pageContext.servletContext.contextPath}/usercenter/customeraddress/toCustomerAddress"><aebiz:showTitle titleId="ucenter_head_deliveryAddress"/></a></li>	
						<li><a href="${pageContext.servletContext.contextPath}/usercenter/customersubscription/toMySubscription"><aebiz:showTitle titleId="ucenter_head_mySubscription"/></a></li>	
						<li><a href="${pageContext.servletContext.contextPath}/usercenter/messageremind/showMessageRemindList"><aebiz:showTitle titleId="ucenter_head_siteNotice"/></a></li>	
					</ul>
				</div>
				
				<div class="account_setting">
					<a class="btn btn-link y_xzcur" href="${pageContext.servletContext.contextPath}/usercenter/virtualaccountcustomercharge/toMyAccount">资产中心</a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.servletContext.contextPath}/usercenter/virtualaccountcustomercharge/toMyAccount"><span class="text">我的账户</span></a></li>
						<%-- <li><a href="${pageContext.servletContext.contextPath}/usercenter/virtualaccountcustomercharge/toWithdrawApply"><span class="text">提现申请</span></a></li> --%>
						<li><a href="${pageContext.servletContext.contextPath}/usercenter/vipclubintegrallog/toList/1/4"><span class="text">我的积分</span></a></li>
						<li><a href="${pageContext.servletContext.contextPath}/usercenter/coupondetails/toList"><span class="text">我的优惠券</span></a></li>
						<%-- <li><a href="${pageContext.servletContext.contextPath}/usercenter/customerbankrel/toBondBank"><span class="text">银行卡绑定</span></a></li> --%>
					</ul>
				</div>
			</div>
			<!--end 频道导航 -->
			
			<div class="col-mi-12 col-xs-6" style="*position:relative;*z-index:998;">
				<div class="top-bar-right">
					<!-- 搜索框 -->
					<div class="input-group searchbox">
						<input type="text" class="form-control" id="keyword" placeholder="请输入商品" onkeydown="javascript:if(event.keyCode==13) return search();">
						<span class="input-group-btn">
							<button class="btn btn-default" onclick="search();" type="button"><i class="fa fa-search"></i></button>
						</span>
					</div>
					<!-- end 搜索框 -->
					
					<!-- 响应式按钮（小屏时展示） -->
					<a href="#" class="visible-in-mi main-nav-toggle"><i class="fa fa-bars"></i></a>
					<!-- end 响应式按钮 -->
					
					<div class="notifications">
						<ul>
							<!-- 头部购物车信息 -->
							<li class="notification-item general">
								<div class="btn-group">
									<a href="${pageContext.servletContext.contextPath}/cart/cartshow" class="dropdown-toggle">
										<i class="fa fa-shopping-cart"></i><span class="count" id="cartCount">0</span>
									</a>
								</div>
							</li>
							<!-- end 头部购物车信息 -->

							<!-- 头部邮件信息 -->
							<li class="notification-item inbox">
								<div class="btn-group">
									<c:choose>
										<c:when test="${messageCount==0}">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown">
												<i class="fa fa-envelope"></i>
												<span class="circle"></span>
											</a>
										</c:when>
										<c:otherwise>
											<a href="#" class="dropdown-toggle" data-toggle="dropdown">
												<i class="fa fa-envelope"></i>
												<span class="count">${messageCount}</span>
												<span class="circle"></span>
											</a>
										</c:otherwise>
									</c:choose>
								
									<ul class="dropdown-menu" role="menu">
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
												<li class="inbox-item clearfix">
													<a href="${pageContext.servletContext.contextPath}/usercenter/innermessage/toList">
														<div class="media">
															<div class="media-body">
																<p class="text">没有消息了</p>
															</div>
														</div>
													</a>
												</li>
											</c:when>
											<c:otherwise>
												<c:forEach items="${messageList}" var="message">
													<li class="inbox-item clearfix">
														<a href="${pageContext.servletContext.contextPath}/usercenter/innermessage/toList">
															<div class="media">
																<div class="pull-left" href="#">
																	<c:choose>
																		<c:when test="${empty message.userImage}">
																			<img class="media-object" src="${pageContext.servletContext.contextPath}/static/usercenter/img/default.png" alt="Antonio">
																		</c:when>
																		<c:otherwise>
																			<img class="media-object" src="${message.userImage}" alt="Antonio">
																		</c:otherwise>
																	</c:choose>
																</div>
																<div class="media-body">
																	<h5 class="media-heading name">${message.title}</h5>
																	<p class="text">${message.content}</p>
																	<span class="timestamp">${message.sendTime}</span>
																</div>
															</div>
														</a>
													</li>
												</c:forEach>
												
												<li class="notification-footer">
													<a href="${pageContext.servletContext.contextPath}/usercenter/innermessage/toList">查看全部信件</a>
												</li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</li>
							<!-- end 头部邮件信息 -->
						</ul>
					</div>
					
					<!-- 头部用户信息和菜单 -->
					<div class="logged-user">
						<div class="btn-group">
							<a href="#" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
								<c:if test="${!empty info }">
									<c:choose>
						  				<c:when test="${!empty info.imgUrl}">
						  					<img width="25" height="25" src="${info.imgUrl}"/>
						  				</c:when>
					  					<c:otherwise>
					  						<img width="25" height="25" src="${pageContext.servletContext.contextPath}/static/usercenter/img/default.png">
					  					</c:otherwise>
					  				</c:choose>
									<span class="name">${info.nickName}</span> <span class="caret"></span>
								</c:if>
							</a>
							
							<ul class="dropdown-menu" role="menu">
								<li>
									<a href="${pageContext.servletContext.contextPath}/usercenter/virtualaccountcustomercharge/toMyAccount">
										<i class="fa fa-user"></i>
										<span class="text">账户信息</span>
									</a>
								</li>
								<li>
									<a href="${pageContext.servletContext.contextPath}/usercenter/customercomplex/toModifyCustomerInfo">
										<i class="fa fa-cog"></i>
										<span class="text">编辑资料</span>
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath }/customer/logout">
										<i class="fa fa-power-off"></i>
										<span class="text">退出</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- end 头部用户信息和菜单 -->
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	// main responsive nav toggle 页面分辨率较小时按钮点击切换左侧菜单显示、隐藏
	$('.main-nav-toggle').clickToggle(
		function() {
			$('.left-sidebar').slideDown(300)
		},
		function() {
			$('.left-sidebar').slideUp(300);
		}
	);
	
	$(function(){
		
		//获取购物车商品数量
		var url="${pageContext.servletContext.contextPath}/cart/ajaxCartCount";
		$.getJSON(url,{"time":Math.random()},
			function(data) {
				 $("#cartCount").html(data.count);
			});
		
	});
	
	function search(){
		var keyword =  $.trim($('#keyword').val());
		if(keyword==""){
			alert("请输入要搜索的关键字");
			$('#keyword').focus();
			return;
		}
		window.location.href="${pageContext.servletContext.contextPath}/front/productList/toProductList?keyword="+encodeURI(encodeURI(keyword));
	}	
</script>