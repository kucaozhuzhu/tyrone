<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${!empty sfmList}">
	   <c:forEach items="${sfmList}" var="m">
   		 <div class="row w_sccon">
		     <div class="col-xs-3 col-sm-3 col-md-2">
		       <dl class="w_dpleft y_clear">
		         <dt>
		          	<div class="simple-checkbox w_xzf fl">
		          	  <input type="checkbox" id="${m.uuid}" name="check" value="${m.uuid}">
		          	  <label for="${m.uuid}">&nbsp;</label>
		        	</div>
		        	<div class="w_scpic">
		        		<a href="${pageContext.servletContext.contextPath}/dfFront/toShopPage/${m.storeUuid}/pc">
		        		    <c:if test="${!empty m.storeLogo}">
		        		        <img src="${m.storeLogo}" width="80px;" height="80px;">
		        		    </c:if>
		        		    <img src="${pageContext.servletContext.contextPath}/static/frontpage/img/shop_head.png" width="80px;" height="80px;">
		        		</a>
		        	</div>
		        	<a href="javascript:void(0);" onclick="javascript:cancelFavorite('${m.uuid}');" class="fa fa-trash-o w_scsc"></a>
		       	</dt>
		       	
		         <dd>
		           <h4><a href="${pageContext.servletContext.contextPath}/dfFront/toShopPage/${m.storeUuid}/pc">${m.storeName}</a></h4>
		           <div class="w_bq">
		           	 <a href="###" class="w_tjbq"><i class="fa fa-plus-circle"></i>添加标签</a>
		             <div class="w_popover" style="display: none;">
		               <h3 class="popover-title">添加标签 <i class="fa fa-times-circle fr"><input type="hidden" value="${m.uuid}"></i></h3>
		               <div class="popover-content">
		                 <div class="editable-input" style="position: relative;">
		                   <input type="text" value="${m.tags}" name="tags" data-role="tagsinput"/>
		                 </div>
		               </div>
		             </div>
		           </div>
		           
		           <div id="${m.uuid}">
		           		<c:if test="${!empty m.tagList}">
			           		<c:forEach items="${m.tagList}" var="tag">
			           			<span class="tag label label-info">${tag}<span data-role="remove"></span></span>
			           		</c:forEach>
		           		</c:if>
		           </div>
					
		           <p>收藏人气：${m.collectCount}</p>
		           <p>收藏时间：${m.favoriteTime}</p>
		           <!-- <a href="#" class="btn btn-primary">联系客服</a> -->
		           <a href="${pageContext.servletContext.contextPath}/dfFront/toShopPage/${m.storeUuid}/pc" class="btn btn-warning">进入店铺</a> 
		         </dd>
		       </dl>
		     </div>
		     
		     <div class="w_dpslider col-xs-9 col-sm-9 col-md-10">
		       <div class="widget">
		         <div class="widget-header">
		           <ul class="nav nav-tabs pull-left">
		             <li class="active"><a href="#tab1" data-toggle="tab">本店新品</a></li>
		           </ul>
		         </div>
		         <div class="widget-content">
		           <div class="tab-content no-padding">
		             <div class="tab-pane fade in active" id="tab1">
		               <!--滚动商品分类-->
					<div class="y_tlcordlist">
						<div class="shop_recommend owl-carousel">
						<c:if test="${!empty m.productList && m.productList.size()>0}">
						<c:forEach items="${m.productList }" var="pro" >
							<div class="item">
								<div class="y_pcbox">
									<div class="y_tlpic"><a href="${pageContext.servletContext.contextPath}/front/product/toProduct/${pro.productMain.uuid}"><img src="${pro.productImage.smallImageUrl}" width="138px" higth="138px"/></a><a class="y_picbtn" href="${pageContext.servletContext.contextPath}/front/product/toProduct/${pro.productMain.uuid}">立即查看 <i class="fa fa-angle-right"></i></a></div>
									<span>￥<b>${pro.productPrice.shopPrice }</b></span><s>￥${pro.productPrice.marketPrice }</s>
									<p class="y_tlname"><a href="${pageContext.servletContext.contextPath}/front/product/toProduct/${pro.productMain.uuid}">${pro.productMain.productName}</a></p>
								</div>
							</div>
							</c:forEach>
							</c:if>
						</div>
					</div><!--滚动商品分类 end-->
		             </div>
		           </div>
		         </div>
		       </div>
		     </div>
		 </div>
	   </c:forEach>
	</c:when>
	
	<c:otherwise>
	    <div class="y_hasnopd">
	       <span class="y_carticon"><i class="fa fa-home"></i></span>
		   <span class="y_cartnoms">收藏夹内暂时没有店铺，快去将自己喜欢的店铺加入收藏夹吧~</span>
	    </div>
	</c:otherwise>
</c:choose>

<!-- 分页 -->
<c:if test="${!empty sfmList}">
	<aebiz:storeFavoratePage listPath="${pageContext.request.contextPath }/usercenter/storefavorite/toStoreFavorite"/>
</c:if>

<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/bootstrap-tagsinput.js"></script><!--添加标签 插件-->
<script>
$(function(){
	$("#listFavorite").delegate(".fa-times-circle","click",function(){
		var uuid = $(this).find("input:hidden").val();
		//替换tags中所有的特殊字符
		var tags= $(this).parents(".w_popover").find("input[name='tags']").val().replace(new RegExp("<|>", 'g'),"");
		var url = "${pageContext.servletContext.contextPath}/usercenter/storefavorite/addTags";
		$.post(url,{"uuid":uuid,"tags":tags,ranNum:Math.random()},function(data){
			$("#listFavorite").find("div[id='"+uuid+"']").empty();
			if($.trim(tags)!=""){
				var tagArr = tags.split(",");
				var str = ""
				for(var i = 0 ; i< tagArr.length ; i++){
					str += "<span class='tag label label-info'>"
					str += tagArr[i];
					str += "<span data-role='remove'></span></span> ";
				}
				$("#listFavorite").find("div[id='"+uuid+"']").append(str);
			}
		});
	});
});

/*编辑便签JS*/
$(".w_tjbq").click(function(){
	$(this).next("div").slideDown(100)
	
});
$(".w_popover i").click(function(){
	$(".w_popover").slideUp(100)
});

$('.shop_recommend.owl-carousel').owlCarousel({
    items: 5,
    itemsDesktop : [1409,4],
    itemsDesktopSmall: [1209,3],
    itemsTablet: [1023,4],
    navigationText : false,
    scrollPerPage: true,
    slideSpeed: 800,
    pagination: false,
    navigation: true
});
</script>
