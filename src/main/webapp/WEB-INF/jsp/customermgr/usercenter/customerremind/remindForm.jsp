<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>                        
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>           
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
		<div class="modal-dialog" style="*width:580px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel2">新增提醒</h4>
				</div>
				
				<div class="modal-body">
					<form class="form-horizontal">
					    <%--
						<div class="form-group">
							<label for="ticket-attachment" class="col-mi-2 control-label">提醒图片：</label>
							<div class="col-mi-10" style="padding-right:0">
								<div class="y_notisfpc">
									<ul>
										<li><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_txad2.gif"><span><i class="fa fa-check-circle"></i></span></li>
										<li><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_txad1.gif"><span><i class="fa fa-check-circle"></i></span></li>
										<li><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_txad2.gif"><span><i class="fa fa-check-circle"></i></span></li>
										<li><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_txad1.gif"><span><i class="fa fa-check-circle"></i></span></li>
										<li><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_txad2.gif"><span><i class="fa fa-check-circle"></i></span></li>
										<li><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_txad1.gif"><span><i class="fa fa-check-circle"></i></span></li>
										<li><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_txad2.gif"><span><i class="fa fa-check-circle"></i></span></li>
										<li><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_txad1.gif"><span><i class="fa fa-check-circle"></i></span></li>
										<li><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_txad2.gif"><span><i class="fa fa-check-circle"></i></span></li>
										<li><img src="${pageContext.request.contextPath }/static/usercenter/img/aebiz/y_txad1.gif"><span><i class="fa fa-check-circle"></i></span></li>
									</ul>
								</div>
							</div>
						</div>
						 --%>
						<div class="form-group">
							<label for="ticket-message" class="col-mi-2 control-label">提醒内容：</label>
							<div class="col-mi-10 r_marginleft">
								<textarea class="form-control" name="remindContent" id="remindContent" rows="2" cols="30" maxlength="50"></textarea>
							</div>
						</div>
						
						<div class="form-group">
							<label for="ticket-message" class="col-mi-2 control-label">提醒日期：</label>
							<div class="col-mi-10 r_marginleft">
								<input type="hidden" name="remindDate" id="remindDate" value="${date }">
								<p class="form-control-static">${date }</p>
							</div>
						</div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" onclick="saveRemind();">提交</button>
				</div>
			</div>
		</div>