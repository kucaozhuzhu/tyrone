<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.aebiz.b2b2c.baseframework.servicelocator.ServiceLocator" %>
<%@page import="java.util.*" %>
<%@page import="com.aebiz.b2b2c.cms.channel.service.impl.ChannelInteractiveServiceImpl" %>
<%@page import="com.aebiz.b2b2c.cms.channel.vo.ChannelModel" %>
<%@page import="com.aebiz.b2b2c.decorateplatform.util.PlatDfHelper" %>
<%@page import="com.aebiz.b2b2c.baseframework.utils.LoginUserHelper" %>
<%@page import="com.aebiz.b2b2c.baseframework.utils.StringUtil" %>

<%
	ChannelInteractiveServiceImpl channelInteractive = (ChannelInteractiveServiceImpl)ServiceLocator.getInstance().getCtx().getBean("channelInteractiveServiceImpl");
	List<ChannelModel> channelList = channelInteractive.getChannelsByBelongType("1");
	boolean isDealer = true;
	if(StringUtil.isEmpty(LoginUserHelper.getDealerBcustomerUuid())){
		isDealer = false;
	}
%>

<ul class="m_nav_ul clearfix">
	<c:forEach items="<%=channelList%>" var="channel" varStatus="status">
		<c:choose>
			<c:when test="${status.index==0}"	 >
			<li class="active">	
			</c:when>
			<c:otherwise>
			<li>	
			</c:otherwise>
		</c:choose>
		<c:if test="${channel.type=='1'}">
			<a href="${pageContext.servletContext.contextPath}/toChannel/${channel.pageUuid}" title="${channel.channelName}">${fn:substring(channel.channelName,0,5)}</a></li>
		</c:if>
		<c:if test="${channel.type=='2'}">
			<a href="${channel.channelUrl}" title="${channel.channelName}">${fn:substring(channel.channelName,0,5)}</a></li>
		</c:if>
	</c:forEach>
	<%if(isDealer){ %>
		<li><a href="${pageContext.servletContext.contextPath}/dealer/purchasecenter/toList">采购中心</a></li>
	<%} %>
</ul>

<script>
	$("ul li a").each(function(){
		$this = $(this);  
    if($this[0].href==String(window.location)){  
      $this.parent().addClass("active").siblings().removeClass("active");  
    }  
	});	
</script>
