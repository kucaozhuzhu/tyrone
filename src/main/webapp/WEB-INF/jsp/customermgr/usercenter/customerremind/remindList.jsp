<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>                        
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>           
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<div class="" id="tabtime3">
	<ul class="y_itxlit">
		<c:if test="${remindList!=null && fn:length(remindList)>0 }">
		<c:forEach items="${remindList}" var="remind" begin="0" end="2">
		<li>
		  <div class="y_pic"><a href="javascript:void(0);"><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_txad1.gif"></a></div>
		  <p class="y_ms">${remind.content }</p>
		  <strong>
		  		<a href="javascript:editRemind('${remind.uuid }');"><i class="fa fa-pencil-square-o"></i></a>
		  		<a href="javascript:cancelRemind('${remind.uuid }','${date }');"><i class="fa fa-times"></i></a>
		  </strong>		  
		</li>
		</c:forEach>
		</c:if>
		<li>
		  <input type="hidden" id="addDate" value="${date }">
		  <a class="y_tjtx" data-toggle="modal" href="javascript:addRemind();"><span>+</span>新增提醒</a>
		</li>
	</ul>
</div>