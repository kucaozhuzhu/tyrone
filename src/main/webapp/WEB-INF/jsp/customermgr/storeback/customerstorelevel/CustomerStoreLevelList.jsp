<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>

<!doctype html>
<html>
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/import/ListImport.jsp" %>

</head>

<body>
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/storeHead.jsp"%>
	<div class="container-fluid" id="content">	
	<%@ include file="/WEB-INF/jsp/basebusiness/storebackmgr/common/storeLeft.jsp"%>
		<div id="main">
			<div class="container-fluid">
			<div class="page-header">
				<div class="pull-left">
					<h1><aebiz:showTitle titleId="customerstorelevel.moduleName_CN"/><aebiz:showTitle titleId="basebusiness.showmessage.manager"/></h1>
				</div>
			</div>
			
			<div class="breadcrumbs">
				<ul>
					<li><span><aebiz:showTitle titleId="customerstorelevel.menuOne"/></span><i class="fa fa-angle-right"></i></li>
					<li><span><aebiz:showTitle titleId="customerstorelevel.menuTwo"/></span><i class="fa fa-angle-right"></i></li>							
					<li><span><aebiz:showTitle titleId="customerstorelevel.moduleName_CN"/><aebiz:showTitle titleId="basebusiness.showmessage.manager"/></span></li>						
				</ul>				
			</div>				
								
			<div class="row">
					<div class="col-sm-12">
						<div class="box">
							<div class="box-content nopadding y_tableser">
								<div class="y_clear">
									<div class="y_tablebtn y_tablebtn_noserch">
										<a class="btn" href="${pageContext.servletContext.contextPath}/storeback/customerstorelevel/toAdd" title="<aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.newAdd"/></a>
										<button class="btn" onclick="javascript:removes('');" title="<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>" rel="tooltip"><aebiz:showTitle titleId="basebusiness.showmessage.delete"/></button>
									</div>
								</div>
								<table class="table table-bordered table-hover table-nomargin table-striped dataTable dataTable-reorder r_dataTable">
									<thead>		
										<tr>
											<th class='with-checkbox'><input type="checkbox" name="check_all" id="check_all"></th>
											<th><aebiz:showTitle titleId="customerstorelevel.m.position"/></th>
											<th><aebiz:showTitle titleId="customerstorelevel.m.levelName"/></th>
											<th><aebiz:showTitle titleId="customerstorelevel.m.levelIcon"/></th>
											<th><aebiz:showTitle titleId="customerstorelevel.m.buyTotalMoney"/></th>
											<th><aebiz:showTitle titleId="customerstorelevel.m.buyTotalCount"/></th>
											<th><aebiz:showTitle titleId="customerstorelevel.m.description"/></th>
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
	
<script>
function retrieveData(sSource,aoData,fnCallback) { 
	var searchParam = new Array() ;
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
				                'aTargets': [0,3,6,7]                
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
											{"mDataProp":"position" ,"sWidth":"10%","sTitle": "<aebiz:showTitle titleId="customerstorelevel.m.position"/>"},
										
											{"mDataProp":"levelName" ,"sWidth":"15%","sTitle": "<aebiz:showTitle titleId="customerstorelevel.m.levelName"/>"},
											{
											  	"mDataProp":"imgUrl",
											  	"sWidth":"15%",
											  	"sDefaultContent":"",
											  	"sTitle": "<aebiz:showTitle titleId="customerstorelevel.m.levelIcon"/>" ,
											 	"fnRender": function(obj) {	
											 			var sReturn="";
											 			if(obj.aData.imgUrl!=""){
											 				sReturn ="<img src='"+obj.aData.imgUrl+"' width='15px' height='15px;' />";
											 			}
												      	return sReturn;
												 }			
											 },
											{"mDataProp":"buyTotalMoney" ,"sWidth":"10%","sTitle": "<aebiz:showTitle titleId="customerstorelevel.m.buyTotalMoney"/>"},
											{"mDataProp":"buyTotalCount" ,"sWidth":"10%","sTitle": "<aebiz:showTitle titleId="customerstorelevel.m.buyTotalCount"/>"},
											{"mDataProp":"description" ,"sWidth":"25%","sTitle": "<aebiz:showTitle titleId="customerstorelevel.m.description"/>"},

										  {
										  	"mDataProp":"operate",
										  	"sWidth":"10%",
										  	"sDefaultContent":"",
										  	"sTitle": "<aebiz:showTitle titleId="basebusiness.showmessage.operate"/>" ,
										 	"fnRender": function(obj) {	
											  		var sReturn = "<a href='${pageContext.servletContext.contextPath}/storeback/customerstorelevel/toUpdate/"+obj.aData.uuid+"' class='btn' rel='tooltip' title='<aebiz:showTitle titleId="basebusiness.showmessage.edit"/>'><aebiz:showTitle titleId="basebusiness.showmessage.edit"/></a>" ;
														sReturn += "<a href='javascript:removes(\""+obj.aData.uuid+"\");' class='btn' rel='tooltip' title='<aebiz:showTitle titleId="basebusiness.showmessage.delete"/>'><aebiz:showTitle titleId="basebusiness.showmessage.delete"/></a>" ;															
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
				            "sAjaxSource":"${pageContext.servletContext.contextPath}/storeback/customerstorelevel/queryList" ,
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
			    	"${pageContext.servletContext.contextPath}/storeback/customerstorelevel/deletes",
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