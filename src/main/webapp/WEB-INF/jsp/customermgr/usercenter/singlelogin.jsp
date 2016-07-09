<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
 <!--- jQuery -->
  <script src="${pageContext.request.contextPath }/static/frontpage/js/jquery-1.11.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/static/frontpage/js/validation/aebiz.passwdcheck.js"></script>
<script>
$(document).ready(function(){ 
	　 window.location.href='${goSingleLogin}'; 
	}); 
</script>
