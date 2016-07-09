<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!doctype html>
<html>

<%@ include file="/WEB-INF/jsp/basebusiness/common/import/AddImport.jsp" %>

<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/icheck/all.css">
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/icheck/jquery.icheck.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.checkbox.js"></script>  
<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz.passwdcheck.js"></script>  
</head>

<body>
	
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1><aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/><aebiz:showTitle titleId="sysmanager.moduleName_CN"/></h1>
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li>
					<span><aebiz:showTitle titleId="sysmanager.menuOne"/></span>
					<i class="fa fa-angle-right"></i>
				</li>
				<li>
					<span><aebiz:showTitle titleId="sysmanager.menuTwo"/></span>
					<i class="fa fa-angle-right"></i>
				</li>
				<li>
					<span><aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/><aebiz:showTitle titleId="sysmanager.moduleName_CN"/></span>
				</li>
			</ul>
		</div>		
				
		<div class="box box-bordered bordered-top">
			<div class="box-content nopadding">																
				<form id="mainForm" action="${pageContext.servletContext.contextPath}/sysback/sysmanager/add" method="post" class='form-horizontal form-bordered'>						
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="sysmanager.m.id"/></label>
						<div class="col-sm-10">
						<input type="text" name="id" class="form-control checkId" value="${m.id}" data-rule-required="true" 
							 data-rule-minlength="5" data-rule-maxlength="20">
						</div>
					</div>
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="sysmanager.m.name"/></label>
						<div class="col-sm-10">
						<input type="text" name="name" class="form-control" value="${m.name}" data-rule-required="true" data-rule-minlength="2" data-rule-maxlength="20">
						</div>
					</div>
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="sysmanager.m.pwd"/></label>
						<div class="col-sm-10">
							<div class="col-sm-3">
								<input type="password" id="pwd" name="pwd" class="form-control" data-rule-required="true" data-rule-minlength="6" data-rule-maxlength="20" onchange="javascript:EvalPwd(this.value);" onkeyup="javascript:EvalPwd(this.value);">
							</div>

							<div  id="pwdpower" class="paddword_leve paddword_leve_3"> 
								<span id="pweak" style=""><aebiz:showTitle titleId="system.m.pweak"/></span>
								<span id="pmedium" style=""><aebiz:showTitle titleId="system.m.pmedium"/></span>
								<span id="pstrong" style=""><aebiz:showTitle titleId="system.m.pstrong"/></span>
							</div> 
							
						</div>
					</div>
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="sysmanager.m.confirmpwd"/></label>
						<div class="col-sm-10">
								<div class="col-sm-3">
									<input type="password" id="confirmPwd" name="confirmPwd" class="form-control" >
								</div>	
						</div>
					</div>
										
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="sysmanager.m.departmentUuid"/></label>
						<div class="col-sm-10">							
							<div class="col-sm-3">		
								<select name="departmentUuid" id="parentMenuUuid1" class='select2-me form-control' data-rule-required="true" >										
									<option value="">--<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>--</option>
									<c:forEach items="${returnDept}" var="sdept">
										<option value="${sdept.uuid}" <c:if test="${m.departmentUuid==sdept.uuid}"> selected </c:if> >${sdept.departmentName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="sysmanager.m.mobile"/></label>
						<div class="col-sm-10">
						<input type="text" name="mobile" class="form-control" value="${m.mobile}" data-rule-maxlength="11" data-rule-minlength="11" data-rule-number="true">
						</div>
					</div>
					
					<div class="form-group">
						<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="sysmanager.m.state"/></label>
						<div class="col-sm-10">
							<div class="check-line col-xs-4 col-sm-1">
								<input type="radio" name="state" id="sjshjs1" value="1" checked class='icheck-me' data-skin="square" data-color="blue"><label class="inline" for="sjshjs1"><aebiz:showTitle titleId="basebusiness.showmessage.yes"/></label>
							</div>
							<div class="check-line col-xs-4 col-sm-1">
								<input type="radio" name="state" id="sjshjs2" value="0" class='icheck-me' data-skin="square" data-color="blue"><label class="inline" for="sjshjs2"><aebiz:showTitle titleId="basebusiness.showmessage.no"/></label>
							</div>
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
</body>

</html>
<script src="${pageContext.servletContext.contextPath}/static/js/md5.js"></script>
<script>
	
    $(document).ready(function() {
			$(".cancel").click(function(){
				history.go(-1) ;
			});		
			
			jQuery.validator.addMethod("checkId", function(value, element) { 
					//alert("YY");
		  		//每次都把span的内容清空
		  			//var loginId = /^[0-9]{5,10}$/;
		  			var reg = /[~#￥、^$@%&!*]/gi;
		  			var loginId1 = /[\u4E00-\u9FA5]{2,7}/g;
					var id = "";
					id = $("input[name='id']").val();
					//alert((loginId1.test(id)));
					return  !(loginId1.test(id)) && !reg.test(id) ; 
		  	}, "登录名不能输入中文和特殊字符!");
			
			
			$("#mainForm").validate({
			 	errorElement: 'span',  //输入错误时的提示标签
				errorClass: 'help-block has-error',  //输入错误时的提示标签类名
				errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
			         element.after(error);
				},
			 	highlight: function(label) {   //输入错误时执行的事件
			        $(label).closest('.form-group').removeClass('has-error has-success').addClass('has-error');
			    },
		        submitHandler:function(form){
					$("#pwd").val(hex_md5($("#pwd").val()));
					$("#confirmPwd").val(hex_md5($("#confirmPwd").val()));
		            form.submit();
		        }    
		    });
    });
</script>

<aebiz:showErrorMsg></aebiz:showErrorMsg>