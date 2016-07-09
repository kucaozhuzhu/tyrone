<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.aebiz.b2b2c.baseframework.servicelocator.ServiceLocator" %>
<%@page import="java.util.*" %>
<%@page import="com.aebiz.b2b2c.product.interactive.productcategoryfront.service.impl.ProductCategoryFrontInteractiveServiceImpl" %>
<%@page import="com.aebiz.b2b2c.product.interactive.productcategoryfront.service.ProductCategoryFrontInteractiveService" %>
<%@page import="com.aebiz.b2b2c.product.productcategoryfront.vo.ProductCategoryFrontModel" %>
<%@page import="com.aebiz.b2b2c.product.interactive.productcategoryfront.vo.ProductCategoryFrontInteractiveModel" %>

<%
	ProductCategoryFrontInteractiveServiceImpl productCategoryFrontInteractiveService = (ProductCategoryFrontInteractiveServiceImpl)ServiceLocator.getInstance().getCtx().getBean("productCategoryFrontInteractiveServiceImpl");
	List<String> uuidList = productCategoryFrontInteractiveService.getProductCategoryUuids("systemUUid",null) ;
	List<ProductCategoryFrontInteractiveModel> cateList = new ArrayList<ProductCategoryFrontInteractiveModel>();
	ProductCategoryFrontInteractiveModel category ;
	if(uuidList!=null && uuidList.size()>0){
		for(int i=0;i<uuidList.size();i++){
			category=productCategoryFrontInteractiveService.getByCategoryUuidState(uuidList.get(i),"1");
			cateList.add(category);
		}
	}
%>
<div class="m_logo_main">
	<div class="container main_serch clearfix">
		<div class="fl">
		  <h1><a href="${pageContext.request.contextPath }/" title="<aebiz:platConfig codeName='platName'/>"><img src="<aebiz:platConfig codeName='platLogoPath'/>"></a></h1>
		</div>
		<div class="fr">
			<div class="clearfix">
				<input type="text" id="keyword" class="form-control" value="${params['param_programword']}" placeholder='请输入搜索关键字' onkeydown="javascript:if(event.keyCode==13) return search();">
				<a class="btn" href="javascript:search();"></a>
			</div>
		</div>
	</div>
</div>
<script>
	
	var jsContextPath=getContextPath() ;
	function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    if(result == "/sysback"){
    	return "";
    }
    return result;
}
	
function search(){
	var keyword =   $.trim($('#keyword').val());
	if(keyword==""){
		alert("请输入要搜索的关键字");
		$('#keyword').focus();
		return;
	}
	window.location.href="${pageContext.servletContext.contextPath}/front/productList/toProductList?keyword="+encodeURI(encodeURI(keyword));
}

</script>
<div class="m_nav">
	<div class="container" id="catagorytop">
			<div class="m_meun y_produall">
				<h2>全部商品</h2>
				<div class="m_meun_box">
				    <ul class="m_meun_ul">
				    <c:forEach items="<%=cateList%>" var="cateBrands" varStatus="n">
					<c:if test="${n.index<11}">
				         <li>
				         	<a href="<c:choose><c:when test="${!empty cateBrands.categoryUrl}">${cateBrands.categoryUrl}</c:when><c:otherwise>${pageContext.servletContext.contextPath}/front/productList/toProductList?categoryUuid=${cateBrands.uuid}</c:otherwise></c:choose>"><span>${cateBrands.categoryName}</span><i>&gt</i></a>
				         	<div class="w_nav_inner">
				         		<div class="fl">
				         		<dl>
				         		<dd>
				         		<c:forEach items="${cateBrands.subProductCategoryFront}" var="subCategory">
				         			<a href="<c:choose><c:when test="${!empty subCategory.categoryUrl}">${subCategory.categoryUrl}</c:when><c:otherwise>${pageContext.servletContext.contextPath}/front/productList/toProductList?categoryUuid=${subCategory.uuid}</c:otherwise></c:choose>">${subCategory.categoryName}</a>
					         	</c:forEach>
					         	</dd>
					         	</dl>
				         		</div>
				         	</div>
				         </li>
				         </c:if>
						</c:forEach>
				    </ul>
				</div>
				<!--商品分类效果js代码-->
				<script type="text/javascript">
					$(".m_meun_ul li").hover(function(){
						$(this).find(".w_nav_inner").fadeIn(300);	
					},function(){
						$(this).find(".w_nav_inner").fadeOut(100);	
					})		
				</script>
			</div>
		
			<%@ include file="/WEB-INF/jsp/userfront/common/platNavigation.jsp" %>
	</div>
</div>