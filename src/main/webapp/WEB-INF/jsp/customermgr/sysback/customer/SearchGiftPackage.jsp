<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<!--[if lt IE 8]>
<script src="${pageContext.servletContext.contextPath}/static/dealer/js/json2.js"></script>
<![endif]-->
<div class="row">
	<table class="table table-bordered table-hover table-nomargin table-striped dataTable dataTable-reorder">
		<thead>		
			<tr>
				<th class='with-checkbox'><input type="checkbox" name="check_allPackage" id="check_allPackage"></th>
				<th><aebiz:showTitle titleId="giftpackage.m.packageName"/></th>
				<th><aebiz:showTitle titleId="giftpackage.m.packageCount"/></th>
				<th><aebiz:showTitle titleId="giftpackage.m.integralCount"/></th>
				<th><aebiz:showTitle titleId="giftpackage.m.prizeType"/></th>
			</tr>
		</thead>
		
		<tbody>
		</tbody>
	</table>
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
				                'aTargets': [0]                
				            }],
				            "bSort": true, //排序功能            
					         	"aoColumns": [
										  {
										  	"mDataProp":"checkbox" ,
										  	"sDefaultContent":"",
										  	"sWidth":"3%",
										  	"fnRender": function(obj) {
										      var sReturn = "<input type='checkbox' name='giftPackage' value='"+obj.aData.uuid+"' />";						      
										      return sReturn;
										 		}
										  },
											{"mDataProp":"packageName" ,"sWidth":"20%","sTitle": "<aebiz:showTitle titleId="giftpackage.m.packageName"/>"},
											{"mDataProp":"packageCount" ,"sWidth":"10%","sTitle": "<aebiz:showTitle titleId="giftpackage.m.packageCount"/>"},
											{"mDataProp":"integralCount" ,"sWidth":"10%","sTitle": "<aebiz:showTitle titleId="giftpackage.m.integralCount"/>"},
											{
										  	"mDataProp":"prizeType",
										  	"sDefaultContent":"",
										  	"sWidth":"20%",
										  	"sTitle": "<aebiz:showTitle titleId="giftpackage.m.prizeType"/>" ,
										 	"fnRender": function(obj) {	
											  		return obj.aData.prizeTypeName;
											 }			
										  },
										],
				            'oTableTools': {
				                "sSwfPath": "${pageContext.servletContext.contextPath}/static/js/plugins/datatable/swf/copy_csv_xls_pdf.swf"
				            },
				            "bRetrieve":true ,
				            "bProcessing":true,
				           	"bServerSide":true,                    //指定从服务器端获取数据
				            "sAjaxSource":"${pageContext.servletContext.contextPath}/sysback/giftpackage/queryList" ,
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

$(document).ready(function() {
	 //初始化表格
	 doSearch('inittable') ;
	  
	 //复选框全选
	 $("#check_allPackage").click(function(e) {
	 	$('input', oTable.fnGetNodes()).prop('checked', this.checked);
	 });       
}) 
</script>