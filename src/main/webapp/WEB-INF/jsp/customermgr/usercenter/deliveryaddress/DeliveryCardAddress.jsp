<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->
	
	<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>	
	<title><aebiz:showTitle titleId="ucenter_deliveryAddress_title"/></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="description" content="KingAdmin - Bootstrap Admin Dashboard Theme">
	<meta name="author" content="The Develovers">
	
</head>

<body class="demo-only-page-blank">
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
					<!-- end left sidebar -->

					<!-- content-wrapper 右侧主体 -->
					<div class="col-xs-10 content-wrapper">
						<div class="row">
							<div class="col-sm-4 ">
								<ul class="breadcrumb">
									<li>
										<i class="fa fa-home"></i>
										<a href="${pageContext.servletContext.contextPath}/customer/toIndex"><aebiz:showTitle titleId="ucenter_indexPage_membercenter"/></a>
									</li>
									<li class="active">宅配卡配送地址</li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
						</div>
						
						<input type="hidden" id="addressId">
						<input type="hidden" id="customerId" value="">
						
						<!-- main -->
						<div class="content">
							<div class="main-header">
								<h2><aebiz:showTitle titleId="ucenter_deliveryAddress_title"/></h2>
								<em>The delivery address management</em>
							</div>
							
							<div class="main-content">
								
								<ul class="row">
									<c:forEach items="${cardAddressList}" var="customerAddressModel" varStatus="index">
										<li class="col-sm-4">
											<div class="y_addressbox">
												<div class="y_addtit y_clear mb_20">
													<c:if test="${index.last && order.state<6}">
													<a href="#address-edit" onclick="javascript:toEdit('${customerAddressModel.uuid}','{index.index+1 }')" class="btn btn-primary btn-sm" data-toggle="modal">
														<aebiz:showTitle titleId="basebusiness.showmessage.edit"/>
													</a>
													</c:if>
													<h4>第${index.index+1 }次配送地址</h4>
												</div>
												
												<dl>
													<dt><aebiz:showTitle titleId="ucenter_deliveryAddress_consignee"/>：</dt>
													<dd>${customerAddressModel.name}</dd>	
												</dl>
												
												<dl>
													<dt><aebiz:showTitle titleId="ucenter_deliveryAddress_detailAddress"/>：</dt>
													<dd>${customerAddressModel.address}</dd>	
												</dl>
												
												<dl>
													<dt><aebiz:showTitle titleId="ucenter_deliveryAddress_mobile"/>：</dt>
													<dd>${customerAddressModel.mobile}</dd>	
												</dl>
												
												<dl>
													<dt><aebiz:showTitle titleId="ucenter_deliveryAddress_phone"/>：</dt>
													<dd>${customerAddressModel.tel}</dd>	
												</dl>
												
												<dl>
													<dt><aebiz:showTitle titleId="ucenter_deliveryAddress_zipcode"/>：</dt>
													<dd>${customerAddressModel.postCode}</dd>	
												</dl>
												<dl>
													<dt>地址别名：</dt>
													<dd>${customerAddressModel.alias}</dd>	
												</dl>
												<dl>
													<dt>配送时间：</dt>
													<dd>${customerAddressModel.deliveryTime}</dd>	
												</dl>
												
													<c:if test="${!index.last || order.state>=6}">
														<a href="javascript:void(0);"  class="btn btn-default btn-sm" data-toggle="modal">
														已完成
													</a>
													</c:if>
											</div>	
										</li>
									</c:forEach>
									
									<!-- 
									<c:if test="${wm.deliveryAddressCount<20}">
										<li class="col-sm-6">
											<div class="y_addressbox y_addressbox2" rel="popover" data-content="<aebiz:showTitle titleId="ucenter_deliveryAddress_addAddressTip1"/>${wm.deliveryAddressCount}<aebiz:showTitle titleId="ucenter_deliveryAddress_addAddressTip2"/>${20-wm.deliveryAddressCount}<aebiz:showTitle titleId="ucenter_deliveryAddress_addAddressTip3"/>" data-placement="top" data-trigger="hover">
												<a href="#address-add" data-toggle="modal" class="y_addbtn">
													<i class="fa fa-plus"></i>
													<aebiz:showTitle titleId="ucenter_deliveryAddress_add"/>
												</a>
											</div>	
										</li>
									</c:if>
									 -->
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- END BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
		<div class="push-sticky-footer"></div>
	</div>
	<!-- /wrapper -->
	
	<!--新增收货地址弹出框-->
	<div id="address-add" class="modal fade">
		
	</div>
	<!--新增收货地址弹出框 end-->
	
	<!--编辑收货地址弹出框-->
	<div id="address-edit" class="modal fade">
		
	</div>
	<!--编辑收货地址弹出框 end-->
	
	<!--删除收货地址弹出框-->
	<div id="address-delete" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3><aebiz:showTitle titleId="basebusiness.showmessage.delete"/></h3>
				</div>
				<div class="modal-body">
					<h3 class="text-warning text-center"><i class="fa fa-warning"></i><aebiz:showTitle titleId="ucenter_deliveryAddress_confirmDelete"/></h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"><aebiz:showTitle titleId="basebusiness.showmessage.cancel"/></button>
					<button type="button" class="btn btn-primary delete" data-dismiss="modal"><aebiz:showTitle titleId="basebusiness.showmessage.confirm"/></button>
				</div>
			</div>
		</div>
	</div>
	<!--删除收货地址弹出框 end-->
	
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImportJs.jsp"%>
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterBottom.jsp"%>
	
<script>
	$("a[href='#address-add']").click(function(){
		$("#editDiv").remove();
		$("#addDiv").remove();
		$.get("${pageContext.servletContext.contextPath}/usercenter/customeraddress/toAddAddress",{"customerUuid":$("#customerId").val(),"ranNum":Math.random()},function(data){
			$("#address-add").append(data);
		});
	});
	
	//设置会员默认收货地址
	function setDefault(uuid){
		var customerUuid=$("#customerId").val();
		var url="${pageContext.servletContext.contextPath}/usercenter/customeraddress/setDefault";
		$.get(url,{"uuid":uuid,"customerUuid":customerUuid,"ranNum":Math.ranNum},function(data){
			if(data=="true"){
				window.location.reload();
			}
		});
	}

	//删除会员收货地址
	$(".delete").click(function(){
		var url="${pageContext.servletContext.contextPath}/usercenter/customeraddress/delDeliveryAddress";
		$.get(url,{"uuid":$("#addressId").val(),"ranNum":Math.random},function(data){
			if(data=="true"){
				window.location.reload();
			}
		});
	});
	
	function toDelete(uuid){
		$("#addressId").val(uuid);
	}
	
	function toEdit(uuid,index){
		$.get("${pageContext.servletContext.contextPath}/usercenter/customeraddress/toEditCardAddress",{"addressUuid":uuid,"index":index,"ranNum":Math.random()},function(data){
			$("#editDiv").remove();
			$("#addDiv").remove();
			$("#address-edit").append(data);
		});
	}
</script>
	
</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>