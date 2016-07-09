<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!doctype html>
<html>

<%@ include file="/WEB-INF/jsp/basebusiness/common/import/AddImport.jsp" %>
</head>

<body>
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1><aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/><aebiz:showTitle titleId="sysrole.moduleName_CN"/></h1>
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li>
					<span><aebiz:showTitle titleId="sysrole.menuOne"/></span>
					<i class="fa fa-angle-right"></i>
				</li>
				<li>
					<span><aebiz:showTitle titleId="sysrole.menuTwo"/></span>
					<i class="fa fa-angle-right"></i>
				</li>
				<li>
					<span><aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/><aebiz:showTitle titleId="sysrole.moduleName_CN"/></span>
				</li>
			</ul>
		</div>		
				
		<div class="box box-bordered bordered-top">
			<div class="box-content nopadding">																
				<form id="mainForm" action="${pageContext.servletContext.contextPath}/sysback/sysrole/add" method="post" class='form-horizontal form-bordered form-validate'>						
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="sysrole.m.id"/></label>
						<div class="col-sm-10">
							<input type="text" name="id"  value="${m.id}" class="form-control" data-rule-required="true" data-rule-minlength="5" data-rule-maxlength="20">
						</div>						
					</div>
				
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="sysrole.m.name"/></label>
						<div class="col-sm-10">
							<input type="text" name="name"  value="${m.name}" class="form-control" data-rule-required="true" data-rule-minlength="5" data-rule-maxlength="20">
						</div>
					</div>
					
					<div class="form-group">						
						<label for="textfield" class="control-label col-sm-2 "><aebiz:showTitle titleId="sysrole.m.deptName"/></label>
						<div class="col-sm-10">	
							<div class="col-sm-3">	
								<select name="deptUuid" class='select2-me form-control'>								
									<option value="">--<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>--</option>
									<c:forEach items="${sdList}" var="sdept">	
										<option value="${sdept.uuid}" <c:if test="${m.deptUuid==sdept.uuid}"> selected </c:if> >${sdept.departmentName}</option>
									</c:forEach>	
								</select>					
							</div>
						</div>	
					</div>
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="sysrole.m.description"/></label>
						<div class="col-sm-10">
							<input type="text" name="description" value="${m.description}" class="form-control" data-rule-maxlength="100">
						</div>
					</div>
					
					<div class="form-actions col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value='<aebiz:showTitle titleId="basebusiness.showmessage.add"/>'>
						<button type="button" class="btn cancel"><aebiz:showTitle titleId="basebusiness.showmessage.cancel"/></button>
					</div>						
				</form>
			</div>
		</div>
	</div>
	
	<script>
	  $(document).ready(function() {
			$(".cancel").click(function(){
				history.go(-1) ;
			});
	  });
	</script>
	
	<aebiz:showErrorMsg></aebiz:showErrorMsg>
</body>
</html>

