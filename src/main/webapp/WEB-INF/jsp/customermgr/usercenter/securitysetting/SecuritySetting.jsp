<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->

    <%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>	
	<title><aebiz:showTitle titleId="ucenter_securitySet_safeCenter"/></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="description" content="KingAdmin - Bootstrap Admin Dashboard Theme">
	<meta name="author" content="The Develovers">
	
</head>

<body class="demo-only-page-blank general-ui-elements">
	
	<!-- WRAPPER 头部、左侧、右侧大框架 -->
	<div class="wrapper">
		<!-- TOP BAR 头部导航 -->
		<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterHead.jsp"%>
		<!-- /top -->
		<div class="container">
			<div class="ku_crumbs">
				<a href="${pageContext.servletContext.contextPath}/customer/toIndex">首页</a><b>&gt</b><span>安全中心</span>
			</div>
		</div>
		<!-- BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT 左侧导航和右侧主体 -->
		<div class="bottom">
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- left sidebar 左侧导航 -->
					<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterLeft.jsp"%>
					<!-- end left sidebar -->

					<!-- content-wrapper 右侧主体 -->
					<div class="col-xs-10 content-wrapper">
						<%--
						<div class="row">
							<div class="col-sm-4">
								<ul class="breadcrumb">
									<li>
										<i class="fa fa-home"></i>
										<a href="${pageContext.servletContext.contextPath}/customer/toIndex"><aebiz:showTitle titleId="ucenter_indexPage_membercenter"/></a>
									</li>
									<li class="active"><aebiz:showTitle titleId="ucenter_securitySet_safeCenter"/></li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
						</div>
						--%>
						
						<!-- main -->
						<div class="content ku_orderlist pb_40">
							<div class="ku_tit"><aebiz:showTitle titleId="ucenter_securitySet_safeCenter"/></div>
							<div class="main-content ku-content">
								<%--
								<div class="main-header">
									<h2><aebiz:showTitle titleId="ucenter_securitySet_safeCenter"/></h2>
									<em>Safe Center</em>
								</div>
								--%>
								
								<!--安全级别-->
								<c:choose>
									<c:when test="${securityCount < 4}">
										<div class="alert stor_safe alert-danger"> 
											<%--<i class="fa fa-shield"></i>--%>
											
											<div class="saf_ms">
												<label class='text-danger'><span class="ku_tit">安全等级：</span><aebiz:showTitle titleId="ucenter_securitySet_low"/>
													<span class='progress demo-only progress-sm'><span class='progress-bar progress-bar-danger' aria-valuetransitiongoal='33'></span></span>
												</label>
												<div class="clearfix">
													<p class="fl"><aebiz:showTitle titleId="ucenter_securitySet_securityAdvice"/></p>
													<p class="prev_time">
													<aebiz:showTitle titleId="ucenter_securitySet_lastLoginTime"/> ${lastLoginTime}<br/>
												  </p>
											   </div>
											</div>
										</div>
									</c:when>
									
									<c:when test="${securityCount < 5}">
										<div class="alert stor_safe alert-warning"> 
											<%--<i class="fa fa-shield"></i>--%>
											
											<div class="saf_ms">
												<label class='text-warning'><aebiz:showTitle titleId="ucenter_securitySet_middle"/>
												<span class='progress demo-only progress-sm'><span class='progress-bar progress-bar-warning' aria-valuetransitiongoal='67'></span></span>
												</label>
												<div class="clearfix">
													<p class="fl"><aebiz:showTitle titleId="ucenter_securitySet_securityAdvice"/></p>
													<p class="prev_time">
													<aebiz:showTitle titleId="ucenter_securitySet_lastLoginTime"/> ${lastLoginTime}
													(<aebiz:showTitle titleId="ucenter_securitySet_notYouLogin"/> <a href="${pageContext.servletContext.contextPath}/customer/logout"><aebiz:showTitle titleId="ucenter_securitySet_clickHere"/></a>)
												  </p>
											</div>
											</div>
										</div>
									</c:when>
									
									<c:otherwise>
										<div class="alert stor_safe alert-info"> 
											<i class="fa fa-shield"></i>
											<p class="prev_time">
												<aebiz:showTitle titleId="ucenter_securitySet_lastLoginTime"/> ${lastLoginTime}<br/>
												(<aebiz:showTitle titleId="ucenter_securitySet_notYouLogin"/> <a href="${pageContext.servletContext.contextPath}/customer/logout"><aebiz:showTitle titleId="ucenter_securitySet_clickHere"/></a>)
											</p>
											<div class="saf_ms">
												<label class='text-success'><aebiz:showTitle titleId="ucenter_securitySet_high"/>
												<span class='progress demo-only progress-sm'><span class='progress-bar progress-bar-success' aria-valuetransitiongoal='100'></span></span>
												</label>
												<p><aebiz:showTitle titleId="ucenter_securitySet_securityAdvice"/></p>
											</div>
										</div>
									</c:otherwise>								
								</c:choose>
								
								<!--安全模块-->
								<ul class="safeSet">
									<!-- 实名认证 -->
									<!-- 
									<li>
										<dl class="safe_1">
											<c:choose>
												<c:when test="${authState=='1'}"><dt class="text-warning"><i class="fa fa-times"></i></dt></c:when>
												<c:when test="${authState=='2'}"><dt class="text-success"><i class="fa fa-check"></i></dt></c:when>
												<c:when test="${authState=='3'}"><dt class="text-warning"><i class="fa fa-minus-circle"></i></dt></c:when>
												<c:otherwise><dt class="text-warning"><i class="fa fa-exclamation-triangle"></i></dt></c:otherwise>
											</c:choose>
											
											<dd class="y_state"><aebiz:showTitle titleId="ucenter_securitySet_auth"/></dd>
											
											<c:forEach items="${authStateList}" var="dpp">
												<c:if test="${dpp.name=='1' && dpp.name==authState}">
													<dd class="y_safebtn">
														<a href="${pageContext.servletContext.contextPath}/usercenter/customerauth/toCustomerAuth/${m.uuid}" class="btn btn-primary">
															<aebiz:showTitle titleId="ucenter_securitySet_authFailed"/>
														</a>
													</dd>
												</c:if>
												<c:if test="${dpp.name=='2' && dpp.name==authState}">
													<dd class="y_safebtn">
														<aebiz:showTitle titleId="ucenter_securitySet_authSuccess"/>
													</dd>
												</c:if>
												<c:if test="${dpp.name=='3' && dpp.name==authState}">
													<dd class="y_safebtn">
														<aebiz:showTitle titleId="ucenter_securitySet_waitAudit"/>
													</dd>
												</c:if>
												<c:if test="${dpp.name=='4' && dpp.name==authState}">
													<dd class="y_safebtn">
														<a href="${pageContext.servletContext.contextPath}/usercenter/customerauth/toCustomerAuth/${m.uuid}" class="btn btn-primary">
															<aebiz:showTitle titleId="ucenter_securitySet_authAtOnce"/>
														</a>
													</dd>
												</c:if>
											</c:forEach>
											
											<dd class="y_detial">
												<aebiz:showTitle titleId="ucenter_securitySet_authTip"/>
												<c:if test="${authState=='1'}">
													<div class="ts"><aebiz:showTitle titleId="customerauth.m.auditReason"/> :  ${auditReason}</div>
												</c:if>
											</dd>
										</dl>
									</li>
								 -->
									<!-- 登录密码 -->
									<li>
										<dl class="safe_2">
											<c:choose>
												<c:when test="${m.pwdStrength=='1'}"><dt class="text-warning"><i class="fa fa-times"></i></dt></c:when>
												<c:when test="${m.pwdStrength=='2'}"><dt class="text-success"><i class="fa fa-check"></i></dt></c:when>
												<c:when test="${m.pwdStrength=='3'}"><dt class="text-warning"><i class="fa fa-minus-circle"></i></dt></c:when>
												<c:otherwise><dt class="text-warning"><i class="fa fa-exclamation-triangle"></i></dt></c:otherwise>
											</c:choose>
											<dd class="y_state"><aebiz:showTitle titleId="ucenter_securitySet_loginPwd"/></dd>
											<dd class="y_safebtn"><a href="${pageContext.servletContext.contextPath}/usercenter/customer/tochangepwd" class="btn btn-default"><aebiz:showTitle titleId="ucenter_securitySet_modify"/></a></dd>
											<dd class="y_detial">
												<aebiz:showTitle titleId="ucenter_securitySet_securityTip"/>
												<div class="ts">
													<aebiz:showTitle titleId="ucenter_securitySet_strength"/>
													
													<c:choose>
														<c:when test="${m.pwdStrength=='1'}">
															<label class="text-danger"><aebiz:showTitle titleId='ucenter_securitySet_low'/><span class="progress demo-only progress-sm"><span class="progress-bar progress-bar-danger" aria-valuetransitiongoal="33"></span></span></label>
														</c:when>
														<c:when test="${m.pwdStrength=='2'}">
															<label class="text-warning"><aebiz:showTitle titleId='ucenter_securitySet_middle'/><span class="progress demo-only progress-sm"><span class="progress-bar progress-bar-warning" aria-valuetransitiongoal="67"></span></span></label>
														</c:when>
														<c:when test="${m.pwdStrength=='3'}">
															<label class="text-success"><aebiz:showTitle titleId='ucenter_securitySet_high'/><span class="progress demo-only progress-sm"><span class="progress-bar progress-bar-success" aria-valuetransitiongoal="100"></span></span></label>
														</c:when>
														<c:otherwise>
															<label class="text-danger"><aebiz:showTitle titleId='ucenter_securitySet_low'/><span class="progress demo-only progress-sm"><span class="progress-bar progress-bar-danger" aria-valuetransitiongoal="33"></span></span></label>
														</c:otherwise>
													</c:choose>
												</div>
											</dd>
										</dl>
									</li>
									
									<!-- 绑定手机 -->
									<li>
										<dl class="safe_3">
											<c:choose>
												<c:when test="${!empty m.mobile}"><dt class="text-success"><i class="fa fa-check"></i></dt></c:when>											
												<c:otherwise><dt class="text-warning"><i class="fa fa-exclamation-triangle"></i></dt></c:otherwise>
											</c:choose>
											<dd class="y_state"><aebiz:showTitle titleId="ucenter_securitySet_mobileBind"/></dd>
											
											<c:choose>
												<c:when test="${!empty m.mobile}">
													<dd class="y_safebtn"><a href="${pageContext.servletContext.contextPath}/usercenter/customer/toBindMobile/${m.uuid}" class="btn btn-default"><aebiz:showTitle titleId="ucenter_securitySet_modify"/> </a></dd>
												</c:when>
												<c:otherwise>
													<dd class="y_safebtn"><a href="${pageContext.servletContext.contextPath}/usercenter/customer/toBindMobile/${m.uuid}" class="btn btn-primary"><aebiz:showTitle titleId="ucenter_securitySet_bindAtOnce"/> </a></dd>
												</c:otherwise>
											</c:choose>
											
											<dd class="y_detial">
												<aebiz:showTitle titleId="ucenter_securitySet_mobileTip"/>
												<input type="hidden" id="mobileHidden" value="${m.mobile}">
												<c:if test="${!empty m.mobile}">
													<div class="ts ruo">
														<aebiz:showTitle titleId="ucenter_securitySet_alreadyBindMobile"/><strong id="bindMobile"></strong>
													</div>
												</c:if>
											</dd>
										</dl>
									</li>
									
									<!-- 绑定邮箱 -->
									<li>
										<dl class="safe_4">
											<c:choose>
												<c:when test="${!empty m.email}"><dt class="text-success"><i class="fa fa-check"></i></dt></c:when>
												<c:otherwise><dt class="text-warning"><i class="fa fa-exclamation-triangle"></i></dt></c:otherwise>
											</c:choose>
											<dd class="y_state"><aebiz:showTitle titleId="ucenter_securitySet_emailBind"/></dd>
											<c:choose>
												<c:when test="${!empty m.email}">
													<dd class="y_safebtn"><a href="${pageContext.servletContext.contextPath}/usercenter/customer/toBindEmail/${m.uuid}" class="btn btn-default"><aebiz:showTitle titleId="ucenter_securitySet_modify"/></a></dd>												
												</c:when>
												<c:otherwise>
													<dd class="y_safebtn"><a href="${pageContext.servletContext.contextPath}/usercenter/customer/toBindEmail/${m.uuid}" class="btn btn-primary"><aebiz:showTitle titleId="ucenter_securitySet_bindAtOnce"/></a></dd>
												</c:otherwise>
											</c:choose>
											<dd class="y_detial">
												<aebiz:showTitle titleId="ucenter_securitySet_emailTip"/>
												<input type="hidden" id="emailHidden" value="${m.email}">
												<c:if test="${!empty m.email}">
													<div class="ts ruo">
														<aebiz:showTitle titleId="ucenter_securitySet_alreadyBindEmail"/><strong id="bindEmail"></strong>
													</div>
												</c:if>
											</dd>
										</dl>
									</li>
									
									<!-- 支付密码 -->
									<%-- <li>
										<dl class="safe_5">
											<c:choose>
												<c:when test="${!empty payPwd}"><dt class="text-success"><i class="fa fa-check"></i></dt></c:when>
												<c:otherwise><dt class="text-warning"><i class="fa fa-exclamation-triangle"></i></dt></c:otherwise>
											</c:choose>
											<dd class="y_state"><aebiz:showTitle titleId="ucenter_securitySet_paymentCode"/></dd>
											<c:choose>
												<c:when test="${!empty payPwd}">
													<dd class="y_safebtn"><a href="${pageContext.servletContext.contextPath}/usercenter/customer/toChangePayPassword/${m.uuid}" class="btn btn-default"><aebiz:showTitle titleId="ucenter_securitySet_modify"/></a></dd>
												</c:when>
												<c:otherwise>
													<dd class="y_safebtn"><a href="${pageContext.servletContext.contextPath}/usercenter/customer/toSetPayPassword/${m.uuid}" class="btn btn-primary"><aebiz:showTitle titleId="ucenter_securitySet_setAtOnce"/></a></dd>
												</c:otherwise>
											</c:choose>
											<dd class="y_detial">
												<aebiz:showTitle titleId="ucenter_securitySet_payPasswordTip"/>
											</dd>
										</dl>
									</li> --%>
								</ul>
								
								<!--安全服务提示-->
								<dl class="y_safedl">
									<dt>安全服务提示</dt>
									<dd>1、确认您登录的<aebiz:platConfig codeName="platName"/><span class="f_color1"><aebiz:platConfig codeName="platDomain"/></span>，注意防范进入钓鱼网站，不要轻信各种即时通讯工具发送的商品或支付链接，谨防网购诈骗。</dd>
									<dd>2、建议您安装杀毒软件，并定期更新操作系统等软件补丁，确保账户及交易安全。 </dd>
								</dl>
								
								<!--常见问题
								<dl class="y_safedl y_answer">
									<dt>常见问题</dt>
									<dd><a href="#">1、如何设置和开启支付密码</a></dd>
									<dd><a href="#">2、如何验证手机和邮箱？</a></dd>
									<dd><a href="#">3、邮箱、手机想修改怎么办？</a></dd>
									<dd><a href="#">4、验证手机或邮箱时，提示已被他人验证了，怎么办？</a></dd>
									<dd><a href="#">5、如何提高我的账户安全性？</a></dd>
									<dd><a href="#">6、填写支付密码时，获取的短信验证码为什么每次都是错的？</a></dd>
								</dl>
								-->
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
<script src="${pageContext.request.contextPath }/static/usercenter/js/bootstrap-progressbar.js"></script>
<script src="${pageContext.request.contextPath }/static/usercenter/js/king-elements.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		//手机号不为空显示已经绑定的手机号
		var mobile=$("#mobileHidden").val();
		if(mobile!=""){
			$("#bindMobile").html(mobile.substring(0,3)+"****"+mobile.substring(7,11));
		}
		//邮箱不为空显示已经绑定的邮箱
		var email=$("#emailHidden").val();
		if(email!=""){
			var index=email.indexOf("@");
			var prefix = email.substring(0,index);
			if(prefix.length >=4){
				$("#bindEmail").html(email.substring(0,2)+"****"+email.substring(index-2,index)+email.substring(index));
			}else{
				$("#bindEmail").html(email.substring(0,1)+"****"+email.substring(index-1,index)+email.substring(index));
			}
		}
	}) 
</script>
</body>
</html>