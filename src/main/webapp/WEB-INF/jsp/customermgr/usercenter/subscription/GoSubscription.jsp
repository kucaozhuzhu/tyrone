<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->

    <%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>	
	<title><aebiz:showTitle titleId="ucenter_subscription_subContent"/></title>
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
									<li class="active"><aebiz:showTitle titleId="ucenter_subscription_subContent"/></li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
						</div>
						
						<!-- main -->
						<div class="content">
						 	<div class="main-header">
								<h2><aebiz:showTitle titleId="ucenter_subscription_subContent"/></h2>
							</div>
							
							<div class="main-content">
								<!-- 
						 		<div class="widget serve-widget scribe-for">
							  	 	<div class="widget-header">
										<h3>订阅有礼</h3>
										<div class="btn-group widget-header-toolbar">
											<a href="#" title="<aebiz:showTitle titleId="ucenter_subscription_clickSee"/>" class="btn-borderless btn-focus"><i class="fa fa-eye"></i></a>
											<a href="#" title="<aebiz:showTitle titleId="ucenter_subscription_contractOrExpand"/>" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
										</div>
									</div>
							 	 	<div class="widget-content">
									  	<div class="row">
										    <div class="col-mi-4 col-sm-4">
											   <div class="col-in">
												   <h3>神秘促销邮件</h3>
											   	   <p>有机会购买到低于商城价格或者赠送积分的商品</p>
										   	   </div>
										   	</div>
										   	<div class="col-mi-4 col-sm-4">
											   	<div class="col-in">
												   	<h3>最新促销信息通知件</h3>
												   	<p>第一时间收到最新最火爆的促销信息</p>
											   	</div>
										   	</div>
										   	<div class="col-mi-4 col-sm-4 r_marginleft">
									   	 	<div class="col-in">
									   	   		<h3><a href="#">马上查看邮件专属商品，享受更低价格！</a></h3>
									   		 </div>
									   	</div>	
										</div>
					 		 		</div>
							 	</div>
							 	
								 -->

							 	<!-- widge 订阅促销信息 star -->
							    <div class="widget serve-widget serve-detail">
									<div class="widget-header">
										<h3><aebiz:showTitle titleId="ucenter_subscription_subPromotionInfo"/></h3>
										<div class="btn-group widget-header-toolbar">
											<a href="#" title="<aebiz:showTitle titleId="ucenter_subscription_clickSee"/>" class="btn-borderless btn-focus"><i class="fa fa-eye"></i></a>
											<a href="#" title="<aebiz:showTitle titleId="ucenter_subscription_contractOrExpand"/>" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
										</div>
									</div>
									
									<input type="hidden" id="customerUuid" value="${wm.customerUuid}">
									 
									<!-- widget-content star-->
								    <div class="widget-content">
                   					   	<div class="table-responsive sub-classifi">
										   <table class="table table-striped r_promotiontable">
										   	  <thead>
											      <tr>
											         <th>
												         <div class="control-inline simple-checkbox">
												         	<input type="checkbox" id="selectAll">
													         <label for="selectAll">
													         	<aebiz:showTitle titleId="ucenter_subscription_subName"/>
												         	</label>
												         </div>
												     </th>	
											         <th><aebiz:showTitle titleId="ucenter_subscription_subType"/></th>
											         <th><aebiz:showTitle titleId="ucenter_subscription_subDesc"/></th>  
											     </tr>
										      </thead>
										      
										      <tbody>
										      	<c:choose>
										      		<c:when test="${!empty allList}">
										      			<c:forEach items="${allList}" var="m">
													     	<tr>
														    	<td>
															      	<div class="control-inline simple-checkbox">
																      	<input type="checkbox" id="${m.uuid}" name="subscribeUuid" value="${m.uuid}">
																      	<label for="${m.uuid}">${m.subscribeName}</label>
																  	</div> 
														      	</td>
														      	<td>${m.subscribeType}</td>
														      	<td>${m.description}</td>
														    </tr>
														</c:forEach> 	
										      		</c:when>
										      		<c:otherwise>
										      			<tr><td colspan="3">没有订阅信息了</td></tr>
										      		</c:otherwise>
										      	</c:choose>
										      </tbody>
										   </table>
									 	</div> 
                   					 
                   		 			  	<div class="row col-bothbB col-bothbT logi-num">
					                     	<div class="col-mi-2 col-sm-2"><aebiz:showTitle titleId="ucenter_subscription_subWay"/></div>
											<div class="col-mi-10 col-sm-10 col-bothbL">
		                   						<i class="fa fa-phone"></i>
		                   						<input type="text" placeholder="<aebiz:showTitle titleId="ucenter_subscription_mobileSub"/>" id="mobile" value="${wm.mobile}" maxlength="11">
		                   						<aebiz:showTitle titleId="ucenter_subscription_or"/><br/>
												<i class="fa fa-envelope-o"></i>
												<input type="text" placeholder="<aebiz:showTitle titleId="ucenter_subscription_emailSub"/>" id="email" value="${wm.email}"><br/>
												<aebiz:showTitle titleId="ucenter_subscription_tip"/>
											</div>
                   		 			  	</div>
                   		 			
			                    	    <div class="row sub-box">
			                     			<div class="col-mi-2 col-sm-2"></div>
											<div class="col-mi-10 col-sm-10">
												<button id="gritter-regular1" type="button" class="btn btn-primary subbut btn-gritter submit"><aebiz:showTitle titleId="basebusiness.showmessage.save"/></button> 
												<a href="${pageContext.servletContext.contextPath}/usercenter/customersubscription/toMySubscription" class="btn btn-primary"><aebiz:showTitle titleId="ucenter_subscription_seeMySubscription"/></a>
											</div>  
                    					</div>
								  	</div>
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
	<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/bootstrap.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/bootbox/jquery.bootbox.js"></script>
	
