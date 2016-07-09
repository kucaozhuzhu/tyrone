<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>                        
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>           
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<c:if test="${!empty orderMainModel }">
<p class="y_ddxx">${orderMainModel.orderTime }<span>|</span>订单编号：${orderMainModel.orderId }<span>|</span>${orderMainModel.storeName}（${orderMainModel.payTypeName}） </p>
  <table class="y_hsbyl" cellpadding="0" cellspacing="0" border="0">
  	<tr>
      <td class="y_pic" width="30%">
      <c:if test="${orderMainModel.detailList!=null && fn:length(orderMainModel.detailList)>0 }">
      <c:forEach items="${orderMainModel.detailList }" var="detail" begin="0" end="1">
      <a href="${pageContext.request.contextPath }/front/product/toProduct/${detail.productUuid}"><img src='<aebiz:showImg skuNo="${detail.specUuid}" imageSize="small"></aebiz:showImg>'></a>
      </c:forEach>
      </c:if>
      </td>
    <td class="y_hasbnam" width="45%">
    <c:if test="${orderMainModel.detailList!=null && fn:length(orderMainModel.detailList)>0 }">
      <c:forEach items="${orderMainModel.detailList }" var="detail" begin="0" end="1">
    	<a href="${pageContext.request.contextPath }/front/product/toProduct/${detail.productUuid}">${detail.productName}</a>
      </c:forEach>
     </c:if>
    </td>
    <td class="y_drice" width="25%">￥<b>${orderMainModel.payMoney }</b></td>
  </tr>
</table>
<div class="y_ddsh">
	<c:choose>
		<c:when test="${orderMainModel.state=='1' }">
		<a class="btn btn-info" href="${pageContext.request.contextPath }/orderpay/toOrderPay/${orderMainModel.uuid}/2">立即付款</a>
		</c:when>
		<c:when test="${orderMainModel.state=='6' }">
		<a class="btn btn-info" href="${pageContext.request.contextPath}/usercenter/order/toReceive/${orderMainModel.uuid}">确认收货</a>
		<!--  
		<p><i class="fa fa-circle text2-color"></i>在武汉光谷公司进行签收扫描，已被签收  签收人：小明<br/>2014-05-23 08:40:12<a href="#">查看物流明细 <span>&gt;</span></a></p>
		-->
		</c:when>
		<c:otherwise>
		<a class="btn btn-info" href="${pageContext.request.contextPath}/usercenter/productappraise/toAppraise/${orderMainModel.uuid}">评价</a>
		</c:otherwise>
	</c:choose>
</div>
</c:if> 

<c:if test="${empty orderMainModel || empty orderMainModel.uuid }">
<div class="y_memindexnothing y_hasbuy">
  	<span class="y_noicon"><i class="fa fa-suitcase"></i></span>
  	<p class="y_notitle">好久没在全网买东西了，快去逛逛吧~</p>
  </div>
 </c:if>