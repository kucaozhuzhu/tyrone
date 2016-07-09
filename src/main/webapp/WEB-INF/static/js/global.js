/*单选框模拟*/
$(function(){
	$(".r_radio").click(function(){
		$(this).toggleClass("r_selected").siblings(".r_radio").removeClass("r_selected");
		$(this).parent().siblings().find(".r_radio").removeClass("r_selected");
	});	
		
	//复选框优化
		$(".m_checkbox").click(function(){
			if($(this).attr("data-click")=="false"){
				return;
		  }else{
		  	$(this).toggleClass("m_checkbox_in");	
		  }
		});


//复选框优化
		$(".m_checkboxx").click(function(){
			if($(this).attr("data-click")=="false"){
				return;
		  }else{
		  	$(this).toggleClass("m_checkbox_in");	
		  }
		});
});

//收藏
		$(function(){
			$(".item .h_like").click(function(){
		  	$(this).toggleClass("h_likein");
	    });
		})