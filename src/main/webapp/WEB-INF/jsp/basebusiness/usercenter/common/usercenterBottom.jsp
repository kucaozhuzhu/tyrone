<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="aebizs" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.aebiz.b2b2c.baseframework.servicelocator.ServiceLocator" %>
<%@page import="java.util.*" %>
<%@page import="com.aebiz.b2b2c.cms.contentcategory.service.impl.ContentCategoryInteractiveImpl" %>
<%@page import="com.aebiz.b2b2c.cms.contentcategory.vo.ContentCategoryModel" %>
<%@page import="com.aebiz.b2b2c.cms.content.vo.ContentModel" %>


<%
	ContentCategoryInteractiveImpl contentCategoryInteractive = (ContentCategoryInteractiveImpl)ServiceLocator.getInstance().getCtx().getBean("contentCategoryInteractiveImpl");
	List<Map.Entry<ContentCategoryModel, List<ContentModel>>> map =  contentCategoryInteractive.getContentCategoryByUuid("1",ContentCategoryModel.STATE_SHOW);
%>
 
 

<!--底部通栏广告-->
<div class="layout layout_auto">
	<div class="m_foottlad">
		<div class="container">
			<img src="${pageContext.servletContext.contextPath}/static/frontpage/img/adimg/m_foottlad.jpg">
		</div>
	</div>
</div>
<!---底部通栏广告 end-->
 

 <!--平台底部帮助中心组件-->
<div class="layout layout_auto">
	<div class="DragContainer">
		<div class="DragBox">
			<!--底部帮助中心-->
			<div class="footer">
			  <div class="container clearfix">
			  	<div class="y_fotcont">
			  	<c:forEach items="<%=map%>" var="cc">
			      <dl>
			        <dt>${cc.key.categoryName}</dt>
			        <c:if test="${!empty cc.value}"> 
						<c:forEach items="${cc.value}" var="content">
							<dd><a href="${pageContext.servletContext.contextPath}/frontshow/content/help/1/${content.uuid}">${content.contentTitle}</a></dd>
						</c:forEach>
				  	</c:if>
			      </dl>
			      </c:forEach>
			    </div>
				 <div class="y_fotcontact">
		    	<dl class="phone">
		    		<dt></dt>
		    		<dd>
		    			<p>客服中心热线：</p>
		    			<strong>4009-888-888</strong>	
		    		</dd>	
		    	</dl>
		    	<dl class="email">
		    		<dt></dt>
		    		<dd>
		    			<p>客服中心邮箱：</p>
		    			<strong>kuyou@163.com</strong>	
		    		</dd>	
		    	</dl>	
		    </div>
			  </div><!-- End .container -->
			</div><!--底部帮助中心-->
		</div>	
	</div>
</div><!--平台底部帮助中心组件 end-->

<script>
		//去掉第一个li的间距
	   $('.footer .y_fotcont dl:nth-child(1)').addClass('first');
</script>

<!--底部商城资讯-->
<div class="footer-bottom">
  <div class="container">
    <p><aebizs:platConfig codeName='bottomInfo'/></p>
  </div><!-- End .container -->
</div><!--底部商城资讯 end-->