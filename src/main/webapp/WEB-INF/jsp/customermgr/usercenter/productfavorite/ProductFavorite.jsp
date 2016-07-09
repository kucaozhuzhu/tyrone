<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->
	
	<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>		
	<title>商品收藏</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="description" content="KingAdmin - Bootstrap Admin Dashboard Theme">
	<meta name="author" content="The Develovers">
	
</head>

<body>
	<!-- WRAPPER 头部、左侧、右侧大框架 -->
	<div class="wrapper">
		<!-- TOP BAR 头部导航 -->
		<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterHead.jsp"%>
		<!-- /top -->
		<div class="container">
			<div class="ku_crumbs">
				<a href="${pageContext.servletContext.contextPath}/customer/toIndex">首页</a><b>&gt</b><span>商品收藏</span>
			</div>
		</div>
		<!-- BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT 左侧导航和右侧主体 -->
		<div class="bottom">
			<div class="container">
				<div class="row">
					<!-- left sidebar 左侧导航 -->
					<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterLeft.jsp"%>

					<!-- content-wrapper 右侧主体 -->
					<div class="col-xs-10 content-wrapper">
						<%--
						<div class="row">
							<div class="col-sm-4 ">
								<ul class="breadcrumb">
									<li>
										<i class="fa fa-home"></i>
										<a href="${pageContext.servletContext.contextPath}/customer/toIndex"><aebiz:showTitle titleId="ucenter_indexPage_membercenter"/></a>
									</li>
									<li class="active">商品收藏</li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
						</div>
						--%>
						<div class="content ku_orderlist">
						  <div class="main-header">
						  	<h2>商品收藏</h2>
						  </div>
						  <%--
						  <ul class="nav nav-tabs bornone">
						    <li class="active"><a href="${pageContext.servletContext.contextPath}/usercenter/productfavorite/toPage"><i class="fa fa-folder"></i>商品收藏</a></li>
						    <li class=""><a href="${pageContext.servletContext.contextPath}/usercenter/storefavorite/toPage"><i class="fa fa-folder-o"></i>店铺收藏</a></li>
						  </ul>
						  --%>
						  <!-- 收藏商品 -->
						  <div class="main-content">
						  	<!--收藏商品分类-->
						  	
						    <div class="w_scsp" style=" display: none;">
						    	<%--
						      <div class="w_sx">
						        <dl>
						          <dt>标签筛选：</dt>
						          <dd> 
							          <a href="javascript:void(0);"><input type="hidden" value="all">全部标签</a>
							          <a href="javascript:void(0);"><input type="hidden" value="empty">无标签</a>
							          <c:forEach items="${tagList}" var="tag">
							               <a href="javascript:void(0);"><input type="hidden" value="one">${tag}</a>
							          </c:forEach> 	 	
						          </dd>
						        </dl>
						      </div>
						      --%>
						      <!-- 
						      <div class="w_xz col-mi-6 col-md-4"> <span class="w_xzf">仅显示：</span>
						        <div class="simple-checkbox w_xzf">
						          <input type="checkbox" id="checkbox1">
						          <label for="checkbox1">降价商品</label>
						        </div>
						        <div class="simple-checkbox w_xzf">
						          <input type="checkbox" id="checkbox2">
						          <label for="checkbox2">促销商品</label>
						        </div>
						        <div class="simple-checkbox w_xzf">
						          <input type="checkbox" id="checkbox3">
						          <label for="checkbox3">现货商品</label>
						        </div>
						      </div>
						       -->
						      
						      <div class="col-mi-5 col-md-5 fr">
						        <div class="input-group input-group-sm">
						          <input type="text" placeholder="商品搜索" id="productName" class="form-control">
						          
						          <span class="input-group-btn">
						          	<button class="btn btn-primary" type="button" id="search"><i class="fa fa-search"></i>搜索</button>
						          </span> 
						          
						        </div>
						      </div>
						    </div>
						    
						    <!--收藏商品列表-->
						    <%--
					          <div class="w_dx mt20">
					            <div class="simple-checkbox">
					              <input type="checkbox" id="check_all">
					              <label for="check_all">全选</label>
					            </div>
					            <a onclick="javascript:cancelFavorite('');" class="w_qbqxsc">取消收藏</a>
					          </div>
						      --%>
						       <input type="hidden" name="nowPage" id="nowPage" value="1"/>
							   <input type="hidden" name="pageShow" id="pageShow" value="5"/>
						      
				      	<!--收藏商品列表内容-->
			            <div id="listFavorite" class="w_scsplb y_clear">
			               
			            </div>
					        
					          
					            <!--根据浏览猜你喜欢
								<div class="y_tlcordlist mt_10">
									<h4>根据浏览猜你喜欢</h4>
									<div class="recommend_product owl-carousel">
										<div class="item">
											<div class="y_pcbox">
												<div class="y_tlpic"><a href="#"><img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/y_tlpic.jpg"></a><a class="y_picbtn" href="#">立即查看 <i class="fa fa-angle-right"></i></a></div>
												<span>￥<b>89.00</b></span><s>￥599.00</s>
												<p class="y_tlname"><a href="#">美的全不锈钢电热水壶</a></p>
											</div>
										</div>
										<div class="item">
											<div class="y_pcbox">
												<div class="y_tlpic"><a href="#"><img src="img/aebiz/y_tlpic.jpg"></a><a class="y_picbtn" href="#">立即查看 <i class="fa fa-angle-right"></i></a></div>
												<span>￥<b>89.00</b></span><s>￥599.00</s>
												<p class="y_tlname"><a href="#">美的全不锈钢电热水壶热水壶热水壶热水壶</a></p>
											</div>
										</div>	
										<div class="item">
											<div class="y_pcbox">
												<div class="y_tlpic"><a href="#"><img src="img/aebiz/y_tlpic.jpg"></a><a class="y_picbtn" href="#">立即查看 <i class="fa fa-angle-right"></i></a></div>
												<span>￥<b>89.00</b></span><s>￥599.00</s>
												<p class="y_tlname"><a href="#">美的全不锈钢电热水壶</a></p>
											</div>
										</div>	
										<div class="item">
											<div class="y_pcbox">
												<div class="y_tlpic"><a href="#"><img src="img/aebiz/y_tlpic.jpg"></a><a class="y_picbtn" href="#">立即查看 <i class="fa fa-angle-right"></i></a></div>
												<span>￥<b>89.00</b></span><s>￥599.00</s>
												<p class="y_tlname"><a href="#">美的全不锈钢电热水壶热水壶</a></p>
											</div>
										</div>	
										<div class="item">
											<div class="y_pcbox">
												<div class="y_tlpic"><a href="#"><img src="img/aebiz/y_tlpic.jpg"></a><a class="y_picbtn" href="#">立即查看 <i class="fa fa-angle-right"></i></a></div>
												<span>￥<b>89.00</b></span><s>￥599.00</s>
												<p class="y_tlname"><a href="#">美的全不锈钢电热水壶热水壶热水壶</a></p>
											</div>
										</div>	
										<div class="item">
											<div class="y_pcbox">
												<div class="y_tlpic"><a href="#"><img src="img/aebiz/y_tlpic.jpg"></a><a class="y_picbtn" href="#">立即查看 <i class="fa fa-angle-right"></i></a></div>
												<span>￥<b>89.00</b></span><s>￥599.00</s>
												<p class="y_tlname"><a href="#">美的全不锈钢美的全不锈钢电热水壶电热水壶</a></p>
											</div>
										</div>
										<div class="item">
											<div class="y_pcbox">
												<div class="y_tlpic"><a href="#"><img src="img/aebiz/y_tlpic.jpg"></a><a class="y_picbtn" href="#">立即查看 <i class="fa fa-angle-right"></i></a></div>
												<span>￥<b>89.00</b></span><s>￥599.00</s>
												<p class="y_tlname"><a href="#">美的全不锈钢美的全不锈钢电热水壶电热水壶</a></p>
											</div>
										</div>
									</div>
								</div>
								-->
						   
						    </div>
						  </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
		<div class="push-sticky-footer"></div>
	</div><!-- /wrapper -->
	
