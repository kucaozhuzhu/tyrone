<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->

	<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>	
	<title><aebiz:showTitle titleId="ucenter_customerInfo_title"/></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="description" content="KingAdmin - Bootstrap Admin Dashboard Theme">
	<meta name="author" content="The Develovers">
	<style>
	 table.r_verticalalignM tr td span.has-error.help-block{width:78px;}
	</style>
	
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/datepicker/datepicker.css">
</head>

<body>
	<!-- WRAPPER 头部、左侧、右侧大框架 -->
	<div class="wrapper">
		<!-- TOP BAR 头部导航 -->
		<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterHead.jsp"%>
		<!-- /top -->
		<div class="container">
			<div class="ku_crumbs">
				<a href="${pageContext.servletContext.contextPath}/customer/toIndex">首页</a><b>&gt</b><span>个人资料</span>
			</div>
		</div>
		<!-- BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT 左侧导航和右侧主体 -->
		<div class="bottom">
			<div class="container">
				<div class="row">
					<!-- left sidebar 左侧导航 -->
					<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterLeft.jsp"%>
					<!-- end left sidebar -->

					<!-- content-wrapper 右侧主体 -->
					<div class="col-xs-10 content-wrapper ku_orderlist">
						<%--
						<div class="row">
							<div class="col-sm-4 ">
								<ul class="breadcrumb">
									<li>
										<i class="fa fa-home"></i>
										<a href="${pageContext.servletContext.contextPath}/customer/toIndex"><aebiz:showTitle titleId="ucenter_indexPage_membercenter"/></a>
									</li>
									<li class="active"><aebiz:showTitle titleId="ucenter_customerInfo_title"/></li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
						</div>
						--%>
						<!-- main -->
						<div class="content">
							<div class="main-header">
								<h2><aebiz:showTitle titleId="ucenter_customerInfo_title"/></h2>
								<%--<em>user profile page</em>--%>
							</div>

							<div class="main-content">
								<ul class="nav nav-tabs ku_tabs">
									<li class="active">
										<a href="${pageContext.servletContext.contextPath}/usercenter/customercomplex/toModifyCustomerInfo">
											<i class="fa fa-user"></i>
											<aebiz:showTitle titleId="ucenter_customerInfo_baseInfo"/>
										</a>
									</li>
									<li>
										<a href="${pageContext.servletContext.contextPath}/usercenter/customercomplex/toUploadImage">
											<i class="fa fa-camera"></i>
											<aebiz:showTitle titleId="ucenter_customerInfo_Image"/>
										</a>
									</li>
								</ul>
								
								<div class="tab-content profile-page">
									<div class="profile" id="profile-tab">
										<div class="row">
										
											<div class="col-xs-4">
												<div class="user-info-left">
													<div class="your-feed">
														<div class="view-img">
															<c:choose>
																<c:when test="${!empty m.customerInfoModel.imgUrl}">
																	<img src="${m.customerInfoModel.imgUrl}">
																</c:when>
																<c:otherwise>
																	<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/default.png">
																</c:otherwise>
															</c:choose>
														</div>
													</div>
													
													<h2>${m.customerModel.customerName}<sup class="sr-only">online</sup></h2>	
													<%--<p style="margin-top:-10px;">${m.customerShopLevelModel.levelName}</p>--%>
													<div class="ac" style="margin:10px auto;width:100%;text-align:center;">
													注：修改手机和邮箱请到
													<a class="ml5 ftx05" href="${pageContext.servletContext.contextPath}/usercenter/customer/toSecuritySetting">安全中心</a>
													</div>
													<%--										
													<div class="contact">
														<c:if test="${empty m.customerModel.mobile}">
															<a href="${pageContext.servletContext.contextPath}/usercenter/customer/toBindMobile/${m.customerModel.uuid}" class="btn btn-block btn-custom-secondary">
																<i class="fa fa-book"></i>
																<aebiz:showTitle titleId="ucenter_customerInfo_bindMobile"/>
															</a>
														</c:if>
														<c:if test="${empty m.customerModel.email}">
															<a href="${pageContext.servletContext.contextPath}/usercenter/customer/toBindEmail/${m.customerModel.uuid}" class="btn btn-block btn-custom-primary">
																<i class="fa fa-envelope-o"></i>
																<aebiz:showTitle titleId="ucenter_customerInfo_bindEmail"/>
															</a>
														</c:if>
													</div>
													--%>
												</div>
											</div>	
											<!-- 修改开始 -->
											<input type="hidden" id="uuid" value="${m.customerModel.uuid}">
											<div class="col-xs-7">
											  <div class="user-info-right">
												 <div class="basic-info">
													 <%--<h3 style="padding-left:40px;"><i class="fa fa-square"></i><aebiz:showTitle titleId="ucenter_customerInfo_baseInfo"/></h3>--%>
													 <form:form id="mainForm" action="${pageContext.servletContext.contextPath}/usercenter/customercomplex/doModifyCustomerInfo" method="post" commandName="m" class='form-horizontal form-validate form-bordered'>
														<form:hidden path="customerInfoModel.customerUuid"/>
														<form:hidden path="customerModel.uuid"/>
														<input type="hidden" name="customerInfoModel.province" />
														<input type="hidden" name="customerInfoModel.city" />
														<input type="hidden" name="customerInfoModel.region"/> 
														
												     	<table id="user" class="table table-bordered r_verticalalignM">
													 		<tbody>
																<tr>
																	<td width="25%" class="user-work"><aebiz:showTitle titleId="ucenter_customerInfo_nickName"/>：</td>
																	<td width="75%"><form:input path="customerInfoModel.nickName" maxlength="20" class='form-control' data-rule-maxlength="20"/></td>
																</tr>
																
																<tr>
																	<td class="user-work"><aebiz:showTitle titleId="ucenter_customerInfo_sex"/>：</td>
																	<td>
																		<span><form:radiobutton path="customerInfoModel.sex" id="c1" value="1" class="icheck-me" data-skin="square" data-color="blue"/><label for="c1"><aebiz:showTitle titleId="ucenter_customerInfo_male"/></label></span>
																		<span><form:radiobutton path="customerInfoModel.sex" id="c2" value="2" class="icheck-me" data-skin="square" data-color="blue"/><label for="c2"><aebiz:showTitle titleId="ucenter_customerInfo_female"></aebiz:showTitle></label></span>	
																		<%--<span></spab><form:radiobutton path="customerInfoModel.sex" id="c3" value="3" class="icheck-me"  data-skin="square" data-color="blue"/><label for="c3"><aebiz:showTitle titleId="ucenter_customerInfo_security"/></label></span>--%>
																	</td>
																</tr>
																<%--
																<tr>
																	<td width="15%" class="user-work"><aebiz:showTitle titleId="ucenter_customerInfo_marryState"/>：</td>
																	<td width="85%">
																		<span><form:radiobutton path="customerInfoModel.marryState" id="c4" value="1" class="icheck-me" data-skin="square" data-color="blue"/><label for="c4"><aebiz:showTitle titleId="ucenter_customerInfo_married"/></label></span>
																		<span><form:radiobutton path="customerInfoModel.marryState" id="c5" value="2" class="icheck-me" data-skin="square" data-color="blue"/><label for="c5"><aebiz:showTitle titleId="ucenter_customerInfo_notMarried"/></label>	</span>
																		<span><form:radiobutton path="customerInfoModel.marryState" id="c6" value="3" class="icheck-me"  data-skin="square" data-color="blue"/><label for="c6"><aebiz:showTitle titleId="ucenter_customerInfo_security"/></label></span>
																	</td>
																</tr>
																--%>
																<tr>
																	<td class="user-work"><aebiz:showTitle titleId="ucenter_customerInfo_birthday"/>：</td>
																	<td><form:input path="customerInfoModel.birthday" class='form-control datepick' readOnly="true"/></td>
																</tr>
																
																<tr>
																	<td class="user-work"><aebiz:showTitle titleId="ucenter_customerInfo_hobby"/>：</td>
																	<td><form:input path="customerInfoModel.hobby" maxlength="10" class='form-control' data-rule-maxlength="10"/></td>
																</tr>
																
																<tr>
																	<td class="user-work">邮箱：</td>
																	<td><form:input path="customerModel.email"  class='form-control'/></td>
																</tr>
																
																
																<tr>
																	<td class="user-work">真实姓名：</td>
																	<td><form:input path="customerInfoModel.realName" maxlength="10" class='form-control' data-rule-maxlength="10"/></td>
																</tr>
																<%--
																<tr>
																	<td class="user-work"><aebiz:showTitle titleId="ucenter_customerInfo_hobby"/>：</td>
																	<td>
																		<input type="hidden" name="customerInfoModel.hobby">
																		<c:forEach items="${tagModelList}" var="tag">
																			<div style="width:80%">	
																				<span class="y_item" id ="${tag.uuid}">
																					<a href="javascript:void(0);" onclick="addTag(this);">${tag.tagName}</a>
																					<s></s>
																				</span>
																			</div>
																		</c:forEach>																	
																	</td>
																</tr>
																
																<tr>
																	<td class="user-work"><aebiz:showTitle titleId="ucenter_customerInfo_industry"/>：</td>
																	<td>
																		<form:select path="customerInfoModel.industry" class='select2-me form-control' style="width:80%">								
																			<form:option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</form:option>
																			<c:forEach items="${industryList}" var="dpp">	
																				<form:option value="${dpp.name}">${dpp.value}</form:option>
																			</c:forEach>										
																		</form:select>
																	</td>
																</tr>
															
																<tr>
																	<td class="user-work"><aebiz:showTitle titleId="ucenter_customerInfo_education"/>：</td>
																	<td>
																		<form:select path="customerInfoModel.education" class='select2-me form-control' style="width:80%">								
																			<form:option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</form:option>
																			<c:forEach items="${educationList}" var="dpp">	
																				<form:option value="${dpp.name}">${dpp.value}</form:option>
																			</c:forEach>										
																		</form:select>
																	</td>
																</tr>
																	
																<tr>
																	<td class="user-work"><aebiz:showTitle titleId="ucenter_customerInfo_income"/>：</td>
																	<td>	
																		<form:select path="customerInfoModel.income" class='select2-me form-control' style="width:80%">								
																			<form:option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</form:option>
																			<c:forEach items="${incomeList}" var="dpp">	
																				<form:option value="${dpp.name}">${dpp.value}</form:option>
																			</c:forEach>										
																		</form:select>
																	</td>
																</tr>
																	--%>
																<tr>
																	<td class="user-work"><aebiz:showTitle titleId="ucenter_customerInfo_residence"/>：</td>
																	<td><aebiz:myshortarea checkProvince="${m.customerInfoModel.province}" checkCity="${m.customerInfoModel.city}" checkRegion="${m.customerInfoModel.region}"></aebiz:myshortarea></td>
																</tr>
																<%--
																<tr>
																	<td class="user-work"><aebiz:showTitle titleId="ucenter_customerInfo_address"/>：</td>
																	<td><form:textarea path="customerInfoModel.address" class='form-control' maxlength="100" data-rule-maxlength="100"/></td>
																</tr>
																--%>
															</tbody>
														</table>	
														
														 <p class="img-save" style="margin-left:27%; text-align:left;">
															 <input type="button" class="btn btn-warning submit" value='<aebiz:showTitle titleId="basebusiness.showmessage.save"></aebiz:showTitle>'>
														 </p>		
													 </form:form>
											  	 </div>
											  </div>
										    </div>
																<!-- 修改结束 -->						
										</div>
									</div>
								</div>
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
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterBottom.jsp"%>
<script src="${pageContext.request.contextPath }/static/usercenter/js/king-elements.js"></script>
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImportJs.jsp"%>	
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.datepicker.js"></script>
<script src="${pageContext.request.contextPath }/static/usercenter/js/validation/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/static/usercenter/js/validation/aebiz.validate.js"></script>

