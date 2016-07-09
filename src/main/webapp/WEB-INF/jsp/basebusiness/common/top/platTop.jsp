<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div id="simpleTop">
	</div>
	<script>
		$("#simpleTop").load("${pageContext.servletContext.contextPath}/getSimpleTop?ranNum=" + Math.random());
	</script>

<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/decorate/platform_components/css/inFlorRtAd/y_florad.css">

<script>
var jsContextPath = "${pageContext.servletContext.contextPath}";
	$(function(){
		//loadTopCart();
		//头部购物车移上时显示购物车信息
		$('.w_cart').hover(function(){
			$(this).addClass('open');
		//	loadTopCart();
		},function(){
			$(this).removeClass('open');
		})
		
		$(".w_cart").on("click", "[id^='topremove_']", function(){	
			var operId = $(this).attr("id") ;							
			//调用异步更新数量，计算价格		
			ajaxTopRemove(operId) ;
		})
		
		$(".w_cart").on("click", "[id^='goBlanceTop']", function(){
			var loginUrl = "${pageContext.servletContext.contextPath}/cart/isLogin"	
			$.get(loginUrl,{ranNum:Math.random()} ,function(data){
				if("0"==data) {
					//弹出登录框
					$("#modal-login-form").modal();
				}else{
					$("#cartFormTop").submit() ;
				}
			})	
		})	;
		

		                   $("#keyword").autocomplete({

		                        source: function (request, response) {
			                    $.ajax({
			                        url: "${pageContext.request.contextPath }/front/productList/getKeyWords",
			                        dataType: "json",
			                        data: {
			          							  key: request.term,
			          							  random:Math.random()
			          							},
			                        success: function (data) {
			                             response($.map(data.keyWords, function(item){
			                            	 return {
			                            		 lable:"uuid",
			                            		 value:item,
			                                 }
										}));
			                        }
			                        
			                    });
			                },
			                select: function(event, ui) {
			                    var keyword = ui.item.value;
			                    window.location.href="${pageContext.servletContext.contextPath}/front/productList/toProductList?keyword="+keyword;
			                },

		                   });
	});
	
/*	//加载头部购物车
	function loadTopCart(){
		var url = jsContextPath+"/cart/ajaxtopcartshow" ;
		$.post(url,function(data){
			$("#topCartShow").html(data);
			
			//var totalMount = $("#totalMount").val();
			//$("#showTotalMount").html(totalMount);	
		});			
	}
	
	//删除购物车中的商品
	function ajaxTopRemove(operId) {		
		var changeNumUrl = jsContextPath+"/cart/ajaxtopremove" ;			
		$.post(changeNumUrl,{productIdAndAttrId:operId,ranNum:Math.random()} ,function(data){
				$("#topCartShow").html(data);	
				//var totalMount = $("#totalMount").val();
				//$("#showTotalMount").html(totalMount);		
		})
	}
*/


function search(){
	var keyword =  $('#keyword').val();
	if(keyword==""){
		$('#keyword').focus();
		return;
	}
	window.location.href="${pageContext.servletContext.contextPath}/front/productList/toProductList?keyword="+encodeURI(encodeURI(keyword));
}

</script>
 <!--头部-->
 <%@ include file="/WEB-INF/jsp/userfront/common/platTop.jsp" %>
 
 <div class="container">
  <%@ include file="/WEB-INF/jsp/channel/categoryTree.jsp" %>
 </div>

</body>
</html>