<!-- FOOTER 底部 -->
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImportJs.jsp"%>
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterBottom.jsp"%>
<script src="${pageContext.request.contextPath }/static/usercenter/js/king-page.js"></script>
<script src="${pageContext.request.contextPath }/static/usercenter/js/bootstrap-tagsinput.min.js"></script>
<script src="${pageContext.request.contextPath }/static/usercenter/js/owl.carousel.min.js"></script><!--响应式的商品滚动插件-->
<script src="${pageContext.request.contextPath }/static/usercenter/js/bootbox/jquery.bootbox.js"></script><!-- 点击删除表数据时的弹出提示框 -->

<script type="text/javascript">
$(function(){
	//分页带搜索,商品名称，起始页，每页显示条数
	loadSearchProducts("1","4");
	//根据商品名称搜索
	$("#search").click(function(){
		var nowPage=$("#nowPage").val();
		var pageShow=$("#pageShow").val();
		loadSearchProducts(nowPage,pageShow);
	});

	$("#check_all").click(function(){
		if($(this).is(":checked")){
			$("input[name='check']:checkbox").each(function(){
				$(this).prop("checked",true);
			});
		}else{
			$("input[name='check']:checkbox").each(function(){
				$(this).prop("checked",false);
			});
		}
	});

	var all=$(".w_sx").find("a");
	all.each(function(){
		$(this).click(function(){
			all.removeClass("cur");
			$(this).addClass("cur");
			var nowPage=$("#nowPage").val();
			var pageShow=$("#pageShow").val();
			loadSearchProducts(nowPage,pageShow);
		});
	});
});