<script>
function addTag(o){
	$(o).parent().toggleClass("active");
}

$(function(){
	/* var tagStr = "${m.customerInfoModel.hobby}";
	var tagArr = tagStr.split(",");
 */
	/* $(".y_item").each(function(){
		var tagUuid = $.trim($(this).attr("id"));
		for(var i = 0 ; i < tagArr.length ; i++){
			var myTag = $.trim(tagArr[i]);
			if(tagUuid == myTag){
				$(this).addClass("active");
			}
		}
	}); */
	
	$(".submit").click(function(){
		$("input[name='customerInfoModel.province']:hidden").val($("select[name='province']").val());
		$("input[name='customerInfoModel.city']:hidden").val($("select[name='city']").val());
		$("input[name='customerInfoModel.region']:hidden").val($("select[name='region']").val());
		var tags = "";
		
		/* $(".y_item").each(function(){
			if($(this).is(".active")){
				tags += $(this).attr("id") + ",";
			}
		}); */

		$("input[name='customerInfoModel.hobby']:hidden").val(tags);
		
		$("#mainForm").submit();
	});
	
	$(".title-imagebox").hover(function(){
		$(this).find(".change-image").fadeIn();},function(){
	    $(this).find(".change-image").fadeOut();	
	});
});
</script>
</body>
</html>