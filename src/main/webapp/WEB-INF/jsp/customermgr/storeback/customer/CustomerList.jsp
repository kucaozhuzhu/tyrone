<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>

	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/import/ListImport.jsp" %>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/storeback/css/plugins/icheck/all.css">
	<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/icheck/jquery.icheck.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/aebiz/aebiz.checkbox.js"></script>
	<script src="${pageContext.servletContext.contextPath}/static/storeback/js/plugins/validation/jquery.validate.min.js"></script>

</head>

<body>
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/storeHead.jsp"%>
	<div class="container-fluid" id="content">	
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/storeLeft.jsp"%>
		<div id="main">
			<div class="container-fluid">	
				<div class="page-header">
					<div class="pull-left">
						<h1><aebiz:showTitle titleId="customer.moduleName_CN"/><aebiz:showTitle titleId="basebusiness.showmessage.manager"/></h1>
					</div>
				</div>
				
				<div class="breadcrumbs">
					<ul>
						<li><span><aebiz:showTitle titleId="customer.menuOne"/></span><i class="fa fa-angle-right"></i></li>
						<li><span><aebiz:showTitle titleId="customer.menuTwo"/></span><i class="fa fa-angle-right"></i></li>							
						<li><span><aebiz:showTitle titleId="customer.moduleName_CN"/><aebiz:showTitle titleId="basebusiness.showmessage.manager"/></span></li>						
					</ul>				
				</div>				
									
				<div class="row">
					<div class="col-sm-12">
						<div class="box">
							<div class="box-content nopadding y_tableser">
								<div class="y_clear">
									<div class="form-inline table_formnew">
										<div  class="form-group">
											<label class="control-label"><aebiz:showTitle titleId="customer.qmf.customerName"/>：</label>
											<input type="text" name="customerName" id="customerName" class="form-control">
											<input type="hidden" name="customerName_q" id="customerName_q" class="form-control" value="Like">
										</div>
										
										 <div class="form-group">
											<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.customerLevel"/>：</label>
											<select name="customerStoreLevelUuid" id="customerStoreLevelUuid" class='form-control'>
												<option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</option>
												<c:forEach items="${storeLevelList}" var="level">
													<option value="${level.uuid}">${level.levelName}</option>
												</c:forEach>	
											</select>
										</div>
		
										<div class="form-group">
											<button class="btn btn-primary search" title="<aebiz:showTitle titleId="basebusiness.showmessage.query"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.query"/></button>
											<button class="btn" onclick="javascript:clearSearch();" title="<aebiz:showTitle titleId="basebusiness.showmessage.clear"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.clear"/></button>
											<button class="btn" id="searchshow" title="<aebiz:showTitle titleId="basebusiness.showmessage.seniorQuery"/>" rel="tooltip" data-toggle="modal" data-target="#modal-user"><aebiz:showTitle titleId="basebusiness.showmessage.seniorQuery"/></button>
										</div>
									</div>
									
									<!-- 
									<div class="y_tablebtn">
										<a class="btn" href="" title="" rel="tooltip"><aebiz:showTitle titleId="customer.m.sendGiftBag"/></a>
										<a class="btn" href="" title="" rel="tooltip">导入会员</a>
										<a class="btn" href="" title="" rel="tooltip"><aebiz:showTitle titleId="customer.m.exportCustomer"/></a>
									</div>
									 -->
								</div>
							
								<table class="table table-bordered table-hover table-nomargin table-striped dataTable dataTable-reorder">
									<thead>		
										<tr>
											<th class='with-checkbox'><input type="checkbox" name="check_all" id="check_all"></th>
											<th><aebiz:showTitle titleId="customer.m.customerName"/></th>
											<th><aebiz:showTitle titleId="customer.m.mobile"/></th>
											<th><aebiz:showTitle titleId="customer.m.email"/></th>
											<th><aebiz:showTitle titleId="customer.m.customerLevel"/></th>
											<th class='hidden-480'><aebiz:showTitle titleId="basebusiness.showmessage.operate"/></th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>		
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	
	<!--高级搜索-->
	<div id="modal-user" class="modal fade y_highserch">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4><aebiz:showTitle titleId="basebusiness.showmessage.seniorQuery"/></h4>
				</div>
				
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-6">
							 <div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.customerName"/></label>
								<input type="text" name="customerName_s" id="customerName_s" class="form-control">
								<input type="hidden" name="customerName_q" id="customerName_q" value="Like">
							</div>
						</div>
						
						<div class="col-sm-6">
							 <div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.customerLevel"/></label>
								<select name="customerStoreLevelUuid_s" id="customerStoreLevelUuid_s" class='form-control'>
									<option value="">-<aebiz:showTitle titleId="basebusiness.showmessage.pleasechoose"/>-</option>
									<c:forEach items="${storeLevelList}" var="level">
										<option value="${level.uuid}">${level.levelName}</option>
									</c:forEach>	
								</select>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6">
							 <div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.mobile"/></label>
								<input type="text" name="mobile_s" id="mobile_s" class="form-control">
								<input type="hidden" name="mobile_q" id="mobile_q" value="Like">
							</div>
						</div>
						
						<div class="col-sm-6">
							 <div class="form-group">
								<label for="textfield" class="control-label"><aebiz:showTitle titleId="customer.m.email"/></label>
								<input type="text" name="email_s" id="email_s" class="form-control">
								<input type="hidden" name="email_q" id="email_q" value="Like">
							</div>
						</div>
					</div>
				</div>	
																
				<div class="modal-footer">
					<button class="btn moresearch btn-primary" data-dismiss="modal"><aebiz:showTitle titleId="basebusiness.showmessage.query"/></button>
					<button class="btn clearMoreSearch" ><aebiz:showTitle titleId="basebusiness.showmessage.clear"/></button>
				</div>
			</div>
		</div>
	</div>
	<!--高级搜索-->
	
	<input type="hidden" id="storeUuid" value="${storeUuid}">
	<input type="hidden" id="customerUuid">
	
	<!-- 关联标签 -->
	<div id="modal-tag" class="modal fade y_highserch r_highserch">
		<form id="tagForm" action="" method="get" class='form-validate'>
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4><aebiz:showTitle titleId="customer.m.addTagRel"/></h4>
					</div>
				
					<div class="modal-body" id="tagDiv">
						<c:choose>
							<c:when test="${!empty storeTags}">
								<div class="form-group">
									<label for="textfield" class="control-label col-sm-2"><aebiz:showTitle titleId="customer.m.tag"/></label>
									<div class="col-sm-10">
										<c:forEach items="${storeTags}" var="tag" varStatus="index">
											<span class="y_icheckbox">
												<div><input type="checkbox" id="${tag.uuid}" name="customerTagUuid" value="${tag.uuid}" class='icheck-me' data-skin="square" data-color="blue"/></div>
												<label for="${tag.uuid}">${tag.tagName}</label>
											</span>
										</c:forEach>
									</div>
								</div>
							</c:when>						
							<c:otherwise>
								您还没有添加标签哦！
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="modal-footer" style="text-align: right;">
						<button class="btn btn-primary linkTag" data-dismiss="modal"><aebiz:showTitle titleId="basebusiness.showmessage.confirm"/></button>
						<button class="btn btn-close" data-dismiss="modal"><aebiz:showTitle titleId="basebusiness.showmessage.cancel" /></button>
					</div>
				</div>
			</div>
		</form>
	</div>	
	<!-- 关联标签 -->
	
	<!-- 发送优惠券 -->
	<div id="modal-coupon" class="modal fade y_highserch">
		<form id="couponTypeForm" action="" method="get" class='form-validate'>
			<input type="hidden" name="customerUuid">
			<input type="hidden" name="couponTypeUuid">
			
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4><aebiz:showTitle titleId="customer.m.sendCoupon"/></h4>
					</div>
					
					<div class="modal-body">
						<div class="form-group">
							<label for="couponType" class="control-label col-sm-2" style="margin-top:5px">选择优惠券</label>
							<div class="col-sm-10">
								<div class="col-sm-6">
									<select name="couponType" id="couponType" class='select2-me form-control'>
										<option id="0" value="">-请选择-</option>
										<c:forEach items="${couponTypeList}" var="couponType" varStatus="index">
											<option id="${couponType.canIssuedNum}" value="${couponType.uuid}">${couponType.couponTypeName}</option>
										</c:forEach>
									</select>
									
								</div>
								<div class="col-sm-4">
									<div id="limitTip" class="y_sjjjd"></div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="count" class="control-label col-sm-2" style="margin-top:5px">发送张数</label>
							<div class="col-sm-10">
								<div class="col-sm-12 y_saleleng">
									<a href="javascript:void(0);" onclick="javascript:reduce();">-</a>
										<input type="text" id="count" name="count" value="1" class="form-control">
									<a href="javascript:void(0);" onclick="javascript:add();">+</a>
									<div></div>
								</div>
							</div>
						</div>
					</div>	
																	
					<div class="modal-footer">
						<button class="btn btn-primary sendCoupon"><aebiz:showTitle titleId="basebusiness.showmessage.confirm"/></button>
						<button class="btn btn-close" data-dismiss="modal"><aebiz:showTitle titleId="basebusiness.showmessage.cancel" /></button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- 发送优惠券 -->
		
