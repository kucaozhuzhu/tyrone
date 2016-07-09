<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->

	<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>	
	<title><aebiz:showTitle titleId="ucenter_customerInfo_title"/></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="description" content="KingAdmin - Bootstrap Admin Dashboard Theme">
	<meta name="author" content="The Develovers">
	
	<link href="${pageContext.request.contextPath }/static/usercenter/css/jcrop/jquery.Jcrop.css" rel="stylesheet" type="text/css">
	<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImportJs.jsp"%>
	<script src="${pageContext.request.contextPath }/static/usercenter/js/jquery.Jcrop.js"></script>
	
</head>

<body>
	<!-- WRAPPER 头部、左侧、右侧大框架 -->
	<div class="wrapper">
		<!-- TOP BAR 头部导航 -->
		<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterHead.jsp"%>
		<!-- /top -->
		<div class="container">
			<div class="ku_crumbs">
				<a href="${pageContext.servletContext.contextPath}/customer/toIndex">首页</a><b>&gt</b><span>个人资料</span>
			</div>
		</div>
		<!-- BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT 左侧导航和右侧主体 -->
		<div class="bottom">
			<div class="container">
				<div class="row">
					<!-- left sidebar 左侧导航 -->
					<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterLeft.jsp"%>
					<!-- end left sidebar -->

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
									<li class="active"><aebiz:showTitle titleId="ucenter_customerInfo_title"/></li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
						</div>
						--%>
						<!-- main -->
						<div class="content ku_orderlist">
							<div class="main-header">
								<h2><aebiz:showTitle titleId="ucenter_customerInfo_title"/></h2>
								<%--<em>user profile page</em>--%>
							</div>

							<div class="main-content">
								<ul class="nav nav-tabs ku_tabs">
									<li>
										<a href="${pageContext.servletContext.contextPath}/usercenter/customercomplex/toModifyCustomerInfo">
											<i class="fa fa-user"></i>
											<aebiz:showTitle titleId="ucenter_customerInfo_baseInfo"/>
										</a>
									</li>
									<li class="active">
										<a href="${pageContext.servletContext.contextPath}/usercenter/customercomplex/toUploadImage">
											<i class="fa fa-camera"></i>
											<aebiz:showTitle titleId="ucenter_customerInfo_Image"/>
										</a>
									</li>
								</ul>
								
								<div class="tab-content profile-page ku_headphoto mt_30">
									<!-- 修改图像 star -->
									<div class="change-headphoto " id="change-headphoto-tab">
										<div class="row">
											<form id="mainForm" action="${pageContext.servletContext.contextPath}/usercenter/customercomplex/uploadHeadImage" class="form-horizontal" method="post" enctype="multipart/form-data">
												<input type="hidden" id="x" name="x"/>
								                <input type="hidden" id="y" name="y"/>
								                <input type="hidden" id="w" name="w"/>
								                <input type="hidden" id="h" name="h"/>
											
												<div class="col-xs-4">
													<div class="change-headphoto-left">
														<div class="file-image">
															<span class="input-file">
																<i class="fa fa-picture-o">
																	<aebiz:showTitle titleId="ucenter_customerInfo_chooseImage"/>
													                <input class="hide_file" type="file" id="fcupload" name="imgFile" accept="image/*" onchange="readURL(this);"/>
																</i>
															</span>
														</div>
														
														<p class="change-headphoto-tooltip"><aebiz:showTitle titleId="ucenter_customerInfo_imageTip"/></p>
														<div class="your-feed">
															<h5>当前头像</h5>
															<div class="view-img">
																<c:choose>
																	<c:when test="${!empty cim.imgUrl}">
																		<img src="${cim.imgUrl}">
																	</c:when>
																	<c:otherwise>
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/default.png">
																	</c:otherwise>
																</c:choose>
															</div>
														</div>
													</div>
												</div>
												
												<div class="col-xs-8">
													<div class="change-headphoto-right">
														<div class="y_chooseimg">
															<div class="file-image-box">
																<div class="file-image" id="showImg">
																	<c:choose>
																		<c:when test="${!empty cim.imgUrl}">
																			<img id="cutimg" src="${cim.imgUrl}"/>
																		</c:when>
																		<c:otherwise>
																			<img id="cutimg" src="${pageContext.servletContext.contextPath}/static/usercenter/img/default.png">
																		</c:otherwise>
																	</c:choose>
															    </div>
															</div>
															
															<div class="y_previewbox">
																<h5><aebiz:showTitle titleId="ucenter_customerInfo_preview"/></h5>
																<div class="y_previewimg">
															       <span style="width:150px;height:150px;" id="preview_box" class="crop_preview">
															       		<c:choose>
																			<c:when test="${!empty cim.imgUrl}">
																				<img id="crop_preview" src="${cim.imgUrl}"/>
																			</c:when>
																			<c:otherwise>
																				<img id="crop_preview" src="${pageContext.servletContext.contextPath}/static/usercenter/img/default.png">
																			</c:otherwise>
																		</c:choose>
													                </span>
													            </div>
												            </div>
												        </div>
												        
														<div class="recommend-headphotos">
															<h4 class=""><aebiz:showTitle titleId="ucenter_customerInfo_systemRecommend"/></h4>
															<div class="recommend-headphotos-box">
															    <ul id="imageUl">
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/1.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/2.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/3.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/4.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/5.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/6.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/7.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/8.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/9.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/10.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/11.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/12.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/13.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/14.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/15.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																	<li class="">
																		<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/change-headphotos/16.jpg"/>
																		<i class="fa fa-check-square"></i>
																	</li>
																</ul>
																
															
															</div>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<p class="img-save">
								<button type="button" onclick="javascript:upload();" class="btn btn-warning">
									<aebiz:showTitle titleId="basebusiness.showmessage.save"/>
							  	</button>
							  </p>
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
<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterBottom.jsp"%>
<script src="${pageContext.request.contextPath }/static/usercenter/js/king-elements.js"></script>
<script src="${pageContext.request.contextPath}/static/usercenter/js/ajaxfileupload.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/bootbox/jquery.bootbox.js"></script>
	
