<%@ page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/jsp/basebusiness/common/import/ListImport.jsp" %>

</head>

<body>
	<div class="container-fluid">	
		<div class="page-header">
			<div class="pull-left">
				<h1>user</h1>
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li>
					<span>system</span>
					<i class="fa fa-angle-right"></i>
				</li>
				<li>
					<span>user</span>
					<i class="fa fa-angle-right"></i>							
				</li>							
				<li>
					<span>userList</span>
				</li>						
			</ul>				
		</div>				
							
		<div class="row">
				<div class="col-sm-12">
					<div class="box">
						<div class="box-content nopadding y_tableser">
							<div class="y_clear">
								<div class="form-inline table_formnew">
								
									<div  class="form-group">
										<label class="control-label">name</label>
										<input type="text" name="name" id="name" class="form-control">
										<input type="hidden" name="name_q" id="name_q" class="form-control" value="Like">
									</div>
									
									
									<div class="form-group">
										<button class="btn btn-primary search" rel="tooltip">search</button>
										<button class="btn" onclick="javascript:clearSearch();" title="clear" rel="tooltip">clear</button>										
									</div>
								</div>
						</div>
						
						<table class="table table-bordered table-hover table-nomargin table-striped dataTable dataTable-reorder">
							<thead>		
								<tr>
									<th>uuid</th>
									<th>name</th>									
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
	
</body>

</html>

<script>
function retrieveData(sSource,aoData,fnCallback) { 
	var searchParam = new Array() ;
	searchParam.push({ "name": "name", "value": $.trim($("#name").val())});
	searchParam.push({ "name": "name_q", "value": $.trim($("#name_q").val())});	
	
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
				            	"sProcessing": "loading",
				                "sSearch": "<span>query:</span> ",
				                "sInfo": "pageFrom <span>_START_</span> pageTo <span>_END_</span> pageItem，totalCount： <span>_TOTAL_</span> pageItem",
				                "sLengthMenu": "_MENU_ <span>pageShow</span>" ,
				                "oPaginate": {
				                  "sFirst": "firstPage",
				                  "sPrevious": "prePage",
				                  "sNext": "nextPage",
				                  "sLast": "lastPage>"
				                }
				            },
				            'sDom': "rtlip",
				            'aoColumnDefs': [{
				                'bSortable': false,
				                'aTargets': [0]                
				            }],
				            "bSort": true, //排序功能            
					         	"aoColumns": [
											{"mDataProp":"uuid" ,"sTitle": "uuid"},
											{"mDataProp":"name","sTitle": "name"},											
										],
				            'oTableTools': {
				                "sSwfPath": "${pageContext.servletContext.contextPath}/static/js/plugins/datatable/swf/copy_csv_xls_pdf.swf"
				            },
				            "bRetrieve":true ,
				            "bProcessing":true,
				           	"bServerSide":true,                    //指定从服务器端获取数据
				            "sAjaxSource":"${pageContext.servletContext.contextPath}/sysback/sysUser/queryList" ,
							"fnServerData":retrieveData          //获取数据的处理函数  
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

function clearSearch() {
	$("#cityName").val("") ;
	$("#provinceUuid").val("") ;
}

$(document).ready(function() {
	//初始化表格
  doSearch('inittable') ;
   
	
	$(".search").click(function(){	
		doSearch('search') ;  
	})
}) 
</script>