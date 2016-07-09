<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<!doctype html>
<html>
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/import/SuccessImport.jsp" %>	
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/storeback/css/plugins/icheck/all.css">


</head>

<body>
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/storeHead.jsp"%>
	<div class="container-fluid" id="content">
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/storeLeft.jsp"%>
		<div id="main">
			<div class="container-fluid">
				<div class="page-header">
					<div class="pull-left">
						<h1><aebiz:showTitle titleId="customerstorelevel.moduleName_CN"/><aebiz:showTitle titleId="basebusiness.showmessage.manager"/></h1>
					</div>
				</div>
				
				<div class="breadcrumbs">
					<ul>
						<li>
							<span><aebiz:showTitle titleId="customerstorelevel.menuOne"/></span>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<span><aebiz:showTitle titleId="customerstorelevel.menuTwo"/></span>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<span><aebiz:showTitle titleId="basebusiness.showmessage.opeOkTitle"/></span>
						</li>
					</ul>					
				</div>
				
				<div class="y_masuccess">
					<span class="y_succpic text-success"><i class="glyphicon-ok"></i></span>
					<div class="y_succms">
						<h2 class="text-success">
							<aebiz:showTitle titleId="basebusiness.showmessage.opeOkTitle"/>
						</h2>
							
						<p class="y_successtext">
							<a class="btn btn-primary" href="javascript:void(0);"><aebiz:showTitle titleId="basebusiness.showmessage.opeOk"/></a>  <a class="btn btn-danger" href="${pageContext.servletContext.contextPath}/storeback/customerstorelevel/toList"><aebiz:showTitle titleId="basebusiness.showmessage.return"/></a>
						</p>	
					</div>
				</div>
			</div>
		</div>
	</div>

	
</body>

</html>