<script>
var storeUuid=$("#storeUuid").val();

jQuery.validator.addMethod("limitCount", function(value, element) {  
	var limitCount = parseInt($("#couponType").find("option:selected").attr("id"));
	if(limitCount==0){
		return true;
	}
	if(value > limitCount){
		return false;
	}else{
		return true;
	}
}, "不能超过剩余优惠券张数");

$(function(){
	$("#couponType").change(function(){
		if($(this).find("option:selected").val()!=""){
			$("#limitTip").text("( 剩余 "+$(this).find("option:selected").attr("id")+" 张 )");
			$("#count").val("1");
		}else{
			$("#limitTip").text("");
			$("#count").val("1");
		}
	});

	$("#couponTypeForm").validate({
		rules: {
			couponType:{
				required : true
			},
  		 	count: {
				required : true,
				digits : true,
				limitCount:function(){
					var limitCount = parseInt($("#couponType").find("option:selected").attr("id"));
					return limitCount;
				}
			}
  		},
        messages: {
			couponType:{
				required : "请选择优惠券类型",
			},
   			count: {
				required : "请输入发送优惠券的张数" , 
				digits : "请输入正整数",
				limitCount:"不能超过{0}张"
			}
  		},
		errorElement: 'span',  //输入错误时的提示标签
		errorClass: 'help-block has-error',  //输入错误时的提示标签类名
		errorPlacement: function(error, element) {  //输入错误时的提示标签显示的位置
			if(element.parents(".y_saleleng").find("div").length>0){
				element.parents(".y_saleleng").find("div").append(error);
			}else{
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
		submitHandler:function(form){
			//$("input[name='customerUuid']:hidden").val($("#customerUuid").val());
			//$("input[name='couponTypeUuid']").val($("#couponType").find("option:selected").val());

			var customerUuid=$("#customerUuid").val();
			var couponTypeUuid=$("#couponType").find("option:selected").val();
			var count=$("#count").val();

			var url = "${pageContext.servletContext.contextPath}/storeback/customer/sendCoupon";
			$.post(url,{customerUuid:customerUuid,couponTypeUuid:couponTypeUuid,count:count},function(data){
				if(data=="success"){
					  bootbox.alert({  
				            buttons: {  
				               ok: {  
				                    label: '确认',  
				                }  
				            },  
				            message: '发送成功',   
				            callback: function() {  
				            	$("#modal-coupon").modal('hide');
					        	window.location.reload();
				            },  
				            title: "发送优惠券"
				       });  
				}else{
					 bootbox.alert({  
				            buttons: {  
				               ok: {  
				                    label: '确认',  
				                }  
				            },  
				            message: '发送失败',   
				            callback: function() {  
				            	$("#modal-coupon").modal('hide');
					        	window.location.reload();
				            },  
				            title: "发送优惠券"
				       }); 
				}
			});
        }  
	});

	$(".linkTag").bind("click",function(){
		 var customerUuid=$("#customerUuid").val();
		 var customerTagUuid="";
		 $("input[name='customerTagUuid']:checked").each(function(){
			 customerTagUuid += $(this).val()+",";
		 });
		 
		 var url="${pageContext.servletContext.contextPath}/storeback/customer/doLinkTag";
		 $.get(url,{"storeUuid":storeUuid,"customerUuid":customerUuid,"customerTagUuid":customerTagUuid,"ranNum":Math.random()},function(){
			 	bootbox.alert("操作成功");	
	     });
	});
});
	
	function toSendCoupon(customerUuid){
		$("#couponTypeForm")[0].reset();
		$("#customerUuid").val(customerUuid);
	}
	
	function toLinkTag(customerUuid){
		$("#customerUuid").val(customerUuid);
		$("input[name='customerTagUuid']").each(function(){
			$(this).iCheck('uncheck');
		});

		var url="${pageContext.servletContext.contextPath}/storeback/customer/toLinkTag";
		$.get(url,{"customerUuid":customerUuid,"storeUuid":storeUuid,"ranNum":Math.random()},function(data){
			if(data!=""){
				var customerTagUuids = data.split(",");
				for(var i=0;i<customerTagUuids.length;i++){
					$("#"+customerTagUuids[i]).iCheck('check');
				}
			}
		});
	}

	// 增加数量
	function add(){
		var count=parseInt($("#count").val());
		var limitCount=parseInt($("#couponType").find("option:selected").attr("id"));
		if(isNaN(count)){
			$("#count").val(1);
			return;
		}
		if(limitCount==0){
			$("#count").val(count+1);
			return;
		}
		if(count+1 > limitCount){
			$("#count").val(limitCount);
		}else{
			$("#count").val(count+1);
		}
	}
	// 减去数量
	function reduce(){
		var count=parseInt($("#count").val());
		if(isNaN(count)){
			$("#count").val(1);
			return;
		}
		if(count==1){
			return;
		}else{
			$("#count").val(count-1);
		}
	}

	function retrieveData(sSource,aoData,fnCallback) { 
		var searchParam = new Array() ;
		searchParam.push({ "name": "customerName", "value": $.trim($("#customerName").val())});
		searchParam.push({ "name": "customerName_s", "value": $.trim($("#customerName_s").val())});
		searchParam.push({ "name": "customerName_q", "value": $.trim($("#customerName_q").val())});
		searchParam.push({ "name": "mobile_s", "value": $.trim($("#mobile_s").val())});
		searchParam.push({ "name": "mobile_q", "value": $.trim($("#mobile_q").val())});
		searchParam.push({ "name": "email_s", "value": $.trim($("#email_s").val())});
		searchParam.push({ "name": "email_q", "value": $.trim($("#email_q").val())});
		searchParam.push({ "name": "customerStoreLevelUuid", "value": $.trim($("#customerStoreLevelUuid").val())});
		searchParam.push({ "name": "customerStoreLevelUuid_s", "value": $.trim($("#customerStoreLevelUuid_s").val())});
		
	   $.ajax({    	        
	  	"dataType": 'json', 
		  "type": "POST", 
		  "url": sSource, 
		  "data": {aoData:JSON.stringify(aoData),searchParam:JSON.stringify(searchParam)}, 
		  "success": fnCallback
	  });    
	} 
	    
	var oTable = null; 
	function doSearch(operact) {	
		if(oTable == null) {		 
	    if ($('.dataTable').length > 0) {
	        $('.dataTable').each(function() {            
	                var opt = {
					            "sPaginationType": "full_numbers",
					            "oLanguage": {
					            		"sProcessing": "<aebiz:showTitle titleId="basebusiness.showmessage.loading"/>",
					                "sSearch": "<span><aebiz:showTitle titleId="basebusiness.showmessage.query"/>:</span> ",
					                "sInfo": "<aebiz:showTitle titleId="basebusiness.showmessage.pageFrom"/> <span>_START_</span> <aebiz:showTitle titleId="basebusiness.showmessage.pageTo"/> <span>_END_</span> <aebiz:showTitle titleId="basebusiness.showmessage.pageItem"/>，<aebiz:showTitle titleId="basebusiness.showmessage.totalCount"/>： <span>_TOTAL_</span> <aebiz:showTitle titleId="basebusiness.showmessage.pageItem"/>",
					                "sLengthMenu": "_MENU_ <span><aebiz:showTitle titleId="basebusiness.showmessage.pageShow"/></span>" ,
					                "oPaginate": {
					                 	"sFirst": "<aebiz:showTitle titleId="basebusiness.showmessage.firstPage"/>",
					                  "sPrevious": "<aebiz:showTitle titleId="basebusiness.showmessage.prePage"/>",
					                  "sNext": "<aebiz:showTitle titleId="basebusiness.showmessage.nextPage"/>",
					                  "sLast": "<aebiz:showTitle titleId="basebusiness.showmessage.lastPage"/>"
					                }
					            },
					            
					            'sDom': "rtlip",
					            'aoColumnDefs': [{
					                'bSortable': false,
					                'aTargets': [0,5]                
					            }],
					            "bSort": true, //排序功能            
						         	"aoColumns": [
											  {
											  	"mDataProp":"checkbox" ,
											  	"sWidth":"5%",
											  	"sDefaultContent":"",
											  	"fnRender": function(obj) {
											      var sReturn = "<input type='checkbox' name='check' value='"+obj.aData.uuid+"' />";						      
											      return sReturn;
											 	}
											  },
												{"mDataProp":"customerName" ,"sDefaultContent":"","sWidth":"20%","sTitle": "<aebiz:showTitle titleId="customer.m.customerName"/>"},
												{"mDataProp":"mobile" ,"sDefaultContent":"","sWidth":"20%","sTitle": "<aebiz:showTitle titleId="customer.m.mobile"/>"},
												{"mDataProp":"email" ,"sDefaultContent":"","sWidth":"20%","sTitle": "<aebiz:showTitle titleId="customer.m.email"/>"},
												{"mDataProp":"customerStoreLevelModel.levelName" ,"sDefaultContent":"","sWidth":"15%","sTitle": "<aebiz:showTitle titleId="customer.m.customerLevel"/>"},
											  {
											  	"mDataProp":"operate",
											  	"sDefaultContent":"",
											  	"sWidth":"20%",
											  	"sTitle": "<aebiz:showTitle titleId="basebusiness.showmessage.operate"/>" ,
											 	"fnRender": function(obj) {	
												  		var sReturn = "<a href='${pageContext.servletContext.contextPath}/storeback/customer/toView/"+obj.aData.uuid+"' class='btn' rel='tooltip' title='<aebiz:showTitle titleId="customer.m.seeInfo"/>'><aebiz:showTitle titleId="customer.m.seeInfo"/></a>" ;
															sReturn +="<a onclick='javascript:toSendCoupon(\""+obj.aData.uuid+"\")' class='btn btn-close' rel='tooltip' data-toggle='modal' data-target='#modal-coupon' title=''>发送优惠券</a>" ;
												      return sReturn;
												 }			
											  }
											],
					            'oTableTools': {
					                "sSwfPath": "${pageContext.servletContext.contextPath}/static/js/plugins/datatable/swf/copy_csv_xls_pdf.swf"
					            },
					            "bRetrieve":true ,
					            "bProcessing":true,
					           	"bServerSide":true,                    //指定从服务器端获取数据
					            "sAjaxSource":"${pageContext.servletContext.contextPath}/storeback/customer/queryList" ,
											"fnServerData":retrieveData           //获取数据的处理函数  
					        };
					        
	                		if ($(this).hasClass("dataTable-reorder")) {
			                    opt.sDom = "R" + opt.sDom;
			                }
			                oTable = $(this).dataTable(opt);
	        	});
	   		}         
		}
		//刷新Datatable，会自动激发retrieveData  		
	  	if('inittable' != operact) {  			
			oTable.fnDraw(); 	
		}  
	}
	
	$(".search").click(function(){	
		//普通搜索需要清空高级搜索的选项
		clearMoreSearch();
		doSearch('search') ;  
	})
	
	$(".moresearch").click(function(){
		//高级搜索需要清空普通搜索的选项
		clearSearch() ;
		doSearch('search') ;
	})
	
	function clearSearch() {
		$("#customerName").val("") ;	
		$("#customerStoreLevelUuid").val("");
	}
	
	//清空高级搜索的所有选项
	function clearMoreSearch() {
		$("#customerName_s").val("") ;
		$("#mobile_s").val("") ;
		$("#email_s").val("") ;
		$("#customerStoreLevelUuid_s").val("");
	}
	
	//删除
	function removes(delId) {
			var checkIds="";
			if( $.trim(delId) != "") {
				checkIds = delId ;
			}else{
				$("input[name='check']:checkbox").each(function(){				
			        if($(this).is(":checked")){        	
			            checkIds += $(this).val()+"," ;  
			        }
	    		})	
			}
			if($.trim(checkIds) == "") {
					//提示为空
					bootbox.alert("<aebiz:showTitle titleId="basebusiness.showmessage.chooseDeleteData"/>") ;
					return ;
			} 
			
			bootbox.confirm("<aebiz:showTitle titleId="basebusiness.showmessage.confirmDelete"/>", function(r){
	        	if(r) {
	        		//删除
					$.post(
				    	"${pageContext.servletContext.contextPath}/customer/deletes",
				    	{"selectOne":checkIds,ranNum:Math.random()},	
					    function(data) {	       
					       var result = eval("("+data+")") ;	       
					       if(result.rsp) {
					  			//刷新
								doSearch('search') ;     	
					       }else{
					       		bootbox.alert('<aebiz:showTitle titleId="basebusiness.showmessage.opeFailed"/>') ;
					       }
					    }
					);		
	        	}   
	    });   
	}
	
	$(document).ready(function() {
		 //初始化表格
	   	 doSearch('inittable') ;
	   	 //复选框全选
		 $("#check_all").click(function(e) {
		 		$('input', oTable.fnGetNodes()).prop('checked', this.checked);
		 });       
		
		//高级搜索弹出框
		$("#searchshow").click(function(e) {    	
			e.preventDefault();
		    $("#modal-user").modal("show");
		});
		
		$(".clearMoreSearch").click(function(e) {    	
			clearMoreSearch() ;
		});
	}) 
</script>
		
</body>
</html>