<script>
var api = null;
function readURL(input) {
    if (input.files && input.files[0]) {
		var suffix = input.value.substring(input.value.indexOf(".")+1);
		if("jpg"!=suffix && "jpeg"!=suffix && "gif"!=suffix && "png"!=suffix && "bmp"!=suffix){
			 bootbox.alert({  
		            buttons: {  
		               ok: {  
		                    label: '确认',  
		                }  
		            },  
		            message: '文件格式不正确',  
		     });  
		}else{
			var fileSize=Math.ceil(input.files[0].size/1024);
			if(fileSize>=1024*4){
				bootbox.alert({  
		            buttons: {  
		               ok: {  
		                    label: '确认',  
		                }  
		            },  
		            message: '图片不能大于4M',  
		    	 });
				return;
			}else{
				var reader = new FileReader();
		        reader.readAsDataURL(input.files[0]);
		        reader.onload = function (e) {
		            $('#cutimg').attr('src', e.target.result);
		            $('#crop_preview').attr('src', e.target.result);
		            api = $.Jcrop('#cutimg', {
		                setSelect: [62, 62, 120, 120],
		                onSelect: updateCoords,
		                onChange: updateCoords,
		                maxSize: [200, 200],
		                minSize: [150, 150],
		                allowSelect:false,
		                aspectRatio: 1
		            });
		        };
		        if (api != undefined) {
		            api.destroy();
		        }
			}
	    }
    }
}

function updateCoords(obj) {
	 if (parseInt(obj.w) > 0) {
        //计算预览区域图片缩放的比例，通过计算显示区域的宽度(与高度)与剪裁的宽度(与高度)之比得到
        var rx = $("#preview_box").width() / obj.w;
        var ry = $("#preview_box").height() / obj.h;
        //通过比例值控制图片的样式与显示
        $("#crop_preview").css({
            width: Math.round(rx * $("#cutimg").width()) + "px", //预览图片宽度为计算比例值与原图片宽度的乘积
            height: Math.round(rx * $("#cutimg").height()) + "px", //预览图片高度为计算比例值与原图片高度的乘积
            marginLeft: "-" + Math.round(rx * obj.x) + "px",
            marginTop: "-" + Math.round(ry * obj.y) + "px"
        });
    }
   $("#x").val(obj.x);
   $("#y").val(obj.y);
   $("#w").val(obj.w);
   $("#h").val(obj.h);
}

function upload(){
	var imgFile = $("#fcupload").val(); 
	//上传本地图片
	if(imgFile!=""){
		//判断
		var input=document.getElementById("fcupload");
		var suffix = input.value.substring(imgFile.indexOf(".")+1);
		if("jpg"!=suffix && "jpeg"!=suffix && "gif"!=suffix && "png"!=suffix && "bmp"!=suffix){
			 bootbox.alert({  
		            buttons: {  
		               ok: {  
		                    label: '确认',  
		                }  
		            },  
		            message: '文件格式不正确',  
		     }); 
			 return ;
		}
		var fileSize=Math.ceil(input.files[0].size/1024);
		if(fileSize>=1024*4){
			bootbox.alert({  
	            buttons: {  
	               ok: {  
	                    label: '确认',  
	                }  
	            },  
	            message: '图片不能大于4M',  
	    	 });
			return;
		}
		
		 bootbox.alert({  
	            buttons: {  
	               ok: {  
	                    label: '确认',  
	                }  
	            },  
	            message: '上传成功',  
	            callback: function() {  
	            	$("#mainForm").submit();	
	            },  
	     }); 
	}else{
		//上传系统推荐图片
		var img = $("#imageUl").find("li.selected").find("img");
		if(img.length>0){
			var url="${pageContext.request.contextPath}/usercenter/customercomplex/updateImage";
			$.get(url,{"customerUuid":"${cim.customerUuid}","img":img.attr("src"),"ranNum":Math.random()},function(data){
				if(data=="true"){
					 bootbox.alert({  
				            buttons: {  
				               ok: {  
				                    label: '确认',  
				                }  
				            },  
				            message: '上传成功',  
				            callback: function() {  
				            	window.location.reload();	
				            },  
				     });  
				 } 
			});
		}else{
			 bootbox.alert({  
		            buttons: {  
		               ok: {  
		                    label: '确认',  
		                }  
		            },  
		            message: '请选择默认图像',  
		     });  
		}
	}
}
	
$(function(){	
	$(".title-imagebox").hover(function(){
		$(this).find(".change-image").fadeIn();},function(){
		$(this).find(".change-image").fadeOut();	
	});
	
	var all=$("#imageUl li");
	all.each(function(){
		$(this).click(function(){
			all.removeClass("selected");
			$(this).addClass("selected");
		});
	});
});
</script>
</body>
</html>