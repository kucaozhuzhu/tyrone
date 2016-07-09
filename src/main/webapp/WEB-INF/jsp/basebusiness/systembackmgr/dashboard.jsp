<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<!-- Apple devices fullscreen -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- Apple devices fullscreen -->
	<meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />

	<title>酷友商城-最先进的电商平台</title>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/bootstrap.min.css">
	<!-- jQuery UI -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/jquery-ui/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
	<!-- PageGuide -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/pageguide/pageguide.css">
	<!-- Fullcalendar -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/fullcalendar/fullcalendar.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/fullcalendar/fullcalendar.print.css" media="print">
	<!-- chosen -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/chosen/chosen.css">
	<!-- select2 -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/select2/select2.css">
	<!-- icheck -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/plugins/icheck/all.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/style.css">
	<!--[if lt IE 8]>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/font-awesome-ie7.min.css">
	<![endif]-->
	<!-- Color CSS -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/themes.css">
	<!-- aebiz CSS -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/aebiz-0.1.css">
	<!-- jQuery -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/jquery.min.js"></script>


	<!-- Nice Scroll -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<!-- jQuery UI -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/jquery-ui/jquery.ui.draggable.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/jquery-ui/jquery.ui.resizable.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/jquery-ui/jquery.ui.sortable.min.js"></script>
	<!-- Touch enable for jquery UI -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/touch-punch/jquery.touch-punch.min.js"></script>
	<!-- slimScroll -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/bootstrap.min.js"></script>
	<!-- vmap -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/vmap/jquery.vmap.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/vmap/jquery.vmap.world.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/vmap/jquery.vmap.sampledata.js"></script>
	<!-- Bootbox -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/bootbox/jquery.bootbox.js"></script>
	<!-- Flot -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/flot/jquery.flot.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/flot/jquery.flot.bar.order.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/flot/jquery.flot.resize.min.js"></script>
	<!-- imagesLoaded -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>
	<!-- PageGuide -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/pageguide/jquery.pageguide.js"></script>
	<!-- FullCalendar -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/fullcalendar/fullcalendar.min.js"></script>
	<!-- Chosen -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/chosen/chosen.jquery.min.js"></script>
	<!-- select2 -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/select2/select2.min.js"></script>
	<!-- icheck -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/icheck/jquery.icheck.min.js"></script>

	<!-- Theme framework -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/eakroko.min.js"></script>
	<!-- Theme scripts -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/application.min.js"></script>
	<!-- Just for demonstration -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/demonstration.min.js"></script>

	<!--[if lte IE 9]>
		<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/placeholder/jquery.placeholder.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input, textarea').placeholder();
			});
		</script>
		<![endif]-->
		
	<!--ie8及以下支持响应式的js-->
	<!--[if lte IE 8]>
    <script src="${pageContext.servletContext.contextPath}/static/sysback/js/respond.min.js"></script>
   
    <!--jquery.flot.js兼容IE8以下浏览器需引入excanvas.js-->
    <script src="${pageContext.servletContext.contextPath}/static/sysback/js/excanvas.js"></script>    
  <![endif]-->

	<!-- Favicon -->
	<link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/static/sysback/img/favicon.ico" />
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="${pageContext.servletContext.contextPath}/static/sysback/img/apple-touch-icon-precomposed.png" />
</head>

<body style="background:url(${pageContext.servletContext.contextPath}/static/sysback/img/welcome.jpg) center no-repeat">
	
	<!--头部导航#navigation-->
<div id="navigation" style="background:#204e81">
</div>

<!--头部导航#navigation end-->

<script>
	$("#navigation").load("${pageContext.servletContext.contextPath}/admin/toHeader");
</script>
</body>

</html>
