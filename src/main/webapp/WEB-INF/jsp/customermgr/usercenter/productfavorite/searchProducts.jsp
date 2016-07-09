<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%--
<table width="100%" cellpadding="0" cellspacing="0">
<tbody>
--%>


			<%--
			<tr>
			    <td width="2%">
			    	<div class="simple-checkbox">
			        	<input type="checkbox" id="${m.uuid}" name="check" value="${m.uuid}"><label for="${m.uuid}">&nbsp;</label>
			      	</div>
			    </td>
			    
			    <td width="8%"><a href="${pageContext.servletContext.contextPath}/front/product/toProduct/${m.productUuid}"><img src="${m.pim.productImage.smallImageUrl}" width="100px" higth="100px"/></a></td>
			    
			    <td width="40%"><h4><a href="${pageContext.servletContext.contextPath}/front/product/toProduct/${m.productUuid}">${m.productName}</a></h4>
			      <div class="w_bq">
			        <a href="###" class="w_tjbq"><i class="fa fa-plus-circle"></i> 添加标签</a>
			        <div class="w_popover" style="display: none;">
			          <h3 class="popover-title">添加标签 <i class="fa fa-times-circle fr"><input type="hidden" value="${m.uuid}"></i></i></h3>
			          <div class="popover-content">
			            <div class="editable-input" style="position: relative;">
			              <input type="text" value="${m.tags}" name="tags" data-role="tagsinput" />
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
			      
			      <a href="${pageContext.servletContext.contextPath}/dfFront/toShopPage/${m.pim.productMain.storeUuid}" class="w_tjbq">${m.pim.productMain.storeName}</a>
			      <p>收藏时间：${m.favoriteTime}</p>
			    </td>
			    
			    <td width="20%" align="center"><b class="w_spb">&yen;${m.pim.productPrice.shopPrice}</b><br/>
			    	<c:choose>
			    		<c:when test="${m.pim.productPrice.shopPrice >= m.favoritePrice}">
			    			<span class="w_xjsp">比收藏时上升<b class="text2-color">${m.pim.productPrice.shopPrice-m.favoritePrice}</b>元</span>
			    		</c:when>
			    		<c:otherwise>
			    			<span class="w_xjsp">比收藏时下降<b class="text2-color">${m.favoritePrice-m.pim.productPrice.shopPrice}</b>元</span>
			    		</c:otherwise>
			    	</c:choose>
			    </td>
			    
			    <td width="20%" align="center" class="w_cz">
			    	<span class="y_produclass">
			    		<a class="btn btn-primary" data-toggle="dropdown"><i class="fa fa-shopping-cart"></i>加入购物车</a>
			    		<div class="dropdown-menu">
			    			<input type="hidden" name="specUuid0_${m.productUuid}" id="specUuid0_${m.productUuid}" value="">
			    			<input type="hidden" name="specUuid1_${m.productUuid}" id="specUuid1_${m.productUuid}" value="">
			    			<input type="hidden" name="skuNo_${m.productUuid}" id="skuNo_${m.productUuid}" value="${m.skuNo}">
				    		<c:forEach items="${m.productAttributes}" var="attribute" varStatus="num">
					    		<dl>
				    				<dt>选择${attribute.attributeName}：</dt>
				    				<dd>
					    				<c:forEach items="${attribute.values}" var="data" varStatus="num1">
											<span class="<c:if test="${fn:contains(m.initSelectSpecUuids, data.valueUuid)}">active</c:if>" >
											<a onclick="javascript:selectSpec('${data.valueUuid}','${num.index}','${m.productUuid}');" >${data.value}</a>
											</span>
										</c:forEach>
				    				</dd>	
				    			</dl>
				    		</c:forEach>
			    			<dl>
			    				<dt>我要买：</dt>
			    				<dd class="y_buysize">
			    					<input type="text" id="number_${m.productUuid}" class="form-control" value="1">件（库存<c:choose><c:when test="${!empty m.pim.productMain.stock}">${m.pim.productMain.stock}</c:when><c:otherwise>0</c:otherwise></c:choose>件）
			    				</dd>	
			    			</dl>	
			    			<dl>
			    				<dt>&nbsp;</dt>
			    				<dd class="y_buysize">
			    					<input type="hidden" id="productStock_${m.productUuid}" value="${m.pim.productMain.stock}">
			    					<button type="button" class="btn btn-primary" onclick="addProduct('${m.productUuid}')">加入购物车</button>
			    				</dd>	
			    			</dl>	
			    		</div>
			    	</span>
			    	<a class="w_spqxsc" onclick="javascript:cancelFavorite('${m.uuid}');"><i class="fa fa-trash-o"></i>取消收藏</a>
		  		</td>
			</tr>
			--%>
			
			
