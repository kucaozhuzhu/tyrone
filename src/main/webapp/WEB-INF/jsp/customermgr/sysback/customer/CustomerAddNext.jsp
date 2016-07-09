<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!doctype html>
<html>

<%@ include file="/WEB-INF/jsp/basebusiness/common/import/UpdateImport.jsp" %>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/icheck/all.css">
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/icheck/jquery.icheck.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.checkbox.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.validate.expand.js"></script> 
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/datepicker/datepicker.css">
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.datepicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/fileupload/bootstrap-fileupload.min.js"></script>

</head>

<body>
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1><aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/><aebiz:showTitle titleId="customer.moduleName_CN"/></h1>
			</div>
		</div>
				
		<div class="breadcrumbs">
			<ul>
				<li><span><aebiz:showTitle titleId="customer.menuOne"/></span><i class="fa fa-angle-right"></i></li>
				<li><span><aebiz:showTitle titleId="customer.menuTwo"/></span><i class="fa fa-angle-right"></i></li>
				<li><span><aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/><aebiz:showTitle titleId="customer.moduleName_CN"/></span></li>
			</ul>
		</div>
		
		<ul class="tabs tabs-inline tabs-top border1-top">
			<li><a href="#accountInfo" data-toggle='tab'><aebiz:showTitle titleId="customerInfo.m.customerAccountInfo"/></a></li>
			<li class='active'><a href="#baseInfo" data-toggle='tab'><aebiz:showTitle titleId="customerinfo.moduleName_CN"/></a></li>
		</ul>
		
		<div class="tab-content y_tabdatable padding tab-content-inline tab-content-bottom">
			<div class="tab-pane" id="accountInfo">
				<div class="table table-bordered table-hover table-nomargin">
					<form:form id="accountInfoForm" action="${pageContext.servletContext.contextPath}/sysback/customercomb/updateAccountInfo" method="post" commandName="m" class='form-horizontal form-validate form-bordered'>
						<form:hidden path="customerModel.uuid"/>
						<form:hidden path="customerModel.password"/>
						<form:hidden path="customerModel.authState"/>
						<form:hidden path="customerModel.lastWrongLoginTime"/>
						<form:hidden path="customerModel.activeCode"/>
						<form:hidden path="customerModel.loginErrorTimes"/>
						<form:hidden path="customerModel.createTime"/>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customer.m.customerName"/></label>
							<div class="col-sm-10">
								<div class="col-sm-3">
									<form:input path="customerModel.customerName" class='form-control' readonly="true"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customer.m.mobile" /></label>
							<div class="col-sm-10">
								<div class="col-sm-3">
									<form:input path="customerModel.mobile" class='form-control' readonly="true"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customer.m.email"/></label>
							<div class="col-sm-10">
								<div class="col-sm-3">
									<form:input path="customerModel.email" class='form-control' readonly="true"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customer.m.customerShopLevel"/></label>
							<div class="col-sm-10">
								<div class="col-sm-3">
									<form:input path="customerModel.customerLevel" class='form-control' readonly="true"/>
								</div>
							</div>
						</div>
						
						<!-- 
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customer.m.customerShopLevel"/></label>
							<div class="col-sm-10">
								<div class="col-sm-3">
									<form:select path="customerModel.customerShopLevelUuid" class='select2-me form-control' data-rule-required="true">								
										<form:option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</form:option>
										<c:forEach items="${levelList}" var="level">
											<form:option value="${level.uuid}">${level.levelName}</form:option>
										</c:forEach>										
									</form:select>	
								</div>
							</div>
						</div>
						 -->
						
						<div class="form-actions col-sm-offset-2 col-sm-10">
							<!-- <input type="submit" class="btn btn-primary submit" value='<aebiz:showTitle titleId="basebusiness.showmessage.save"/>'> -->
							<a class="btn" href="${pageContext.servletContext.contextPath}/sysback/customercomb/toList"><aebiz:showTitle titleId="basebusiness.showmessage.return"/></a>
						</div>
					</form:form>
				</div>
			</div>
		
			<div class="tab-pane active" id="baseInfo">
				<div class="table table-bordered table-hover table-nomargin">
					<form:form id="baseInfoForm" action="${pageContext.servletContext.contextPath}/sysback/customercomb/updateBaseInfo" method="post" commandName="m" class='form-horizontal form-validate form-bordered' enctype="multipart/form-data">							
						<form:hidden path="customerInfoModel.uuid"/>
						<form:hidden path="customerInfoModel.zipCode"/>
						<form:hidden path="customerInfoModel.certCode"/>
						<form:hidden path="customerInfoModel.certType"/>
						<form:hidden path="customerInfoModel.realName"/>
						<form:hidden path="customerInfoModel.image"/>
						<form:hidden path="customerInfoModel.customerUuid"/>
						<input type="hidden" name="customerInfoModel.province">
						<input type="hidden" name="customerInfoModel.city">
						<input type="hidden" name="customerInfoModel.region">
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customerinfo.m.nickName"/></label>
							<div class="col-sm-10">
								<div class="col-sm-3">
									<form:input path="customerInfoModel.nickName" class='form-control' data-rule-maxlength="10"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customerinfo.m.image"/></label>
							<div class="col-sm-10">
								<div class="fileinput <c:choose><c:when test="${empty m.customerInfoModel.image}">fileinput-new </c:when><c:otherwise>fileinput-exists</c:otherwise></c:choose>" data-provides="fileinput">
									<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 150px; height: 150px;">
										<c:if test="${!empty m.customerInfoModel.image}"><img src="${m.customerInfoModel.imgUrl}" /></c:if>
									</div>
									<div>
										<span class="btn btn-default btn-file">
											<span class="fileinput-new"><aebiz:showTitle titleId="customerinfo.m.choose"/></span>
											<span class="fileinput-exists"><aebiz:showTitle titleId="customerinfo.m.change"/></span>
											<input type="file" name="imgFile"/>
										</span>
										<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">
											<aebiz:showTitle titleId="customerinfo.m.remove"/>
										</a>
									</div>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customerinfo.m.sex"/></label>
							<div class="col-sm-10">
								<div class="col-sm-1">
									<div class="check-line">
										<form:radiobutton path="customerInfoModel.sex" id="c5" value="1" class="icheck-me" data-skin="square" data-color="blue"/>
										<label class='inline' for="c5"><aebiz:showTitle titleId="customer.m.male" /></label>
									</div>
								</div>
								
								<div class="col-sm-1">
									<div class="check-line">
										<form:radiobutton path="customerInfoModel.sex" id="c6" value="2" class="icheck-me" data-skin="square" data-color="blue"/>
										<label class='inline' for="c6"><aebiz:showTitle titleId="customer.m.female"/></label>
									</div>
								</div>
								
								<div class="col-sm-1">
									<div class="check-line">
										<form:radiobutton path="customerInfoModel.sex" id="c7" value="3" class="icheck-me"  data-skin="square" data-color="blue"/>
										<label class='inline' for="c7"><aebiz:showTitle titleId="customer.m.secret"/></label>
									</div>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customerinfo.m.marryState"/></label>
							<div class="col-sm-10">
								<div class="col-sm-1">
									<div class="check-line">
										<form:radiobutton path="customerInfoModel.marryState" id="c8" value="1" class="icheck-me" data-skin="square" data-color="blue"/>
										<label class='inline' for="c8"><aebiz:showTitle titleId="customer.m.married" /></label>
									</div>
								</div>
								
								<div class="col-sm-1">
									<div class="check-line">
										<form:radiobutton path="customerInfoModel.marryState" id="c9" value="2" class="icheck-me" data-skin="square" data-color="blue"/>
										<label class='inline' for="c9"><aebiz:showTitle titleId="customer.m.unmarried" /></label>
									</div>
								</div>
								
								<div class="col-sm-1">
									<div class="check-line">
										<form:radiobutton path="customerInfoModel.marryState" id="c10" value="3" class="icheck-me"  data-skin="square" data-color="blue"/>
										<label class='inline' for="c10"><aebiz:showTitle titleId="customer.m.secret" /></label>
									</div>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customerinfo.m.birthday"/></label>
							<div class="col-sm-10">
								<div class="col-sm-3">
									<form:input path="customerInfoModel.birthday" class='form-control datepick'/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customerinfo.m.hobby"/></label>
							<div class="col-sm-10">
								<div class="col-sm-4">
									<input type="hidden" name="customerInfoModel.hobby">
									<c:forEach items="${tagModelList}" var="tag">
										<span class="y_item" id ="${tag.uuid}">
											<a href="javascript:void(0);" onclick="addTag(this);">${tag.tagName}</a>
											<s></s>
										</span>
									</c:forEach>	
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customerinfo.m.area"/></label>
							<div class="col-sm-10">
								<div class="col-sm-6">
									<aebiz:area checkProvince="${m.customerInfoModel.province}" checkCity="${m.customerInfoModel.city}" checkRegion="${m.customerInfoModel.region}"></aebiz:area>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2 "><aebiz:showTitle titleId="customerinfo.m.address"/></label>
							<div class="col-sm-10">
								<div class="col-sm-3">
									<form:textarea path="customerInfoModel.address" class='form-control' data-rule-maxlength="200"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2   "><aebiz:showTitle titleId="customerinfo.m.income"/></label>
							<div class="col-sm-10">
								<div class="col-sm-3">
									<form:select path="customerInfoModel.income" class='select2-me form-control'>								
										<form:option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</form:option>
										<c:forEach items="${incomeList}" var="dpp">	
											<form:option value="${dpp.name}">${dpp.value}</form:option>
										</c:forEach>										
									</form:select>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customerinfo.m.education"/></label>
							<div class="col-sm-10">
								<div class="col-sm-3">
									<form:select path="customerInfoModel.education" class='select2-me form-control'>								
										<form:option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</form:option>
										<c:forEach items="${educationList}" var="dpp">	
											<form:option value="${dpp.name}">${dpp.value}</form:option>
										</c:forEach>										
									</form:select>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="textfield" class="control-label col-sm-2  "><aebiz:showTitle titleId="customerinfo.m.industry"/></label>
							<div class="col-sm-10">
								<div class="col-sm-3">
									<form:select path="customerInfoModel.industry" class='select2-me form-control'>								
										<form:option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</form:option>
										<c:forEach items="${industryList}" var="dpp">	
											<form:option value="${dpp.name}">${dpp.value}</form:option>
										</c:forEach>										
									</form:select>
								</div>
							</div>
						</div>
						
						<div class="form-actions col-sm-offset-2 col-sm-10">
							<input type="button" class="btn btn-primary submit" value='<aebiz:showTitle titleId="basebusiness.showmessage.save"/>'>
							<a class="btn" href="${pageContext.servletContext.contextPath}/sysback/customercomb/toList"><aebiz:showTitle titleId="basebusiness.showmessage.return"/></a>
						</div>
					</form:form>
				</div>
			</div>
		</div>	
	</div>
	
