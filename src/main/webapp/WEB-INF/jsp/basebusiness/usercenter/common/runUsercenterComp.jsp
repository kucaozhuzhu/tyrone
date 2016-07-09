<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.aebiz.b2b2c.baseframework.servicelocator.ServiceLocator" %>
<%@page import="java.util.*" %>
<%@page import="com.aebiz.b2b2c.product.interactive.productcategoryfront.service.impl.ProductCategoryFrontInteractiveServiceImpl" %>
<%@page import="com.aebiz.b2b2c.product.interactive.productcategoryfront.service.ProductCategoryFrontInteractiveService" %>
<%@page import="com.aebiz.b2b2c.product.interactive.productcategoryfront.vo.ProductCategoryFrontInteractiveModel" %>
<%@page import="com.aebiz.b2b2c.product.interactive.productbrand.service.impl.ProductBrandInteractiveImpl" %>
<%@page import="com.aebiz.b2b2c.product.interactive.productbrand.service.ProductBrandInteractive" %>
<%@page import="com.aebiz.b2b2c.product.productbrand.vo.ProductBrandModel" %>
<%@page import="com.aebiz.b2b2c.baseframework.utils.StringUtil" %>
<%@page import="com.aebiz.b2b2c.userfront.platadimagerel.service.impl.PlatAdImageRelInteractiveImpl" %>
<%@page import="com.aebiz.b2b2c.userfront.platadimagerel.vo.PlatAdImageRelModel" %>

<%
	ProductBrandInteractiveImpl productBrandService = (ProductBrandInteractiveImpl)ServiceLocator.getInstance().getCtx().getBean("productBrandInteractiveImpl");
	ProductCategoryFrontInteractiveServiceImpl productCategoryFrontInteractiveService = (ProductCategoryFrontInteractiveServiceImpl)ServiceLocator.getInstance().getCtx().getBean("productCategoryFrontInteractiveServiceImpl");
	Map<String, String> params = (Map<String, String>)request.getAttribute("params");
	Map<ProductCategoryFrontInteractiveModel,List<ProductBrandModel>> cateBrands=new HashMap<ProductCategoryFrontInteractiveModel,List<ProductBrandModel>>();
	
	String categoryUuidsString=params.get("param_categoryuuids");
	
	if(!StringUtil.isEmpty(categoryUuidsString)){
		String[] categoryUuids=categoryUuidsString.split(",");
		for(int i=0;i<categoryUuids.length;i++){
			ProductCategoryFrontInteractiveModel category=new ProductCategoryFrontInteractiveModel();
			List<ProductBrandModel> brands=new ArrayList<ProductBrandModel>();
			String categoryUuid=categoryUuids[i];
			
			category=productCategoryFrontInteractiveService.getByCategoryUuidState(categoryUuid,"1");
		
			String brandUuidsString=params.get("param_"+categoryUuid+"");
			
			if(!StringUtil.isEmpty(brandUuidsString)){
				String[] brandUuids=brandUuidsString.split(",");
				List<String> bUuids=new ArrayList<String>();
				for(int j=0;j<brandUuids.length;j++){
					bUuids.add(brandUuids[j]);
				}
				
				brands=productBrandService.getProductBrandsByUuids(bUuids);
			
			}
			cateBrands.put(category,brands);
		}
	}
	int num=cateBrands.size();
	
	PlatAdImageRelInteractiveImpl platAdImageRelInteractive = (PlatAdImageRelInteractiveImpl)ServiceLocator.getInstance().getCtx().getBean("platAdImageRelInteractiveImpl");
	String adUuid = params.get("param_aduuid");
	List<PlatAdImageRelModel> adImageList = platAdImageRelInteractive.getPlatAdImageRelModelsByAdUuid(adUuid);
	PlatAdImageRelModel adImage = null;
	if(adImageList != null && adImageList.size()>0){
		adImage = adImageList.get(0);
	}
	if(adImage == null){
		adImage = new PlatAdImageRelModel();
	}
	
	
	
%>







<div class="m_nav">
	<div class="container" id="catagorytop">
		
		<c:set var="imagePath" value="<%=adImage.getImageUrl()%>"></c:set>
		<c:set var="url" value="<%=adImage.getUrl()%>"></c:set>
			<div class="m_meun y_inproduall">
				<h2>全部商品</h2>
				<div class="m_meun_box">
				<c:set var="number" value="<%=num%>"></c:set>
				    <ul class="m_meun_ul">
				    <c:forEach items="<%=cateBrands%>" var="cateBrands" varStatus="n">
					<c:if test="${n.index<7}">
				         <li>
				         	<a href="<c:choose><c:when test="${!empty cateBrands.key.categoryUrl}">${cateBrands.key.categoryUrl}</c:when><c:otherwise>${pageContext.servletContext.contextPath}/front/productList/toProductList?categoryUuid=${cateBrands.key.uuid}</c:otherwise></c:choose>"><span>${cateBrands.key.categoryName}</span><i>&gt</i></a>
				         	<div class="w_nav_inner">
				         		<div class="fl">
				         		<c:forEach items="${cateBrands.key.subProductCategoryFront}" var="subCategory">
				         			<dl>
				         		       <dt><a href="<c:choose><c:when test="${!empty subCategory.categoryUrl}">${subCategory.categoryUrl}</c:when><c:otherwise>${pageContext.servletContext.contextPath}/front/productList/toProductList?categoryUuid=${subCategory.uuid}</c:otherwise></c:choose>">${subCategory.categoryName}</a></dt>
				         		       <dd>
				         		       <c:forEach items="${subCategory.subProductCategoryFront}" var="sub2Category">
											<a href="<c:choose><c:when test="${!empty sub2Category.categoryUrl}">${sub2Category.categoryUrl}</c:when><c:otherwise>${pageContext.servletContext.contextPath}/front/productList/toProductList?categoryUuid=${sub2Category.uuid}</c:otherwise></c:choose>">${sub2Category.categoryName}</a>
										</c:forEach>
				         		       </dd>
					         		 </dl>
					         	</c:forEach>
				         		</div>
				         		<div class="nav_inner_img">
				         			<c:forEach items="${cateBrands.value}" var="brand">
									<span><a href="javascript:void(0);"><img src="${brand.imgUrl2}"></a></span>
									</c:forEach>
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
		
			<%@ include file="/WEB-INF/jsp/usercenter/common/platNavigation.jsp" %>
	</div>
</div>

