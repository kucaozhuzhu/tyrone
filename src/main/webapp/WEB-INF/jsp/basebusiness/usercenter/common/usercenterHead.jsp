<%@page import="com.aebiz.b2b2c.decorateplatform.util.PlatDfHelper" %>
<script src="${pageContext.request.contextPath }/static/usercenter/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/static/frontpage/js/aebiz_global-0.1.js"></script>
	 <%@ include file="/WEB-INF/jsp/userfront/common/platTop.jsp" %>
	  <%=PlatDfHelper.getHTMLPage("t002", "p001",0,2, request) %>
 <script>
  //分类树隐藏
  $(".y_inproduall").removeClass("y_inproduall").addClass("y_produall");	
 </script>