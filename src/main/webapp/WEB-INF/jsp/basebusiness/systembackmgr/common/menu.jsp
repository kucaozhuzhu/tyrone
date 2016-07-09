<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title>FLAT - Dynamic tables</title>

	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/themes.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/aebiz-menu-0.1.css">
	
	<!--[if lt IE 8]>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/sysback/css/font-awesome-ie7.min.css">
	<![endif]-->
	
	<!-- jQuery 库 -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/jquery.min.js"></script>
	<!-- Bootstrap 框架的js-->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/bootstrap.min.js"></script>
	
	<!-- Nice Scroll 页面左侧边栏使用美化滚动条插件 -->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	
	<!-- jQuery UI 这5个jquery.ui插件，左侧模块可拖拽、美化滚动条-->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/jquery-ui/jquery.ui.sortable.min.js"></script>	
	
	<!-- 左侧菜单的公共css-->
	<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/aebiz/aebiz_menu-0.1.js"></script>
	
	<!--[if lte IE 9]>
		<script src="${pageContext.servletContext.contextPath}/static/sysback/js/plugins/placeholder/jquery.placeholder.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input, textarea').placeholder();
			});
		</script>
	<![endif]-->
	
	<!--[if lt IE 9]>
    <script src="${pageContext.servletContext.contextPath}/static/sysback/js/respond.min.js"></script>
  <![endif]-->
</head>


<body class="left_body theme-darkblue">
	<!--左侧边栏#left-->
	<div id="left-box">
		
		<!--
		<form action="search-results.html" method="GET" class='search-form'>
			<div class="search-pane">
				<input type="text" name="search" placeholder="Search here...">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</form>	
		-->
		<div class="search-pane">
			&nbsp;&nbsp;
		</div>	
		
		<c:forEach items="${Menu_One}" var="smmOne">	
			<div class="subnav">
				<div class="subnav-title">
					<a herf="#" class='toggle-subnav'>
						<i class="fa fa-angle-down"></i>
						<span>${smmOne.name}</span>
					</a>
				</div>
						
				<c:forEach items="${Menu_OneTwo[smmOne]}" var="smmTwo">
					<ul class="subnav-menu">	
						<c:choose> 
						  <c:when test="${Menu_TwoThree[smmTwo] == null}">   
								<li>
									<a target="mainFrame" href="${pageContext.request.contextPath}/${smmTwo.toUrl}">${smmTwo.name}</a>
								</li>
						  </c:when> 
						  
						  <c:otherwise>   
						    <li class="dropdown">
									<a href="#" data-toggle="dropdown">${smmTwo.name}</a>
									<ul class="dropdown-menu">
										<c:forEach items="${Menu_TwoThree[smmTwo]}" var="smmThree">
											<li>
												<a target="mainFrame" href="${pageContext.request.contextPath}/${smmThree.toUrl}">${smmThree.name}</a>
											</li>
										</c:forEach>
									</ul>
								</li>
						  </c:otherwise> 
						</c:choose>
					</ul>
				</c:forEach>	
			</div>	
		</c:forEach>
		
		<!--
			<div class="subnav">
				<div class="subnav-title">
					<a href="#" class='toggle-subnav'>
						<i class="fa fa-angle-down"></i>
						<span>二级菜单</span>
					</a>
				</div>
				<ul class="subnav-menu">
					<li class="dropdown">
						<a href="#" data-toggle="dropdown">点击右侧出现二级菜单</a>
						<ul class="dropdown-menu">
							<li><a href="#">二级菜单1</a></li>
							<li><a href="#">二级菜单2</a></li>
							<li><a href="#">二级菜单3</a></li>
							<li><a href="#">二级菜单4</a></li>
						</ul>
					</li>
				</ul>
			</div>
		-->	
	</div>			
</body>

</html>
