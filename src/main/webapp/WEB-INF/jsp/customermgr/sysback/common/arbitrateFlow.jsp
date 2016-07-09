<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<c:if test="${mainModel.ucenterButton.arbitrateing}" >
	<div class="y_orderdtep w_setpbor y_orderdtep2">
</c:if>					
<c:if test="${mainModel.ucenterButton.arbitrateComplete}" >
	<div class="y_orderdtep w_setpbor y_orderdtep3">
</c:if>
	<ol class="y_orstepms w_orstepms">
		<li class="y_stms1">
			<div><i class="fa fa-circle"></i><span>1</span></div>
			<p>申请客服介入</p>
		</li>
		<li class="y_stms2">
			<div><i class="fa fa-circle"></i><span>2</span></div>
			<p>等待平台仲裁</p>
			<s></s>
		</li>
		<li class="y_stms3">
			<div><i class="fa fa-circle"></i><span>3</span></div>
			<p>平台仲裁完成</p>
			<s></s>
		</li>
	</ol>
</div>