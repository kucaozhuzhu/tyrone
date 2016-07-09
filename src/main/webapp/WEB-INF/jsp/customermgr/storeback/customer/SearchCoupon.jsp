<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="aebiz" tagdir="/WEB-INF/tags"%>
<!--[if lt IE 8]>
<script src="${pageContext.servletContext.contextPath}/static/dealer/js/json2.js"></script>
<![endif]-->
<div class="row">
	<table class="table table-bordered table-hover table-nomargin table-striped dataTable dataTable-reorder">
		<thead>		
			<tr>
				<th class='with-checkbox'>
					<input type="checkbox" name="check_allCoupon" id="check_allCoupon">
				</th>
				<th><aebiz:showTitle titleId="coupontype.m.couponTypeName"/></th>
				<th><aebiz:showTitle titleId="coupontype.m.denomination"/></th>
				<th><aebiz:showTitle titleId="coupontype.m.startTime"/></th>
				<th><aebiz:showTitle titleId="coupontype.m.endTime"/></th>
				<th><aebiz:showTitle titleId="coupontype.m.scope"/></th>
				<th><aebiz:showTitle titleId="coupontype.m.issuedNum"/></th>
				<th><aebiz:showTitle titleId="coupontype.m.canIssuedNum"/></th>
				<th><aebiz:showTitle titleId="coupontype.m.limitNum"/></th>
				<th><aebiz:showTitle titleId="coupontype.m.collectType"/></th>
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
										      var sReturn = "<input type='checkbox' name='check_coupon' value='"+obj.aData.uuid+"' />";						      
										      return sReturn;
										 		}
										  },
											{"mDataProp":"couponTypeName" ,"sWidth":"20%","sTitle": "<aebiz:showTitle titleId="coupontype.m.couponTypeName"/>"},
											{"mDataProp":"denomination" ,"sWidth":"5%","sTitle": "<aebiz:showTitle titleId="coupontype.m.denomination"/>"},
											{"mDataProp":"startTime" ,"sWidth":"10%","sTitle": "<aebiz:showTitle titleId="coupontype.m.startTime"/>"},
											{"mDataProp":"endTime" ,"sWidth":"10%","sTitle": "<aebiz:showTitle titleId="coupontype.m.endTime"/>"},
											{
												"mDataProp":"scope",
												"sDefaultContent" : "",
												"sWidth":"10%",
												"sTitle" : "<aebiz:showTitle titleId="coupontype.m.scope"/>",
												"fnRender" : function(obj) {
													var sReturn = "";
													if (obj.aData.scope == "1") {
														sReturn = "<aebiz:showTitle titleId="coupontype.m.commonUse"/>";
													} else if(obj.aData.scope == "2"){
														sReturn = "<aebiz:showTitle titleId="coupontype.m.mobile"/>";
													}
													return sReturn;
												}
											},
											{"mDataProp":"issuedNum" ,"sWidth":"5%","sTitle": "<aebiz:showTitle titleId="coupontype.m.issuedNum"/>"},
											{"mDataProp":"canIssuedNum" ,"sWidth":"5%","sTitle": "<aebiz:showTitle titleId="coupontype.m.canIssuedNum"/>"},
											{"mDataProp":"limitNum" ,"sWidth":"5%","sTitle": "<aebiz:showTitle titleId="coupontype.m.limitNum"/>"},
											{
												"mDataProp":"collectType",
												"sDefaultContent" : "",
												"sWidth":"5%",
												"sTitle" : "<aebiz:showTitle titleId="coupontype.m.collectType"/>",
												"fnRender" : function(obj) {
													var sReturn = "";
													if (obj.aData.collectType == "0") {
														sReturn = "<aebiz:showTitle titleId="basebusiness.showmessage.no"/>";
													} else if(obj.aData.collectType == "1"){
														sReturn = "<aebiz:showTitle titleId="basebusiness.showmessage.yes"/>";
													}
													return sReturn;
												}
											},
										],
				            'oTableTools': {
				                "sSwfPath": "${pageContext.servletContext.contextPath}/static/js/plugins/datatable/swf/copy_csv_xls_pdf.swf"
				            },
				            "bRetrieve":true ,
				            "bProcessing":true,
				           	"bServerSide":true,                    //指定从服务器端获取数据
				            "sAjaxSource":"${pageContext.servletContext.contextPath}/sysback/coupontype/queryList" ,
										"fnServerData":retrieveData           //获取数据的处理函数  
				        };
				        
                		if ($(this).hasClass("dataTable-reorder")) {
		                    opt.sDom = "R" + opt.sDom;
		                }
		                oTable = $(this).dataTable(opt);
        	});
   		}         
	}
  	if('inittable' != operact) {  			
		oTable.fnDraw(); 	
	}   	  
}

$(document).ready(function() {
	 //初始化表格
   	 doSearch('inittable') ;
   	 //复选框全选
	 $("#check_allCoupon").click(function(e) {
	 		$('input', oTable.fnGetNodes()).prop('checked', this.checked);
	 });       
}) 
</script>
