<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/import/UpdateImport.jsp" %>
	<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/fileupload/bootstrap-fileupload.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/aebiz/aebiz.validate.expand.js"></script>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/storeHead.jsp"%>
	<div class="container-fluid" id="content">
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/storeLeft.jsp"%>
		<div id="main">
			<div class="container-fluid">
				<div class="page-header">
					<div class="pull-left"><h1><aebiz:showTitle titleId="customerstorelevel.moduleName_CN"/><aebiz:showTitle titleId="basebusiness.showmessage.edit"/></h1></div>
				</div>
						
				<div class="breadcrumbs">
					<ul>
						<li><span><aebiz:showTitle titleId="customerstorelevel.menuOne"/></span><i class="fa fa-angle-right"></i></li>
						<li><span><aebiz:showTitle titleId="customerstorelevel.menuTwo"/></span><i class="fa fa-angle-right"></i></li>
						<li><span><aebiz:showTitle titleId="customerstorelevel.moduleName_CN"/><aebiz:showTitle titleId="basebusiness.showmessage.edit"/></span></li>
					</ul>
				</div>
					
				<div class="box box-bordered bordered-top">
					<div class="box-content nopadding">								
						<form:form id="mainForm" action="${pageContext.servletContext.contextPath}/storeback/customerstorelevel/doUpdate" method="post" commandName="m" class='form-horizontal form-validate form-bordered' enctype="multipart/form-data">							
							<form:hidden path="uuid"/>
							<form:hidden path="oper"/>
							<form:hidden path="opeTime"/>
							<form:hidden path="delFlag"/>
							<form:hidden path="levelIcon"/>
							<form:hidden path="storeUuid"/>
		
							<div class="form-group">
								<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customerstorelevel.m.levelName"/></label>
								<div class="col-sm-10">
									<div class="col-sm-3">
										<form:input path="levelName" class='form-control'  data-rule-required="true" data-rule-minlength="2" data-rule-maxlength="10" />
										<input type="hidden" name="levelNameHidden" value="true">
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle
										titleId="customerstorelevel.m.levelIcon" /></label>
								<div class="col-sm-10">
									<div class="fileinput <c:choose><c:when test="${empty m.levelIcon}">fileinput-new</c:when><c:otherwise>fileinput-exists</c:otherwise></c:choose>" data-provides="fileinput">
										<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 75px; height: 75px;">
											<c:if test="${!empty m.levelIcon}"><img src="${m.imgUrl }" /></c:if>
										</div>
										<div>
											<span class="btn btn-default btn-file">
												<span class="fileinput-new">Select image</span>
												<span class="fileinput-exists">Change</span>
												<input type="file" name="files" class="imgReg imgSize" accept="image/*"/>
											</span>
											<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
										</div>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customerstorelevel.qm.levelcondition"/></label>
								<div class="col-sm-10">
									<div class="y_clear mb_10">
										<div class="y_sjjjd"><aebiz:showTitle titleId="customerstorelevel.m.buyTotalMoney"/>:</div>
										<div class="col-xs-2">
											<form:input path="buyTotalMoney" class='form-control' data-rule-nonnegativenum="true" data-rule-number="true" data-rule-minlength="1" data-rule-maxlength="10"/>
										</div>
										<div class="y_sjjjd"><aebiz:showTitle titleId="customerstorelevel.qm.or"></aebiz:showTitle></div>
									</div>
									<div class="y_clear">
										<div class="y_sjjjd"><aebiz:showTitle titleId="customerstorelevel.m.buyTotalCount"/>:</div>
										<div class="col-xs-2">
											<form:input path="buyTotalCount" class='form-control' data-rule-integernum="true" data-rule-number="true" data-rule-minlength="1" data-rule-maxlength="10"/>
										</div>
										<div class="y_sjjjd"><aebiz:showTitle titleId="customerstorelevel.qm.count"></aebiz:showTitle></div>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customerstorelevel.m.position"/></label>
								<div class="col-sm-10">
									<div class="col-sm-3">
										<form:input path="position" class='form-control' data-rule-positivenum="true" data-rule-required="true" data-rule-minlength="1" data-rule-maxlength="3"/>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customerstorelevel.m.description"/></label>
								<div class="col-sm-10">
									<form:textarea path="description" class='form-control' rows="5" data-rule-maxlength="100"/>
								</div>
							</div>
				
							<div class="form-actions col-sm-offset-2 col-sm-10">
								<input type="button" class="btn btn-primary submit" value='<aebiz:showTitle titleId="basebusiness.showmessage.save"/>'>
								<button type="button" class="btn cancel"><aebiz:showTitle titleId="basebusiness.showmessage.cancel"/></button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>	

<script>
    $(document).ready(function() {
    	jQuery.validator.addMethod("imgReg", function(value, element) {  
    		if(value!=""){
    		    var suffix = value.substr(value.lastIndexOf(".")+1);
    		    return ("jpg"==suffix) || ("jpeg"==suffix) || ("bmp"==suffix) || ("png"==suffix);
    		}else{
    			return true;
    		}
    	}, "请上传jpg、jpeg、bmp,png格式文件");

    	jQuery.validator.addMethod("imgSize", function(value, element) { 
    		if(value!=""){
    			var size = Math.ceil(element.files[0].size/1024);
    		    return size <=1024;
    		} else{
    			return true;
    		}
    	}, "图片大小不能超过1M");

    	$(".submit").click(function(){
    		var levelNameError=$("input[name='levelNameHidden']").val();
    		if(levelNameError=="true"){
    			$("#mainForm").submit();
    		}
    	});
    	
    	$("input[name='levelName']").blur(function(){
    		$("span[name='levelNameSpan']").remove();
    		var url="${pageContext.servletContext.contextPath}/storeback/customerstorelevel/checkLevelName";
    		var levelName=$.trim($("input[name='levelName']").val());
    		var uuid=$("#uuid").val();
    		if(levelName!=""){
    			$.get(url,{levelName:levelName,uuid:uuid,ranNum:Math.random()},function(data){
    				if(data=="true"){
    					$("input[name='levelName']").after("<span name='levelNameSpan'><font color='red'><aebiz:showTitle titleId="customerstorelevel.levelName.existed"/></font></span>");
    					$("input[name='levelNameHidden']").val("false");
    				}else{
    					$("input[name='levelNameHidden']").val("true");
    				}
    			})
    		}
    	});
        
		$(".cancel").click(function(){
			history.go(-1) ;
		});	    	
    });
</script>

</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>