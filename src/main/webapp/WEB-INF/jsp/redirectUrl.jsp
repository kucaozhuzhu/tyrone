<%@ page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/jquery-1.11.1.min.js"></script>
<script>
$(function(){
	var url = '${accountLoginUrl}';
	alert(url)
	window.location.href=url;
});
</script>
</head>
<body>
</body>
</html>