<script type="text/javascript">
function addTag(o){
	$(o).parent().toggleClass("active");
}

$(function(){
	var tagStr = "${m.customerInfoModel.hobby}";
	var tagArr = tagStr.split(",");
	
	$(".y_item").each(function(){
		var tagUuid = $.trim($(this).attr("id"));
		for(var i = 0 ; i < tagArr.length ; i++){
			var myTag = $.trim(tagArr[i]);
			if(tagUuid == myTag){
				$(this).addClass("active");
			}
		}
	});

	$("#baseInfoForm").find(".submit").click(function(){
		var province =$("select[name='province']").val();
		var city = $("select[name='city']").val();
		var region = $("select[name='region']").val();
			
	    $("[name='customerInfoModel.province']:hidden").val(province);
	    $("[name='customerInfoModel.city']:hidden").val(city);
	    $("[name='customerInfoModel.region']:hidden").val(region);

	    var tags = "";
		$(".y_item").each(function(){
			if($(this).is(".active")){
				tags += $(this).attr("id") + ",";
			}
		});
		$("input[name='customerInfoModel.hobby']:hidden").val(tags);
	    
	   	$("#baseInfoForm").submit();
	});
});
	

</script>	
	
</body>
</html>
<aebiz:showErrorMsg></aebiz:showErrorMsg>