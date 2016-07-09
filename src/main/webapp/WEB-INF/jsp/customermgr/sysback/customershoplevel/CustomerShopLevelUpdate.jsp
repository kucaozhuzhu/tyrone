<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<%@ include file="/WEB-INF/jsp/basebusiness/common/import/UpdateImport.jsp" %>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/fileupload/bootstrap-fileupload.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.validate.expand.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/bootbox/jquery.bootbox.js"></script><!-- 点击删除表数据时的弹出提示框 -->
</head>

<body>
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left"><h1><aebiz:showTitle titleId="basebusiness.showmessage.edit"/><aebiz:showTitle titleId="customershoplevel.moduleName_CN"/></h1></div>
		</div>
				
		<div class="breadcrumbs">
			<ul>
				<li><span><aebiz:showTitle titleId="customershoplevel.menuOne"/></span><i class="fa fa-angle-right"></i></li>
				<li><span><aebiz:showTitle titleId="customershoplevel.menuTwo"/></span><i class="fa fa-angle-right"></i></li>
				<li><span><aebiz:showTitle titleId="basebusiness.showmessage.edit"/><aebiz:showTitle titleId="customershoplevel.moduleName_CN"/></span></li>
			</ul>
		</div>
				
		<div class="box box-bordered bordered-top">
			<div class="box-content nopadding">								
				<form:form id="mainForm" action="${pageContext.servletContext.contextPath}/sysback/customershoplevel/doUpdate" method="post" commandName="m" class='form-horizontal form-validate form-bordered' enctype="multipart/form-data">							
					<form:hidden path="uuid"/>	
					<form:hidden path="levelIcon"/>	
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customershoplevel.m.levelName"/></label>
						<div class="col-sm-10">
							<div class="col-sm-3">
							    <input type="hidden" name="levelType" value="2">
								<form:input path="levelName" class='form-control'  data-rule-required="true" data-rule-minlength="3" data-rule-maxlength="10"/>
								<input type="hidden" name="levelNameHidden" value="true">
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customershoplevel.m.levelIcon" /></label>
						<div class="col-sm-10">
							<div class="fileinput <c:choose><c:when test="${empty m.levelIcon}">fileinput-new</c:when><c:otherwise>fileinput-exists</c:otherwise></c:choose>" data-provides="fileinput">
								<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 75px; height: 75px;">
									<c:if test="${!empty m.levelIcon}"><img src="${m.imgUrl}" /></c:if>
								</div>
								<div>
									<span class="btn btn-default btn-file">
										<span class="fileinput-new"><aebiz:showTitle titleId="customerinfo.m.choose"/></span>
										<span class="fileinput-exists"><aebiz:showTitle titleId="customerinfo.m.change"/></span>
										<input type="file" name="files" class="imgReg imgSize" accept="image/*"/>
									</span>
									<a href="#" id="removebtn" class="btn btn-default fileinput-exists" data-dismiss="fileinput"><aebiz:showTitle titleId="customerinfo.m.remove"/></a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customershoplevel.m.integralRange"/></label>
						<div class="col-sm-10">
							<div class="col-xs-2">
								<form:input path="minIntegral" class='form-control' data-rule-positivenum="true" data-rule-required="true" data-rule-minlength="1" data-rule-maxlength="10"/>
							</div>
							<div class="y_sjjjd">-</div>
							<div class="col-xs-2">
								<form:input path="maxIntegral" class='form-control' data-rule-positivenum="true" data-rule-required="true" data-rule-minlength="1" data-rule-maxlength="10"/>
								<input type="hidden" name="maxIntegralHidden" value="true">
							</div>
						</div>
					</div>
					 <!-- 
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customershoplevel.m.integraRate"/></label>
						<div class="col-sm-10">
							<div class="col-sm-3">
								<form:input path="inteRate" class='form-control' data-rule-positivenum="true" data-rule-required="true" data-rule-minlength="1" data-rule-maxlength="3"/>
								<input type="hidden" name="inteRateHidden" value="true">
							</div>
						</div>
					</div>
					 -->
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customershoplevel.m.position"/></label>
						<div class="col-sm-10">
							<div class="col-sm-3">
								<form:input path="position" class='form-control' data-rule-positivenum="true" data-rule-required="true" data-rule-minlength="1" data-rule-maxlength="3"/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customershoplevel.m.description"/></label>
						<div class="col-sm-10">
							<form:textarea path="description" class='form-control' rows="5"/>
						</div>
					</div>
						
					<div class="y_fixedbtn">
						<input type="button" class="btn btn-primary btn-large a_size_1 submit" value='<aebiz:showTitle titleId="basebusiness.showmessage.save"/>'>
						<button type="button" class="btn cancel btn-large a_size_1"><aebiz:showTitle titleId="basebusiness.showmessage.return"/></button>
					</div>
				</form:form>
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
		var levelNameError=$.trim($("input[name='levelNameHidden']").val());
		var maxIntegralError=$.trim($("input[name='maxIntegralHidden']").val());
		//var inteRateError=$.trim($("input[name='inteRateHidden']").val());
		
		//判断图片是否删除
		if($("#removebtn").is(":hidden")){
			bootbox.alert("请上传图标等级图片");
			return;
		}

		//if(levelNameError=="true" && maxIntegralError=="true" && inteRateError=="true"){
		if(levelNameError=="true" && maxIntegralError=="true"){
			$("#mainForm").submit();
		}
	});
	
	//验证等级名称是否重复
	$("input[name='levelName']").blur(function(){
		$("#levelNameSpan").remove();
		var levelName=$.trim($("input[name='levelName']").val());
		if(levelName!=""){
			var uuid=$("#uuid").val();
			var url="${pageContext.servletContext.contextPath}/sysback/customershoplevel/checkLevelName";
			$.getJSON(url,{levelName:levelName,uuid:uuid,ranNum:Math.random()},function(data){
				if(data){
					$("input[name='levelName']").after("<span id='levelNameSpan'><font color='red'><aebiz:showTitle titleId="customershoplevel.levelName.existed"/></font></span>");
					$("input[name='levelNameHidden']").val("false");
				}else{
					$("#levelNameSpan").remove();
					$("input[name='levelNameHidden']").val("true");
				}
			});
		}
	});
	
	//如果等级名称数据位空，就将错误提示信息清除
	$("input[name='levelName']").change(function(){
		if($.trim($("input[name='levelName']").val())==""){
			$("#levelNameSpan").remove();
		}
	});
	

	//验证积分范围有效性（结束值必须大于初始值，且区间不能重复）
	$("input[name='maxIntegral']").blur(function(){
		$("#maxIntegralSpan").remove(); 
		if($.trim($("input[name='minIntegral']").val())!=""&&$.trim($("input[name='maxIntegral']").val())!=""){
			var minIntegral=parseInt($.trim($("input[name='minIntegral']").val()));
    		var maxIntegral=parseInt($.trim($("input[name='maxIntegral']").val()));
			if(minIntegral>=maxIntegral){
				$("input[name='maxIntegral']").after("<span id='maxIntegralSpan'><font color='red'>请结束值大于起始值</font></span>");
				$("input[name='maxIntegralHidden']").val("false");
				return ;
			}else{
				$(this).nextAll("span").remove();
				$("input[name='maxIntegralHidden']").val("true");
			}
		}
		if($.trim($("input[name='maxIntegral']").val())!=""){ 
		   var uuid=$("#uuid").val();
		   var minIntegral=$.trim($("input[name='minIntegral']").val());
  		   var maxIntegral=$.trim($("input[name='maxIntegral']").val());
		   var url="${pageContext.servletContext.contextPath}/sysback/customershoplevel/checkIntegralFlag";
		   $.getJSON(url,{maxIntegral:maxIntegral,minIntegral:minIntegral,uuid:uuid,ranNum:Math.random()},function(data){
			 if(data){
				$("input[name='maxIntegral']").after("<span id='maxIntegralSpan'><font color='red'>与其他等级积分冲突，请修改！</font></span>");
				$("input[name='maxIntegralHidden']").val("false");
			 }else{
				$(this).nextAll("span").remove();
				$("input[name='maxIntegralHidden']").val("true");
			 }
		  });
		}
	});
	
	$("input[name='minIntegral']").blur(function(){
		$("#maxIntegralSpan").remove(); 
		if($.trim($("input[name='minIntegral']").val())!=""&&$.trim($("input[name='maxIntegral']").val())!=""){
			var minIntegral=parseInt($.trim($("input[name='minIntegral']").val()));
    		var maxIntegral=parseInt($.trim($("input[name='maxIntegral']").val()));
			if(minIntegral>=maxIntegral){
				$("input[name='maxIntegral']").after("<span id='maxIntegralSpan'><font color='red'>请结束值大于起始值</font></span>");
				$("input[name='maxIntegralHidden']").val("false");
				return false;
			}else{
				$(this).nextAll("span").remove();
				$("input[name='maxIntegralHidden']").val("true"); 
			}
		}
		if($.trim($("input[name='minIntegral']").val())!=""){ 
 		   var uuid=$("#uuid").val();
 		   var minIntegral=$.trim($("input[name='minIntegral']").val());
  		   var maxIntegral=$.trim($("input[name='maxIntegral']").val());
			   var url="${pageContext.servletContext.contextPath}/sysback/customershoplevel/checkIntegralFlag";
			   $.getJSON(url,{maxIntegral:maxIntegral,minIntegral:minIntegral,uuid:uuid,ranNum:Math.random()},function(data){
				 if(data){
					$("input[name='minIntegral']").after("<span id='maxIntegralSpan'><font color='red'>与其他等级积分冲突，请修改！</font></span>");
					$("input[name='minIntegralHidden']").val("false");
				 }else{
					$(this).nextAll("span").remove();
 				    $("input[name='minIntegralHidden']").val("true");
				 }
			  });
 		}
	});
	<%--
	//积分获取比需小于等于100
	$("input[name='inteRate']").blur(function(){
		$("#inteRateSpan").remove();
		var inteRate=parseInt($.trim($("input[name='inteRate']").val()));
		
		if(inteRate!=""){
			if(inteRate>100){
				$("input[name='inteRate']").after("<span id='inteRateSpan'><font color='red'>请输入小于等于100的非负整数</font></span>");
				$("input[name='inteRateHidden']").val("false");
			}else{
				$(this).nextAll("span").remove();
				$("input[name='inteRatelHidden']").val("true");
			}
		}
	});
	--%>
	$(".cancel").click(function(){
		history.go(-1) ;
	});
});
</script>
	
</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>