<script>
	$(function(){
		$("#selectAll").click(function(){
	    	if($(this).is(":checked")){
	    		$("input[name='subscribeUuid']:checkbox").each(function(){
	    			$(this).prop("checked",true);
	    		});
	    	}else{
	    		$("input[name='subscribeUuid']:checkbox").each(function(){
	    			$(this).prop("checked",false);
	    		});
	    	}
	    });
	    
	    $(".submit").click(function(){
	    	var mobileReg = /^1\d{10}$/;
	   		var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	    	
	    	var customerUuid=$("#customerUuid").val();
	    	var mobile=$("#mobile").val();
	    	var email=$("#email").val();
	   		var subUuids ="";
	   		
	       	$("input[name='subscribeUuid']:checked").each(function(){
	       		subUuids += $(this).val()+";";
	       	});
	       	
	       	if(mobile==""){
	       		if(email==""){
	       			bootbox.alert("<aebiz:showTitle titleId="ucenter_subscription_notNull"/>");
	       		}else{
	       			if(emailReg.test(email)){
	       				doSub(customerUuid,mobile,email,subUuids);
	       			}else{
	       				bootbox.alert("请输入正确的邮箱地址");
	       			}
	       		}
	       	}else{
	       		if(mobileReg.test(mobile)){
	       			if(email==""){
	       				doSub(customerUuid,mobile,email,subUuids);
	       			}else{
	       				if(emailReg.test(email)){
	       					doSub(customerUuid,mobile,email,subUuids);
	       				}else{
	        				bootbox.alert("请输入正确的邮箱地址");
	        			}
	        		}
	        	}else{
	    			bootbox.alert("请输入正确的手机号");
	    		}
	       	}
	    });
	});
    
    function doSub(customerUuid,mobile,email,subUuids){
    	var url="${pageContext.servletContext.contextPath}/usercenter/customersubscription/doSubscription";
    	if(subUuids!=""){
    		$.get(url,{"customerUuid":customerUuid,"mobile":mobile,"email":email,"subUuids":subUuids,"ranNum":Math.random()},function(data){
        		if(data=="true"){
        			window.location.href="${pageContext.servletContext.contextPath}/usercenter/customersubscription/toMySubscription";
        		}else{
        			bootbox.alert("<aebiz:showTitle titleId="basebusiness.showmessage.opeFailed"/>") ;
        		}
        	});
    	}else{
    		bootbox.alert("<aebiz:showTitle titleId="ucenter_subscription_chooseSubContent"/>") ;
    	}
    }
</script>

</body>
</html>