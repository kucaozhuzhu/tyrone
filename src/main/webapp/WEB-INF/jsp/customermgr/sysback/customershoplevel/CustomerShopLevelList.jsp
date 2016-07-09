<%@ page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/WEB-INF/jsp/basebusiness/common/import/ListImport.jsp" %>

</head>

<body>
	<div class="container-fluid">	
		<div class="page-header">
			<div class="pull-left"><h1><aebiz:showTitle titleId="customershoplevel.moduleName_CN"/><aebiz:showTitle titleId="basebusiness.showmessage.manager"/></h1></div>
		</div>
		
		<div class="breadcrumbs">
			<ul>
				<li><span><aebiz:showTitle titleId="customershoplevel.menuOne"/></span><i class="fa fa-angle-right"></i></li>
				<li><span><aebiz:showTitle titleId="customershoplevel.menuTwo"/></span><i class="fa fa-angle-right"></i></li>							
				<li><span><aebiz:showTitle titleId="customershoplevel.moduleName_CN"/><aebiz:showTitle titleId="basebusiness.showmessage.manager"/></span></li>						
			</ul>				
		</div>				
							
		<div class="row">
			<div class="col-sm-12">
				<div class="box">
					<div class="box-content nopadding y_tableser">
						<div class="y_clear">
							<div class="y_tablebtn y_tablebtn_noserch">
								<shiro:hasPermission name="customershoplevel:button:add or sysback:button:*">
								<a class="btn" href="${pageContext.servletContext.contextPath}/sysback/customershoplevel/toAdd" title="<aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/></a>
								</shiro:hasPermission>
								<shiro:hasPermission name="customershoplevel:button:deletes or sysback:button:*">
								<button class="btn" onclick="javascript:removes('');" title="<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.delete"/></button>
								</shiro:hasPermission>
							</div>
						</div>
					
						<table class="table table-bordered table-hover table-nomargin table-striped dataTable dataTable-reorder r_dataTable">
							<thead>		
								<tr>
									<th class='with-checkbox'><input type="checkbox" name="check_all" id="check_all"></th>
									<th><aebiz:showTitle titleId="customershoplevel.m.position"/></th>
									<th><aebiz:showTitle titleId="customershoplevel.m.levelName"/></th>
									<th><aebiz:showTitle titleId="customershoplevel.m.levelIcon"/></th>
									<th><aebiz:showTitle titleId="customershoplevel.m.integralRange"/></th>
									<th><aebiz:showTitle titleId="customershoplevel.m.description"/></th>
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
	
<script>
function retrieveData(sSource,aoData,fnCallback) { 
   var searchParam = new Array() ;	
   //会员模块
   searchParam.push({
		"name" : "levelType_s",
		"value" : "2"
	});
  searchParam.push({
		"name" : "levelType_q",
		"value" : "EQ"
	});
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
				                'aTargets': [0,1,2,3,4,5,6]                
				            }],
				            "bSort": true, 
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
											{"mDataProp":"position" ,"sWidth":"10%","sTitle": "<aebiz:showTitle titleId="customershoplevel.m.position"/>"},
											{"mDataProp":"levelName" ,"sWidth":"14%","sTitle": "<aebiz:showTitle titleId="customershoplevel.m.levelName"/>"},
											 {
											  	"mDataProp":"imgUrl",
											  	"sWidth":"13%",
											  	"sDefaultContent":"",
											  	"sTitle": "<aebiz:showTitle titleId="customershoplevel.m.levelIcon"/>" ,
											 	"fnRender": function(obj) {	
											 		var sReturn = "";
											 		if(obj.aData.imgUrl!=""){
											 			sReturn = "<img src='"+obj.aData.imgUrl+"' width='50px' height='40px;' />" ;
											 		}
												      return sReturn;
												 }			
											  },
											{
											  	"mDataProp":"maxIntegral",
											  	"sWidth":"13%",
											  	"sDefaultContent":"",
											  	"sTitle": "<aebiz:showTitle titleId="customershoplevel.m.integralRange"/>" ,
											 	"fnRender": function(obj) {	
												  		var sReturn = obj.aData.minIntegral+"-"+obj.aData.maxIntegral;														
												      return sReturn;
												 }			
											 },
											{"mDataProp":"description" ,"sWidth":"30%","sTitle": "<aebiz:showTitle titleId="customershoplevel.m.description"/>"},
										  {
										  	"mDataProp":"operate",
										  	"sWidth":"15%",
										  	"sDefaultContent":"",
										  	"sTitle": "<aebiz:showTitle titleId="basebusiness.showmessage.operate"/>" ,
										 	"fnRender": function(obj) {	
										 			var sReturn = "";
											  		<shiro:hasPermission name="customershoplevel:button:update or sysback:button:*">
											  			sReturn = "<a href='${pageContext.servletContext.contextPath}/sysback/customershoplevel/toUpdate/"+obj.aData.uuid+"' class='btn' rel='tooltip' title='<aebiz:showTitle titleId="basebusiness.showmessage.edit"/>'><aebiz:showTitle titleId="basebusiness.showmessage.edit"/></a>" ;
													</shiro:hasPermission>
													<shiro:hasPermission name="customershoplevel:button:deletes or sysback:button:*">
														sReturn += "<a href='javascript:removes(\""+obj.aData.uuid+"\");' class='btn' rel='tooltip' title='<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>'><aebiz:showTitle titleId="basebusiness.showmessage.delete"/></a>" ;			
													</shiro:hasPermission>												
											      return sReturn;
											 }			
										  }
										],
				            'oTableTools': {
				                "sSwfPath": "${pageContext.servletContext.contextPath}/static/sysback/js/plugins/datatable/swf/copy_csv_xls_pdf.swf"
				            },
				            "bRetrieve":true ,
				            "bProcessing":true,
				           	"bServerSide":true,                    //指定从服务器端获取数据
				            "sAjaxSource":"${pageContext.servletContext.contextPath}/sysback/customershoplevel/queryList" ,
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
			    	"${pageContext.servletContext.contextPath}/sysback/customershoplevel/deletes",
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
}) 
</script>

</body>
</html>