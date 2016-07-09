<%@ page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/import/AddImport.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/validation/jquery.validate.min.js"></script>
<!-- 美化单选、复选框样式 -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/storeback/css/plugins/icheck/all.css">
	<!-- 单选、复选框的美化js -->
	<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/icheck/jquery.icheck.min.js"></script>
	<!-- 单选复选框美化样式的调用js -->
	<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/aebiz/aebiz.checkbox.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/bootbox/jquery.bootbox.js"></script>
	<!-- CKEditor 富文本编辑器-->
	<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/ckeditor/ckeditor.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/aebiz/aebiz.validate.expand.js"></script>
		<!-- 调用validate表单验证的js -->
	<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/aebiz/aebiz.validate.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/storeback/js/ajaxfileupload.js"></script>
	
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/basebusiness/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/basebusiness/ueditor/ueditor.all.js"></script>

</head>

<body style="background:url(${pageContext.servletContext.contextPath}/static/storeback/img/welcome.jpg) center no-repeat">
	<!-- 头部 -->
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/storeHead.jsp"%>
	<div class="container-fluid" id="content">
	<!-- 左侧 -->
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/storeLeft.jsp"%>
	 
	</div>
</body>
</html>
