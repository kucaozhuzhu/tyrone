<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
	<c:if test="${empty mainModel}">
		<div class="y_orderdtep w_setpbor y_orderdtep1">
	</c:if>		
	<c:if test="${!empty mainModel}">
		<c:choose>
			<c:when test="${mainModel.state=='4' || mainModel.state=='10'}">
				<div class="y_orderdtep w_setpbor y_orderdtep4">		
			</c:when>			
			<c:when test="${mainModel.state=='2' || mainModel.state=='5'}">
				<div class="y_orderdtep w_setpbor y_orderdtep3">		
			</c:when>			
			<c:otherwise>
				<div class="y_orderdtep w_setpbor y_orderdtep2">			
			</c:otherwise>			
		</c:choose>	
	</c:if>	
	<ol class="y_orstepms">
		<li class="y_stms1">
			<div><i class="fa fa-circle"></i><span>1</span></div>
			<p>买家申请退款</p>
		</li>
		<li class="y_stms2">
			<div><i class="fa fa-circle"></i><span>2</span></div>
			<p>等待卖家处理</p>
			<s></s>
		</li>
		<li class="y_stms3">
			<div><i class="fa fa-circle"></i><span>3</span></div>
			<c:choose>
				<c:when test="${!empty mainModel && mainModel.state=='5'}">
					<p>卖家不同意买家申请</p>	
				</c:when>				
				<c:otherwise>
					<p>退款协议达成，等待退款</p>
				</c:otherwise>
			</c:choose>
			<s></s>
		</li>		
		<li class="y_stms4">
			<div><i class="fa fa-circle"></i><span>4</span></div>
			<c:choose>
				<c:when test="${!empty mainModel && mainModel.state=='10'}">
					<p>售后关闭</p>
				</c:when>				
				<c:otherwise>
					<p>售后成功</p>
				</c:otherwise>
			</c:choose>
			<s></s>
		</li>
	</ol>
</div>