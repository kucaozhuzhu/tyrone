<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>                        
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>           
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
		<div class="modal-dialog" style="*width:580px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel2">编辑提醒</h4>
				</div>
				
				<div class="modal-body">
					<form class="form-horizontal">
						<input type="hidden" name="remindUuid" id="remindUuid" value="${customerRemind.uuid }">
						<div class="form-group">
							<label for="ticket-message" class="col-mi-2 control-label">提醒内容：</label>
							<div class="col-mi-10 r_marginleft">
								<textarea class="form-control" name="remindContent" id="remindContent" rows="2" cols="30" maxlength="50">${customerRemind.content }</textarea>
							</div>
						</div>
						
						<div class="form-group">
							<label for="ticket-message" class="col-mi-2 control-label">提醒日期：</label>
							<div class="col-mi-10 r_marginleft">
								<input type="hidden" name="remindDate" id="remindDate" value="${customerRemind.remindDate }">
								<p class="form-control-static">${customerRemind.remindDate }</p>
							</div>
						</div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" onclick="updateRemind();">提交</button>
				</div>
			</div>
		</div>