<ul class="ku_list">
	<c:choose>
	<c:when test="${!empty pfmList}">	
		<c:forEach items="${pfmList}" var="m">
 	 <li>
 	 	<div class="pic"><a href="${pageContext.servletContext.contextPath}/front/product/toProduct/${m.productUuid}"><img src="${m.pim.productImage.smallImageUrl}" width="100px" higth="100px"/></a></div>
 	 	<div class="tit">
 	 		<a href="${pageContext.servletContext.contextPath}/front/product/toProduct/${m.productUuid}">${m.productName}</a>
 	 	</div>
 	 	<p>￥${m.pim.productPrice.shopPrice}</p>
 	 	<a class="ku_cancel" onclick="javascript:cancelFavorite('${m.uuid}');"><i class="fa fa-star"></i><span>取消收藏</span></a>
 	 	<a class="btn w_spqxsc" onclick="addProduct('${m.productUuid}')"><i></i>加入购物车</a>
 	 </li>
		</c:forEach>
		</c:when>
		<c:otherwise>
	   <li class="ku_listhasnopd">
			<div id="noContentDiv" class="y_hasnopd">
	         	<span class="y_carticon"><i class="fa fa-star"></i></span>
				<span class="y_cartnoms">
					收藏夹内暂时没有商品，快去将自己喜欢的商品加入收藏夹吧~
				</span>
	     </div>
	    </li>
		</c:otherwise>
	</c:choose>
</ul>

<%--
</tbody>
</table>
--%>
<!-- 分页 -->
<c:if test="${!empty pfmList}">
	<aebiz:productFavoratePage listPath="${pageContext.request.contextPath }/usercenter/productfavorite/toProductFavorite"/>
</c:if>

<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/bootstrap-tagsinput.js"></script><!--添加标签 插件-->
<script>
$(function(){
	$("#listFavorite").delegate(".fa-times-circle","click",function(){
		var uuid = $(this).find("input:hidden").val();
		//替换tags中所有的特殊字符
		var tags= $(this).parents(".w_popover").find("input[name='tags']").val().replace(new RegExp("<|>", 'g'),"");
		var url = "${pageContext.servletContext.contextPath}/usercenter/productfavorite/addTags";
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

$(".y_produclass .dropdown-menu").click(function(event){
	event.stopPropagation();	
});
$(".y_produclass .dropdown-menu dd span").click(function(){
	$(this).addClass("active").siblings().removeClass("active");	
});

function selectSpec(valueUuid,index,productUuid){
	$("#specUuid"+index+"_"+productUuid).val(valueUuid);
	
	var selectUuid="";
	var count=2;
	for(var i=0;i<count;i++){
		if(""==$("#specUuid"+i+"_"+productUuid).val()){
			return;
		}
		selectUuid+=$("#specUuid"+i+"_"+productUuid).val()+"-";
	}
	$.getJSON("${pageContext.servletContext.contextPath}/usercenter/productfavorite/selectSpec/"+productUuid,
	{"initSelectSpecUuids" : selectUuid},
	function(data) {
		 $("#skuNo_"+productUuid).val(data.skuNo);

	});
	
}

//加入购物车
function addProduct(productUuid){
	var url="${pageContext.servletContext.contextPath}/cart/addtocart";
	$.getJSON(url,
		{"productUuid" : productUuid,"buyNum":1,"time":Math.random()},
		function(data) {
			 bootbox.alert("加入成功！");
	});
}

//收藏商品列表js
$(function(){
	$(".w_scsplb li:nth-child(4n)").css("margin-right","0px");
	$(".ku_list li").hover(function(){
		$(this).addClass("active").siblings("li").removeClass("active");
		$(this).find(".ku_cancel").show().parents("li").siblings().find(".ku_cancel").hide();
  },function(){
  	 	$(this).removeClass("active");
		$(this).find(".ku_cancel").hide();
  })
})
</script>
