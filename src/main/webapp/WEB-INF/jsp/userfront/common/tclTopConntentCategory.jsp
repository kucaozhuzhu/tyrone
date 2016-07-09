<%@page import="com.aebiz.b2b2c.baseframework.utils.StringUtil"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>           
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String categoryNo = request.getParameter("categoryNo");
	if(StringUtil.isEmpty(categoryNo)){
		categoryNo = (String)request.getAttribute("categoryNo");
	}
%>
<script>
$(document).ready(function(){
	var contentUUid = "${m.uuid}";
	var contentCategoryNo = "<%=categoryNo%>";
	var url = "${pageContext.servletContext.contextPath}/tclchannel/toContentlist";
	$.post(url,{"categoryNo":contentCategoryNo,random:Math.random()},function(date){
		var contentlist = date.rep;
		var ulstr = "";
		var classType = "";
		for(var i=0;i<contentlist.length;i++){
			if(contentlist[i].contentType=="2"){//链接类型
				if(contentUUid==""){
					if(i==0){
						ulstr = ulstr+"<li class=\"active\"><a href='"+contentlist[i].url+"'>"+contentlist[i].contentTitle+"</a></li>";
					}else{
						ulstr = ulstr+"<li><a href='"+contentlist[i].url+"'>"+contentlist[i].contentTitle+"</a></li>";
					}
				}else{
					if(contentUUid==contentlist[i].uuid){
						ulstr = ulstr+"<li class=\"active\"><a href='"+contentlist[i].url+"'>"+contentlist[i].contentTitle+"</a></li>";
					}else{
						ulstr = ulstr+"<li><a href='"+contentlist[i].url+"'>"+contentlist[i].contentTitle+"</a></li>";
					}
				}
			}else if(contentlist[i].contentType=="1"){//文本类型
				if(contentUUid==""){
					if(i==0){
						ulstr = ulstr+"<li class=\"active\"><a href='${pageContext.servletContext.contextPath}/tclchannel/toStoreProduct/"+contentlist[i].uuid+"/"+contentCategoryNo+"'>"+contentlist[i].contentTitle+"</a></li>";
					}else{
						ulstr = ulstr+"<li><a href='${pageContext.servletContext.contextPath}/tclchannel/toStoreProduct/"+contentlist[i].uuid+"/"+contentCategoryNo+"'>"+contentlist[i].contentTitle+"</a></li>";
					}
				}else{
					if(contentUUid==contentlist[i].uuid){
						ulstr = ulstr+"<li class=\"active\"><a href='${pageContext.servletContext.contextPath}/tclchannel/toStoreProduct/"+contentlist[i].uuid+"/"+contentCategoryNo+"'>"+contentlist[i].contentTitle+"</a></li>";
					}else{
						ulstr = ulstr+"<li><a href='${pageContext.servletContext.contextPath}/tclchannel/toStoreProduct/"+contentlist[i].uuid+"/"+contentCategoryNo+"'>"+contentlist[i].contentTitle+"</a></li>";
					}
				}
			}
		}
		$("#contentStr").html(ulstr);
	},"json");
});
</script>

<article class="m_contrast r_contrast">
<ul class="container clearfix" id="contentStr">
</ul>
</article>
