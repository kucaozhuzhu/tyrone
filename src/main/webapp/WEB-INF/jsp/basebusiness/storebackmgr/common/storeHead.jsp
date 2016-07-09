<!--头部导航#navigation-->
<%@page import="java.util.Date"%>
<div id="top">
</div>
<!--头部导航#navigation end-->
<script>
$(function(){
	$.get("${pageContext.servletContext.contextPath}/store/getHead",
			{ranNum : Math.random()},
			function(data) {
				$("#top").html(data);
			});
});
</script>