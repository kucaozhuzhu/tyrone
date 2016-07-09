<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

	<ul class="row">
		<c:forEach items="${wm.rows}" var="customerAddressModel" varStatus="index">
			<li class="col-sm-6">
				<div class="y_addressbox">
					<div class="y_addtit y_clear mb_20">
						<a href="#address-delete" onclick="javascript:toDelete('${customerAddressModel.uuid}')" class="btn btn-default btn-sm" data-toggle="modal">
							<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>
						</a>
						<a href="#address-edit" onclick="javascript:toEdit('${customerAddressModel.uuid}')" class="btn btn-default btn-sm" data-toggle="modal">
							<aebiz:showTitle titleId="basebusiness.showmessage.edit"/>
						</a>
						<h4>${customerAddressModel.alias}</h4>
					</div>
					
					<dl>
						<dt><aebiz:showTitle titleId="ucenter_deliveryAddress_consignee"/>：</dt>
						<dd>${customerAddressModel.consignee}</dd>	
					</dl>
					
					<dl>
						<dt><aebiz:showTitle titleId="ucenter_deliveryAddress_area"/>：</dt>
						<dd>${customerAddressModel.area}</dd>	
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
						<dd>${customerAddressModel.telephone}</dd>	
					</dl>
					
					<dl>
						<dt><aebiz:showTitle titleId="ucenter_deliveryAddress_zipcode"/>：</dt>
						<dd>${customerAddressModel.zipcode}</dd>	
					</dl>
					
					<dl>
						<dt>身份证号：</dt>
						<dd>${customerAddressModel.identityCardFormat}</dd>	
					</dl>
					
					<c:choose>
						<c:when test="${customerAddressModel.isDefault=='1'}">
							<div class="y_aredefaut back2-color"><aebiz:showTitle titleId="ucenter_deliveryAddress_defaultAddress"/></div>
						</c:when>
						
						<c:otherwise>
							<button type="button" onclick="javascript:setDefault('${customerAddressModel.uuid}')" class="btn btn-primary btn-sm y_aredesetfaut">
							<aebiz:showTitle titleId="ucenter_deliveryAddress_setDefault"/></button>
						</c:otherwise>
					</c:choose>
				</div>	
			</li>
		</c:forEach>
	</ul>

	<c:if test="${!empty wm.rows}">
		<aebiz:productFavoratePage listPath="${pageContext.request.contextPath }/usercenter/productfavorite/toProductFavorite"/>
	</c:if>