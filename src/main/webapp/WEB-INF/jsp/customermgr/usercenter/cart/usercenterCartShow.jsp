<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>                        
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>           
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<c:if test="${!empty carts && !empty carts.shoppingCart}">
 <ul class="y_bglt">
 	<c:forEach items="${cartStore}" var="cartStore" >
 	<c:if test="${!empty cartStore && !empty carts.shoppingCart[cartStore]}" >
 	<c:forEach items="${carts.shoppingCart[cartStore]}" var="shoppingProduct" >
  	<li>
  		<div class="y_mictpic"><a href="${pageContext.servletContext.contextPath}/front/product/toProduct/${shoppingProduct.productId}"><img src="${shoppingProduct.productImgUrl}"></a></div>
  		<span class="y_gwprc">￥<b>${shoppingProduct.basePrice}</b></span>
  		<span class="y_gwbtn"><a class="back2-color gritter-regular" id="addToFav_${shoppingProduct.productId}" href="javascript:addToFav('addToFav_${shoppingProduct.productId}');" title="加入收藏" data-toggle="tooltip"><i class="fa fa-star"></i></a><a class="back2-color y_delemod" href="javascript:ajaxRemove('remove_${shoppingProduct.productId}_${shoppingProduct.attrIds}');" title="删除" data-toggle="tooltip"><i class="fa fa-trash-o"></i></a></span>
  		<div class="y_mictnam"><p><a href="${pageContext.servletContext.contextPath}/front/product/toProduct/${shoppingProduct.productId}">${shoppingProduct.productName }</a></p>
  		
  		<c:forEach items="${shoppingProduct.attrValues}" var="attrValue" varStatus="status" >	
			<span>${attrValue.value}</span>
		</c:forEach>
  		<span>数量：${shoppingProduct.buyNum}</span>
  		</div>
  	</li>
  	</c:forEach>
  	</c:if>
  	</c:forEach>
  </ul>
  <p class="y_gwjs"><a class="btn btn-danger" href="${pageContext.servletContext.contextPath}/cart/cartshow">去购物车结算</a></p>
</c:if>  

<c:if test="${empty carts || empty carts.shoppingCart}">
<div class="y_memindexnothing y_nocart">
 	<span class="y_noicon"><i class="fa fa-shopping-cart"></i></span>
 	<p class="y_notitle">您的购物车里啥都没有，去逛逛吧~</p>
 </div>
</c:if>