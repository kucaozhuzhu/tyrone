<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>                        
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath }/static/dealer/js/base64.js"></script>
<!-- 登录弹出框 -->
<div class="modal fade y_suslogin" id="modal-login-form" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 标题 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">您尚未登录</h4>
				</div>
				<!-- 中间结构 -->
				<div class="modal-body">
					<p id="isfastbuy" name="" ></p>
					<div id="center">
						<form id="domainForm" action="" method="get" class='form-validate3' >
							<input type="hidden" id="hasVilidateCode" name="hasVilidateCode" value="${hasVilidateCode }">
							<div class="y_suslgbx">
								<div class="form-group">
									<label class="control-label" for="sususername">用户名</label>
									<input type="text" required class="form-control" id="loginName" name="loginName" value="${loginName }">
								</div>
								<div class="form-group">
									<label class="control-label" for="sususerpasd"><aebiz:showTitle titleId="customer.login.password" /></label>
									<input type="password" required class="form-control" id="pwd" name="pwd" value="${pwd }">
								</div>
								
								<div id="more" style="display:none;">
									<div class="form-group">
										<div class="alert alert-danger" id="error_more_msg">${More_Error_Msg } <a class="f_color" href="${pageContext.servletContext.contextPath}/customerfindpwd/toFindPwdStep1"><aebiz:showTitle titleId="customer.login.getpassword" /></a></div>
									</div>
								</div>
									
								<c:if test="${hasVilidateCode == 'true'  }">
									<div class="form-group y_yzmgrop">
											<label class="control-label" for="validateCode" ><aebiz:showTitle titleId="customer.findpwd1.randomCode" /></label>
											<div class="clearfix">
												<input type="text" class="form-control" id="validateCode" name="validateCode" value="${validateCode }">
												<img id="validateImg" src="${pageContext.servletContext.contextPath}/getDealerLoginCode2" onClick="javascript:flushValidateCode();"/>
												<span><aebiz:showTitle titleId="customer.register.notLook" />？<a class="f_color2" href="javascript:flushValidateCode();"><aebiz:showTitle titleId="customer.register.changeOne" /></a></span>
											</div>
									</div>
								</c:if>
								
								<div id="error" style="display:none;">
									<div class="form-group">
										<div class="alert alert-danger" id="error_msg">${Error_Msg }</div>
									</div>
								</div>
			
								<div class="y_suskjbx">
									<label class="y_icheckbox"><input class="icheck-me" data-skin="square" data-color="red" type="radio"   class="form-control" id="isadmin1" name="type" value="subDealer"  > 子账号</label>
									<label class="y_icheckbox"><input class="icheck-me" data-skin="square" data-color="red" type="radio" checked  class="form-control" id="isadmin2" name="type" value="dealer" > 主账号</label>
									<span><a href="${pageContext.servletContext.contextPath}/dealer/toFindPassword" class="f_color1" data-l10n-id="forget_pass" target="_top">忘记密码</a></span>
								</div>
									
								<button type="submit" id="y_loadlogin" class="btn btn-custom btn-lg btn-block" data-loading-text="<aebiz:showTitle titleId='customer.login.logining'/>"><aebiz:showTitle titleId="customer.login.login" /></button>
							</div>
						</form>
					</div>
				</div>
				<!-- 底部 -->
				<div class="modal-footer y_copeweb">
				</div><!-- End .modal-footer -->
			</div><!-- End .modal-content -->
		</div><!-- End .modal-dialog -->
	
</div><!-- End 登录弹出框 -->
<script>

$(function(){
	
    if ($('.form-validate3').length > 0) {
        $('.form-validate3').each(function() {
            var id = $(this).attr('id');  //获取表单的id
            $("#" + id).validate({   //验证表单
                errorElement: 'span',  //输入错误时的提示标签
                errorClass: 'help-block has-error',  //输入错误时的提示标签类名
                errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
                    if(element.parents(".input-group").length > 0){
                    		element.parents(".input-group").after(error);
                    }else if(element.parents(".y_validatainput").length > 0){
                    		element.parents(".y_validatainput").after(error);
                    }
                    else if(element.parents("label").length > 0) {
                        element.parents("label").after(error);
                    }else {
                        element.after(error);
                    }
                },
                highlight: function(label) {   //输入错误时执行的事件
                    $(label).closest('.form-group').removeClass('has-error has-success').addClass('has-error');
                },
                success: function(label) {   //输入正确时执行的事件
                    label.addClass('valid').closest('.form-group').removeClass('has-error has-success').addClass('has-success');
                },
                onkeyup: function(element) {   //验证元素输入值时按钮松开执行的事件
                    $(element).valid();
                },
                onfocusout: function(element) {   //验证元素失去焦点时进行验证
                    $(element).valid();
                },                
                submitHandler: function(form){
                	customerlogin();
                	//$("#modal-domain").modal('hide');//关闭模态框
				        //    form.submit(); //没有这一句表单不会提交
				        }
            });
        });
    }	
  });
	//登录弹出框用户名、密码验证成功，点击登录按钮改变按钮文字的事件
	
	function customerlogin(){
		var loginName = base64encode($("#loginName").val());
		var pwd = base64encode($("#pwd").val());
		var hasVilidateCode =  $("#hasVilidateCode").val();
		var validateCode =  $("#validateCode").val();
		var type= $("[name='type']:checked").val();
		$.get("${pageContext.request.contextPath }/dealer/quickLogin",
			{
				"loginName":loginName,
				"pwd":pwd,
				"hasVilidateCode":hasVilidateCode,
				"validateCode":validateCode,
				"type":type,
				ranNum : Math.random()
			},
			function(data) {
				//根据返回的内容判断是成功还是失败,如果失败会返回页面,页面中会有"y_suslgbx",反之成功页面没有
				if(data.indexOf("y_suslgbx") >-1){
					$("#center").html(data);
				}else{
					var result = eval("("+data+")") ;
					if(result.success =="success"){
						$("#modal-login-form").modal('hide');//关闭模态框
						window.location.reload(); //登录成功后，刷新当前页面
					}
				}
			});
	}
</script>
<script type="text/javascript">
/* 刷新验证码 */
function flushValidateCode(){
	var validateImgObject = document.getElementById("validateImg");
	validateImgObject.src = "${pageContext.servletContext.contextPath}/getDealerLoginCode2?time=" + new Date().getTime();
}
</script>