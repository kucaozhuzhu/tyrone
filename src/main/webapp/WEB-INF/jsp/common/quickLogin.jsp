<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>                        
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 登录弹出框 -->
<div class="modal fade y_suslogin" id="modal-login-form" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 标题 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">会员请登录</h4>
				</div>
				<!-- 中间结构 -->
				<div class="modal-body">
					<p id="isfastbuy" name="" ></p>
					<div id="center">
						<form id="domainForm" action="" method="get" class='form-validate3' >
							<input type="hidden" id="hasVilidateCode" name="hasVilidateCode" value="${hasVilidateCode }">
							<input type="hidden" id="type" name="type" value="customer">
							<div class="y_suslgbx">
								<div class="form-group">
									<label class="control-label" for="sususername"><aebiz:showTitle titleId="customer.login.loginNameOrMobileOrEmail" /></label>
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
									
								<%-- <c:if test="${hasVilidateCode == 'true'  }">
									<div class="form-group y_yzmgrop">
											<label class="control-label" for="validateCode" ><aebiz:showTitle titleId="customer.findpwd1.randomCode" /></label>
											<div class="clearfix">
												<input type="text" class="form-control" id="validateCode" name="validateCode" value="${validateCode }">
												<img id="validateImg" src="${pageContext.servletContext.contextPath}/getCustomerLoginCode" onClick="javascript:flushValidateCode();"/>
												<span><aebiz:showTitle titleId="customer.register.notLook" />？<a class="f_color2" href="javascript:flushValidateCode();"><aebiz:showTitle titleId="customer.register.changeOne" /></a></span>
											</div>
									</div>
								</c:if> --%>
								<div class="form-group y_yzmgrop" id="codecheck" style="display:none;">
									<label class="control-label" for="validateCode" ><aebiz:showTitle titleId="customer.findpwd1.randomCode" /></label>
									<div class="clearfix">
										<input type="text" class="form-control" id="validateCode" name="validateCode">
										<input type="hidden" class="form-control" id="captchakey" name="captchakey">
										<img id="validateImg" src="" />
									</div>
								</div>
								
								<div id="error" style="display:none;">
									<div class="form-group">
										<div class="alert alert-danger" id="error_msg">${Error_Msg }</div>
									</div>
								</div>
			
								<div class="y_suskjbx">
								
<%-- 									<a class="f_clr999 fr" href="${pageContext.servletContext.contextPath}/customer/customerregist/toRegister"><aebiz:showTitle titleId="customer.login.toreg" /></a> --%>
									<label><input type="checkbox" name="remember" id="remember" /><aebiz:showTitle titleId="customer.login.rememberMe" /></label>
<%-- 									<a class="f_clr999" href="${pageContext.servletContext.contextPath}/customerfindpwd/toFindPwdStep1"><aebiz:showTitle titleId="customer.login.forgetpassword" /></a> --%>
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
				}
            });
        });
    }	
  });
	//登录弹出框用户名、密码验证成功，点击登录按钮改变按钮文字的事件
	
	function customerlogin(){
		var loginName = $("#loginName").val();
		var pwd = $("#pwd").val();
		var hasVilidateCode =  $("#hasVilidateCode").val();
		var validateCode =  $("#validateCode").val();
		var captchakey =  $("#captchakey").val();
		$.post("${pageContext.request.contextPath }/tclcustomer/quickLogin",
			{
				"loginName":loginName,
				"pwd":pwd,
				"hasVilidateCode":hasVilidateCode,
				"validateCode":validateCode,
				"type":"customer",
				"accountLoginUrl":"${accountLoginUrl}",
				"accountgetPasswordUrl":"${accountgetPasswordUrl}",
				"captchakey":captchakey,
				ranNum : Math.random()
			},
			function(data) {
				var result = eval("("+data+")") ;
				if(result.success =="success"){
					    $("#codecheck").hide();
						$("#modal-login-form").modal('hide');//关闭模态框
						/* if($("#submitPreSaleTOBuyURL").val()){//:预售商品链接,预售的直接跳入下一步
							window.location.href = $("#submitPreSaleTOBuyURL").val();
							return;
						} */
						window.location.reload(); //登录成功后，刷新当前页面
				}else if(result.success =="error"){
					if(result.status =="-1"){
						var imgurl = result.url;
						var imgkey = result.key;
					  $("#codecheck").show();
					  $("#validateImg").attr("src", imgurl);
					  $("#captchakey").val(imgkey);
                      alert("用户名或者密码不正确");
				    }else if(result.status =="-4"){
						var imgurl = result.url;
						var imgkey = result.key;
					  $("#codecheck").show();
					  $("#validateImg").attr("src", imgurl);
					  $("#captchakey").val(imgkey);
                      alert("请填写验证码");
				    }else if(result.status =="-5"){
                      alert("验证码错误");
				    }else{
                      alert("用户名或者密码错误");
					}
				}
			});
	}
	
</script>
<script type="text/javascript">
/* 刷新验证码 */
function flushValidateCode(){
	 var validateImgObject = document.getElementById("validateImg");
	 validateImgObject.src = "${pageContext.servletContext.contextPath}/getCustomerLoginCode?time=" + new Date();
}
</script>