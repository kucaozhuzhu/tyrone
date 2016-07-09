<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!--><html lang="en" class="no-js"> <!--<![endif]-->

	<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/import/ListImport.jsp"%>		
	<title><aebiz:showTitle titleId="ucenter_certification_title"/></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="description" content="KingAdmin - Bootstrap Admin Dashboard Theme">
	<meta name="author" content="The Develovers">

</head>

<body class="demo-only-page-blank">
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
					<!-- end left sidebar -->

					<!-- content-wrapper 右侧主体 -->
					<div class="col-xs-10 content-wrapper">
						<div class="row">
							<div class="col-sm-4 ">
								<ul class="breadcrumb">
									<li>
										<i class="fa fa-home"></i>
										<a href="${pageContext.servletContext.contextPath}/customer/toIndex"><aebiz:showTitle titleId="ucenter_indexPage_membercenter"/></a>
									</li>
									<li>
										<a href="${pageContext.servletContext.contextPath}/usercenter/customer/toSecuritySetting">
											<aebiz:showTitle titleId="ucenter_securitySet_safeCenter"/>
										</a>
									</li>
									<li class="active"><aebiz:showTitle titleId="ucenter_securitySet_auth"/></li>
								</ul>
							</div>
							
							<%@ include file="/WEB-INF/jsp/basebusiness/usercenter/common/usercenterNameplate.jsp"%>
						</div>
						
						<!-- main -->
						<div class="content">
							<div class="main-header">
								<h2><aebiz:showTitle titleId="ucenter_certification_title"/></h2>
								<em>The real name authentication</em>
							</div>
							
							<div class="main-content">
								<form id="mainForm" class="form-horizontal y_setpassd form-validate" action="${pageContext.servletContext.contextPath}/usercenter/customerauth/doCustomerAuth" method="post" enctype="multipart/form-data">
									<input type="hidden" id="customerUuid" name="customerUuid" value="${m.customerUuid}">
									<input type="hidden" name="pageType" value="updatepage">
									
									<div class="form-group">
										<label for="realName" class="col-xs-3 control-label"><aebiz:showTitle titleId="ucenter_certification_realName"/>：</label>
										<div class="col-xs-4">
											<input type="text" id="realName" name="realName" class="form-control realNameReg">
										</div>
									</div>
									
									<div class="form-group">
										<label for="certType" class="col-xs-3 control-label"><aebiz:showTitle titleId="ucenter_certification_certType"/>：</label>
										<div class="col-xs-4">
											<select class="form-control" id="certType" name="certType">
												<option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</option>
												<c:forEach items="${certTypeList}" var="dpp">
													<option value="${dpp.name}">${dpp.value}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									
									<div class="form-group">
										<label for="certCode" class="col-xs-3 control-label"><aebiz:showTitle titleId="ucenter_certification_certCode"/>：</label>
										<div class="col-xs-4">
											<input type="text" id="certCode" name="certCode" class="form-control IDCodeReg">
										</div>
									</div>
									
									<div class="form-group">
										<label for="certImage1" class="col-xs-3 control-label"><aebiz:showTitle titleId="ucenter_certification_certFrontImg"/>：</label>
										<div class="col-xs-9 row">
											<div class="col-xs-5 y_picwidh">
												<div class="fileinput fileinput-new" data-provides="fileinput">
													<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:120px; height:90px;background:url(${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/cordfow.jpg) 4px 4px no-repeat">
													</div>
													
													<div class="btn-filebox">
														<span class="btn btn-default btn-file">
															<span class="fileinput-new"><aebiz:showTitle titleId="ucenter_certification_upload"/></span>
															<span class="fileinput-exists"><aebiz:showTitle titleId="ucenter_certification_modify"/></span>
															<input type="file" id="imgFile1" name="imgFile1" class="imgReg imgSize" accept="image/*">
														</span>
														<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">
															<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>
														</a>
													</div>
												</div>
											</div>
											
											<div class="col-xs-5 y_picwidh2">
												<span class="fl"><aebiz:showTitle titleId="ucenter_certification_example"/>：</span>
												<div class="fileinput-preview thumbnail">
													<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/cordfow2.jpg" width=120 height=90>
												</div>
											</div>
											
											<div class="col-xs-5">
												<ol class="text-999">
													<li>1.请手持相关证件，临时身份证有效期15天以上。</li>	
													<li>2.照片需免冠，建议未化妆，需身份证本人手持证件。</li>	
													<li>3.必须看清证件号且证件号不能被遮挡。</li>	
													<li>4.照片支持jpg、jpeg、bmp格式，最大不超过5M。</li>	
												</ol>	
												<a href="#">帮助 >></a>
											</div>
										</div>
									</div>
									
									<input type="hidden" id="fileHidden0" value="true">
									<input type="hidden" id="fileHidden1" value="true">
									
									<div class="form-group">
										<label for="certImage2" class="col-xs-3 control-label"><aebiz:showTitle titleId="ucenter_certification_certBackImg"/>：</label>
										<div class="col-xs-9 row">
											<div class="col-xs-5 y_picwidh">
												<div class="fileinput fileinput-new" data-provides="fileinput">
													<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:120px; height:90px;background:url(${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/cordback.jpg) 4px 4px no-repeat">
													</div>
													
													<div class="btn-filebox">
														<span class="btn btn-default btn-file">
															<span class="fileinput-new"><aebiz:showTitle titleId="ucenter_certification_upload"/></span>
															<span class="fileinput-exists"><aebiz:showTitle titleId="ucenter_certification_modify"/></span>
															<input type="file" id="imgFile2" name="imgFile2" class="imgReg imgSize" accept="image/*">
														</span>
														<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">
															<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>
														</a>
													</div>
												</div>
											</div>
											
											<div class="col-xs-5 y_picwidh2">
												<span class="fl"><aebiz:showTitle titleId="ucenter_certification_example"/>：</span>
												<div class="fileinput-preview thumbnail">
													<img src="${pageContext.servletContext.contextPath}/static/usercenter/img/aebiz/cordback2.jpg" width=120 height=90>
												</div>
											</div>
											
											<div class="col-xs-5">
												<ol class="text-999">
													<li>1.身份证有效期需要在1个月以上。</li>	
													<li>2.照片必须能看清有效期。</li>	
													<li>3.照片支持jpg、jpeg、bmp格式，最大不超过5M。</li>
												</ol>	
												<a href="#">帮助 >></a>
											</div>
										</div>
									</div>
									
									<div class="row">
										<p class="col-xs-9 col-xs-offset-3">
											<button type="submit" class="btn submit btn-custom-primary"><aebiz:showTitle titleId="basebusiness.showmessage.save"/></button>	
											<button type="button" class="btn cancel"><aebiz:showTitle titleId="basebusiness.showmessage.cancel"/></button>
										</p>
									</div>
								</form>
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
<script src="${pageContext.servletContext.contextPath}/static/usercenter/js/validation/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/static/customermgr/usercenter/aebiz.validate.expand.js"></script>
<script src="${pageContext.request.contextPath }/static/usercenter/js/fileupload/bootstrap-fileupload.min.js"></script>
	
<script>
$(function(){
	jQuery.validator.addMethod("imgReg", function(value, element) {  
	    var suffix = value.substr(value.lastIndexOf(".")+1);
	    return ("jpg"==suffix) || ("jpeg"==suffix) || ("bmp"==suffix) || ("png"==suffix);
	}, "请上传jpg、jpeg、bmp、png格式文件");

	jQuery.validator.addMethod("imgSize", function(value, element) {  
		var size = Math.ceil(element.files[0].size/1024);
	    return size <=1024;
	}, "图片大小不能超过1M");
	
	$("#mainForm").validate({
		 rules: {
			realName:{
				required : true
			},
			certType:{
				required : true
			},
			certCode:{
				required : true,
				remote: {
					url:"${pageContext.servletContext.contextPath}/usercenter/customerauth/checkCertCodeExist",
					type:"get",
					dataType:"json",
					data:{
						customerUuid : function(){
							return $("#customerUuid").val();
						},
						certCode : function(){
							return $("#certCode").val();
						}
					}
				}
			},
			imgFile1:{
				required :true
			},
			imgFile2:{
				required :true
			}
  		},
        messages: {
			realName:{
				required : "请输入您的真实姓名"
			},
			certType:{
				required : "请选择证件类型"
			},
			certCode:{
				required : function(){
					var certType = $("#certType").val();
					if(certType==""){
						return "请选择证件类型";
					}else{
						return "请输入证件号码";
					}
				},
				remote : "证件号码已被注册！"
			},
			imgFile1:{
				required : "请上传证件正面照片"
			},
			imgFile2:{
				required : "请上传证件反面照片"
			}
  		},
		errorElement: 'span',  //输入错误时的提示标签
		errorClass: 'help-block has-error',  //输入错误时的提示标签类名
		errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
			 if(element.parents(".btn-filebox").siblings(".thumbnail").length>0){
				element.parents(".btn-filebox").siblings(".thumbnail").after(error);
			 }else{
				element.after(error);
			 }
		},
		
	    highlight: function(label) {   //输入错误时执行的事件
	        $(label).closest('.form-group').removeClass('has-error has-success').addClass('has-error');
	    },

		success: function(label) {   //输入正确时执行的事件
  			label.addClass('valid').closest('.form-group').removeClass('has-error has-success').addClass('has-success');
		},

		onkeyup: function(element) {   //验证元素输入值时按钮松开执行的事件
 			$(element).valid();
		},
		
		onfocusout: function(element) {   //验证元素失去焦点时进行验证
	 		$(element).valid();
		},
		debug: true ,
		submitHandler:function(form){
            form.submit();
        }    
	});

	$(".cancel").click(function() {
		window.location.href="${pageContext.servletContext.contextPath}/usercenter/customer/toSecuritySetting";
	});
});	
</script>

</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>