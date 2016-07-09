<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.aebiz.b2b2c.baseframework.servicelocator.ServiceLocator" %>
<%@page import="java.util.*" %>
<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/validation/jquery.validate.min.js"></script>
<!--头部-->
<div id="simplePlatRight">
</div>

<script>
	$("#simplePlatRight").load("${pageContext.servletContext.contextPath}/getSimplePlatRight?ranNum=" + Math.random());
</script>