//点击页面跳转
function loadPage(nowPage,pageShow){
	$("#nowPage").val(nowPage);
	$("#pageShow").val(pageShow);
	loadSearchProducts(nowPage,pageShow);
}

//ajax加载列表数据
function loadSearchProducts(nowPage,pageShow){
	var type="";
	var tag="";
	var $obj = $(".w_sx").find("a.cur");
	if($obj.length>0){
		type = $obj.find("input:hidden").val();
		tag = $obj.text();
	}else{
		type="all";
	}
	$("#listFavorite").empty();
	var url="${pageContext.servletContext.contextPath}/usercenter/productfavorite/toProductFavorite/"+nowPage+"/"+pageShow;
	$.get(url,{"type":type,"tag":tag,"productName":$("#productName").val(),"ranNum":Math.random()},function(data){
		$("#listFavorite").append(data);
	});
}

//取消收藏
function cancelFavorite(delId){
	var checkIds ="";
	if($.trim(delId)!=""){
		checkIds=delId;
	}else{
		$("input[name='check']:checkbox").each(function(){
			if($(this).is(":checked")){        	
	            checkIds += $(this).val()+"," ;  
	        }
		});
	}
	if($.trim(checkIds) == "") {
		//提示为空
		bootbox.alert("请选择需要取消收藏的商品!") ;
		return ;
	} 

	bootbox.confirm("您确认要取消收藏该商品？", function(r){
    	if(r) {
    		var url="${pageContext.servletContext.contextPath}/usercenter/productfavorite/cancelFavorite";
    		$.get(url,{"selectOne":checkIds,"ranNum":Math.random()},function(data){
    			if(data=="success"){
    				window.location.reload();
    			}else{
    				bootbox.alert('<aebiz:showTitle titleId="basebusiness.showmessage.opeFailed"/>') ;
    			}
    		});
        }
	});
}




       
                      
          	
					
</script>

</body>
</html>