<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->
	
	<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>		
	<title>店铺收藏</title>
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
		
		<!-- BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT 左侧导航和右侧主体 -->
		<div class="bottom">
			<div class="container">
				<div class="row">
					<!-- left sidebar 左侧导航 -->
					<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterLeft.jsp"%>

					<!-- content-wrapper 右侧主体 -->
					<div class="col-xs-10 content-wrapper">
						<div class="row">
							<div class="col-sm-4 ">
								<ul class="breadcrumb">
									<li>
										<i class="fa fa-home"></i>
										<a href="${pageContext.servletContext.contextPath}/customer/toIndex"><aebiz:showTitle titleId="ucenter_indexPage_membercenter"/></a>
									</li>
									<li class="active">店铺收藏</li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
						</div>
						
						<div class="content">
						  <div class="main-header">
						    <h2>我的收藏夹</h2>
						  </div>
						  
						  <ul class="nav nav-tabs bornone">
						    <li class=""><a href="${pageContext.servletContext.contextPath}/usercenter/productfavorite/toPage"><i class="fa fa-folder"></i>商品收藏</a></li>
						    <li class="active"><a href="${pageContext.servletContext.contextPath}/usercenter/storefavorite/toPage"><i class="fa fa-folder-o"></i>店铺收藏</a></li>
						  </ul>
						  
						  <div class="main-content ad100">
						    <div class="w_scsp">
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
						      
						      <!--  
						      <div class="w_xz col-mi-6 col-md-5">
						        <div class="simple-checkbox w_xzf mr_10">
						          <input type="checkbox" id="checkbox4">
						          <label for="checkbox4">全部店铺</label>
						        </div>
						        <div class="simple-checkbox w_xzf mr_10">
						          <input type="checkbox" id="checkbox1">
						          <label for="checkbox1">促销活动店铺</label>
						        </div>
						        <div class="simple-checkbox w_xzf mr_10">
						          <input type="checkbox" id="checkbox3">
						          <label for="checkbox3">常逛店铺</label>
						        </div>
						       </div>
						       -->
						        
						      <div class="col-mi-5 col-md-5 fr">
						          <div class="input-group input-group-sm">
							          <input type="search" id="storeName" placeholder="店铺搜索" class="form-control">
							          <span class="input-group-btn">
							          	<button class="btn btn-primary" type="button" id="search"><i class="fa fa-search"></i> 搜索</button>
							          </span> 
						          </div>
						      </div>
						    </div>
						    
						     <div class="w_dx mt20">
					            <div class="simple-checkbox">
					              <input type="checkbox" id="check_all">
					              <label for="check_all">全选</label>
					            </div>
					            <a onclick="javascript:cancelFavorite('');" class="w_qbqxsc">取消收藏</a>
					          </div>
						    
							 <input type="hidden" name="nowPage" id="nowPage" value="1"/>
							 <input type="hidden" name="pageShow" id="pageShow" value="5"/>
							 
							 <!--收藏商品列表内容-->
				            <div id="listFavorite" class="w_scsplb y_clear">
				          
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
<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/bootbox/jquery.bootbox.js"></script><!-- 点击删除表数据时的弹出提示框 -->

<script type="text/javascript">
$(function(){
	//分页带搜索,商品名称，起始页，每页显示条数
	loadSearchStores("","","","1","5");
	//根据商品名称搜索
	$("#search").click(function(){
		var storeName = $("#storeName").val();
		var type = $(".w_sx").find("a.cur").find("input:hidden").val();
		var tag = $(".w_sx").find("a.cur").text();
		var nowPage=$("#nowPage").val();
		var pageShow=$("#pageShow").val();
		loadSearchStores(type,tag,storeName,nowPage,pageShow);
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
			var type = $(this).find("input:hidden").val();
			var tag = $(this).text();
			var storeName = $("#storeName").val();
			var nowPage=$("#nowPage").val();
			var pageShow=$("#pageShow").val();
			loadSearchStores(type,tag,storeName,nowPage,pageShow);
		});
	});
});

//点击页面跳转
function loadPage(nowPage,pageShow){
	$("#nowPage").val(nowPage);
	$("#pageShow").val(pageShow);
	var type = $(".w_sx").find("a.cur").find("input:hidden").val();
	var tag = $(".w_sx").find("a.cur").text();
	var storeName = $("#storeName").val();
	loadSearchStores(type,tag,storeName,nowPage,pageShow);
}

//ajax加载列表数据
function loadSearchStores(type,tag,storeName,nowPage,pageShow){
	$("#listFavorite").empty();
	var url="${pageContext.servletContext.contextPath}/usercenter/storefavorite/toStoreFavorite/"+nowPage+"/"+pageShow;
	$.get(url,{"type":type,"tag":tag,"storeName":storeName,"ranNum":Math.random()},function(data){
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
		bootbox.alert("请选择需要取消收藏的店铺!") ;
		return ;
	} 

	bootbox.confirm("您确认要取消收藏该店铺？", function(r){
    	if(r) {
    		var url="${pageContext.servletContext.contextPath}/usercenter/storefavorite/cancelFavorite";
    		$.get(url,{"selectOne":checkIds,"ranNum":Math.random()},function(data){
    			if(data){
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